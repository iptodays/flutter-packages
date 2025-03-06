/*
 * @Author: A kingiswinter@gmail.com
 * @Date: 2025-02-22 14:17:31
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2025-03-06 15:38:05
 * @FilePath: /flutter-packages/pubupgrade/bin/pubupgrade.dart
 * 
 * Copyright (c) 2025 by A kingiswinter@gmail.com, All Rights Reserved.
 */
import 'package:pubupgrade/pubupgrade.dart' as pubupgrade;

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    pubupgrade.checkDependencies();
    return;
  }
  String comm = arguments.first.toLowerCase();
  if (comm == '-d') {
    pubupgrade.checkDevDependencies();
    return;
  }
  if (comm == '-a') {
    pubupgrade.checkAll();
    return;
  }
  pubupgrade.logStrong('''Usage: pubupgrade [-a | -A | -d | -D]
  Without any option: Only check dependencies packages
  -a | -A: Check dependencies & dev_dependencies packages
  -d | -D: Only Check dev_dependencies''');
}
