/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2025-02-22 14:17:31
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2025-03-08 14:39:19
 * @FilePath: /flutter-packages/pubupgrade/lib/pubupgrade.dart
 * 
 * Copyright (c) 2025 by A kingiswinter@gmail.com, All Rights Reserved.
 */
import 'dart:io';

import 'package:cli_util/cli_logging.dart';
import 'package:path/path.dart' as p;
import 'package:process_run/process_run.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

// 使用 final 声明不可变变量
final Logger logger = Logger.standard();
final PubClient client = PubClient();

/// 获取当前工作目录下的 pubspec.yaml 文件路径
/// 如果未找到，记录错误信息并返回 null
String? _getPubspecPath() {
  try {
    final results = Shell().runSync('pwd');
    if (results.isEmpty) {
      _logError('No pubspec.yaml found.');
      return null;
    }
    final path = p.join(results.first.outText.trim(), 'pubspec.yaml');
    if (!File(path).existsSync()) {
      _logError('No pubspec.yaml found.');
      return null;
    }
    return path;
  } catch (e) {
    _logError('Error getting pubspec path: $e');
    return null;
  }
}

/// 检查所有依赖（包括普通依赖和开发依赖）
Future<void> checkAll() async {
  final path = _getPubspecPath();
  if (path == null) {
    return;
  }
  await checkDependencies(path);
  await checkDevDependencies(path);
}

/// 检查普通依赖
Future<void> checkDependencies([String? pubspec]) async {
  final path = pubspec ?? _getPubspecPath();
  if (path == null) {
    return;
  }
  logInfo('Checking regular dependencies...');
  final dependencies = _getDependencies(path, isDev: false);
  final packages = await _queryLastVersions(dependencies);
  await _updatePubspec(packages, path, false);
}

/// 检查开发依赖
Future<void> checkDevDependencies([String? pubspec]) async {
  final path = pubspec ?? _getPubspecPath();
  if (path == null) {
    return;
  }
  logInfo('Checking development dependencies...');
  final dependencies = _getDependencies(path, isDev: true);
  final packages = await _queryLastVersions(dependencies);
  await _updatePubspec(packages, path, true);
}

/// 获取指定 pubspec.yaml 文件中的依赖
Map<String, Dependency> _getDependencies(String path, {bool isDev = false}) {
  final pubspecStr = File(path).readAsStringSync();
  final pubspec = Pubspec.parse(pubspecStr);
  return isDev ? pubspec.devDependencies : pubspec.dependencies;
}

/// 查询依赖的最新版本
Future<Map<String, List<String>>> _queryLastVersions(
  Map<String, Dependency> dependencies,
) async {
  final results = <String, List<String>>{};
  for (final entry in dependencies.entries) {
    if (entry.value is HostedDependency) {
      final version = (entry.value as HostedDependency).version.toString();
      if (!version.contains('^')) {
        continue;
      }
      final progress = logger.progress('Checking [${entry.key}]...');
      try {
        final package = await client.packageInfo(entry.key);
        final currentVersion = version.replaceFirst('^', '');
        if (currentVersion != package.latest.version) {
          logStrong(
            '${entry.key} can be upgraded from $currentVersion to ${package.latest.version}.',
          );
          results[entry.key] = [version, package.latest.version];
        }
      } catch (e) {
        _logError('Error querying latest version for ${entry.key}: $e');
      } finally {
        progress.finish(showTiming: true);
      }
    }
  }
  return results;
}

/// 更新 pubspec.yaml 文件中的依赖版本
Future<void> _updatePubspec(
  Map<String, List<String>> packages,
  String pubspecPath,
  bool isDev,
) async {
  if (packages.isNotEmpty) {
    final file = File(pubspecPath);
    var yaml = file.readAsStringSync();
    for (final key in packages.keys) {
      final oldVersion = packages[key]!.first.replaceFirst('^', '');
      final newVersion = packages[key]!.last;
      logStrong('Upgrading $key: $oldVersion -> $newVersion');
      yaml = yaml.replaceAll('$key: ^$oldVersion', '$key: ^$newVersion');
    }
    file.writeAsStringSync(yaml);
    logStrong(
      '${isDev ? 'Development' : 'Regular'} dependencies upgraded ${packages.keys.length} packages.',
    );
  } else {
    logStrong(
      '${isDev ? 'Development' : 'Regular'} dependencies have no packages to upgrade.',
    );
  }
}

/// 记录普通信息日志
void logInfo(String msg) {
  logger.stdout(msg);
}

/// 记录强调信息日志
void logStrong(String msg) {
  logger.stdout(logger.ansi.emphasized(msg));
}

/// 记录错误信息日志
void _logError(String msg) {
  logger.stdout(logger.ansi.error(msg));
}
