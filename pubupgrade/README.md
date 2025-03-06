# pubupgrade

## Project Overview

`pubupgrade` is a tool designed to check and upgrade the versions of dependencies in the `pubspec.yaml` file of Dart projects.

## Features

- **Automatic Checking**: Automatically checks the versions of dependencies starting with `^` in the `pubspec.yaml` file.
- **Version Updating**: If a newer version of a dependency is available, it updates the version number in the `pubspec.yaml` file to the latest version.
- **Logging Output**: Provides detailed log information during the checking and updating process, allowing you to clearly see which dependencies can be upgraded.

## Installation

Add the following to your project's `pubspec.yaml` file:

```yaml
dev_dependencies:
  pubupgrade: ^1.0.0+5
```

Then run `dart pub get` to fetch the dependency.

## Usage

```
dart run pubupgrade [-a | -A | -d | -D]
```

- **Without any option**: Only checks regular dependencies.
- **-a or -A**: Checks both regular dependencies and development dependencies.
- **-d or -D**: Only checks development dependencies.

## Contribution Guidelines

If you find any issues or have suggestions for improvement, please feel free to submit an Issue or a Pull Request.

## License

```
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
