/*
 * @Author: iptoday wangdong1221@outlook.com
 * @Date: 2022-05-24 13:32:03
 * @LastEditors: A kingiswinter@gmail.com
 * @LastEditTime: 2025-03-06 14:12:56
 * @FilePath: /flutter-packages/ievent_bus/test/ievent_bus_test.dart
 * 
 * Copyright (c) 2022 by iptoday wangdong1221@outlook.com, All Rights Reserved. 
 */
import 'package:ievent_bus/ievent_bus.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () {
    IEventBus.instance.commit(key: '');
  });
}
