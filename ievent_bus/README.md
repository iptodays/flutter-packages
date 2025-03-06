# IEventBus

## Introduction
`IEventBus` is a simple and efficient event bus implementation in Dart, designed for Flutter applications. It provides a convenient way to implement event-driven programming, allowing different parts of your application to communicate and interact with each other without direct dependencies.

## Features
- **Simple API**: Easy to use, with only a few methods to add listeners, remove listeners, and send events.
- **Flexible Event Handling**: Supports passing any type of data as event arguments.
- **Singleton Pattern**: Ensures that there is only one instance of the event bus throughout the application.

## Installation
Add the following line to your `pubspec.yaml` file:
```yaml
dependencies:
  ievent_bus: ^0.0.2
```
Then run `flutter pub get` in your project directory.

## Usage
### 1. Import the library
```dart
import 'package:ievent_bus/ievent_bus.dart';
```

### 2. Get the instance of the event bus
```dart
IEventBus eventBus = IEventBus.instance;
```

### 3. Add a listener
```dart
eventBus.addListener(
  key: 'your_event_key',
  callback: (args) {
    // Handle the event
    print('Received event with args: $args');
  },
);
```

### 4. Send an event
```dart
eventBus.commit(
  key: 'your_event_key',
  arg: 'Hello, EventBus!',
);
```

### 5. Remove a listener
```dart
eventBus.removeListener('your_event_key');
```

## Example
```dart
import 'package:ievent_bus/ievent_bus.dart';

void main() {
  IEventBus eventBus = IEventBus.instance;

  // Add a listener
  eventBus.addListener(
    key: 'test_event',
    callback: (args) {
      print('Received test event with args: $args');
    },
  );

  // Send an event
  eventBus.commit(
    key: 'test_event',
    arg: {'message': 'This is a test message'},
  );

  // Remove the listener
  eventBus.removeListener('test_event');
}
```

## API Reference
### `IEventBus` class
- **`factory EasyEventBus()`**: Returns the singleton instance of the event bus.
- **`static EasyEventBus get instance`**: Returns the singleton instance of the event bus.
- **`void addListener({required String key, required EventCallback callback})`**: Adds a listener for the specified event key.
- **`void removeListener(String key)`**: Removes the last added listener for the specified event key.
- **`void commit({required String key, dynamic arg})`**: Sends an event with the specified key and arguments.

### `EventCallback` typedef
```dart
typedef EventCallback = void Function(dynamic args);
```
A callback function that takes a dynamic argument, which is the data passed with the event.

## License
``` MIT
MIT License

Copyright (c) 2024 A

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