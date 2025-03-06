# pubupgrade

## 项目概述

`pubupgrade` 主要用于检查并升级项目中 `pubspec.yaml` 文件里的依赖项版本。

## 功能特性

- **自动检查**：该应用程序会自动检查 `pubspec.yaml` 文件中以 `^` 开头的依赖项版本。
- **版本更新**：如果发现有依赖项有新版本可用，会将其版本号更新到最新版本。
- **日志输出**：在检查和更新过程中，会输出详细的日志信息，让你清楚知道哪些依赖项可以升级。

## 安装

```yaml
dev_dependencies:
  pubupgrade: ^1.0.0+5
```

## 使用方法
```
dart run pubupgrade [-a | -A | -d | -D]
```
- 不使用任何选项：仅检查普通依赖项。
- `-a` 或 `-A`：检查普通依赖项和开发依赖项。
- `-d` 或 `-D`：仅检查开发依赖项。

## 贡献指南

如果你发现了任何问题或者有改进的建议，欢迎提交 Issue 或者 Pull Request。

## 许可证

``` MIT License
MIT License

Copyright (c) 2025 A

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```