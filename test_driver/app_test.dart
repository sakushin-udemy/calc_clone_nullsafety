import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'package:intl/intl.dart' as intl;

void main() {
  late final FlutterDriver driver;
  final SerializableFinder key1Finder = find.text('1');
  final SerializableFinder key2Finder = find.text('2');
  final SerializableFinder key3Finder = find.text('3');
  final SerializableFinder key4Finder = find.text('4');
  final SerializableFinder key5Finder = find.text('5');
  final SerializableFinder key6Finder = find.text('6');
  final SerializableFinder key7Finder = find.text('7');
  final SerializableFinder key8Finder = find.text('8');
  final SerializableFinder key9Finder = find.text('9');
  final SerializableFinder key0Finder = find.text('0');
  final SerializableFinder keyDotFinder = find.text('.');
  final SerializableFinder keyClearFinder = find.text('C');

  final SerializableFinder txtResultFinder = find.byValueKey('txtResult');
  final SerializableFinder plusFinder = find.byValueKey('+');
  final SerializableFinder minusFinder = find.byValueKey('-');
  final SerializableFinder multplyFinder = find.byValueKey('x');
  final SerializableFinder divideFinder = find.byValueKey('/');
  final SerializableFinder equalsFinder = find.byValueKey('=');

  const String pathScreenshot = './test_driver/screenshots';
  final intl.DateFormat dateFormat = intl.DateFormat('yyyyMMdd_HHmmss');
  late final String fullDir;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    final health = await driver.checkHealth();
    if (health.status == HealthStatus.bad) {
      fail('Flutter driverが起動せず');
    }

    DateTime now = DateTime.now();
    String dir = dateFormat.format(now);
    fullDir = '$pathScreenshot/$dir';
    Directory(fullDir).create(recursive: true);
  });
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  setUp(() async {});
  tearDown(() async {
    await driver.tap(keyClearFinder);
  });

  Future<void> _screenshot(FlutterDriver driver, String testName) async {
    await driver.waitUntilNoTransientCallbacks();
    final pixels = await driver.screenshot();
    final file = File('$fullDir/$testName.png');
    await file.writeAsBytes(pixels);
  }

  test('数字をタップ', () async {
    expect(await driver.getText(txtResultFinder), '0');
    await driver.tap(key1Finder);
    expect(await driver.getText(txtResultFinder), '1');
    await driver.tap(key2Finder);
    expect(await driver.getText(txtResultFinder), '12');
    await driver.tap(key3Finder);
    expect(await driver.getText(txtResultFinder), '123');
    await driver.tap(key4Finder);
    expect(await driver.getText(txtResultFinder), '1,234');
    await driver.tap(key5Finder);
    expect(await driver.getText(txtResultFinder), '12,345');
    await driver.tap(key6Finder);
    expect(await driver.getText(txtResultFinder), '123,456');
    await driver.tap(key7Finder);
    expect(await driver.getText(txtResultFinder), '1,234,567');
    await driver.tap(key8Finder);
    expect(await driver.getText(txtResultFinder), '12,345,678');
    await driver.tap(key9Finder);
    expect(await driver.getText(txtResultFinder), '123,456,789');
    await driver.tap(key0Finder);
    expect(await driver.getText(txtResultFinder), '123,456,789');
    _screenshot(driver, 'test1');
  });

  test('初期化', () async {
    expect(await driver.getText(txtResultFinder), '0');
    _screenshot(driver, 'test2');
  });

  test('2x3+4x5=26', () async {
    expect(await driver.getText(txtResultFinder), '0');
    await driver.tap(key2Finder);
    await driver.tap(multplyFinder);
    await driver.tap(key3Finder);
    await driver.tap(plusFinder);
    await driver.tap(key4Finder);
    await driver.tap(multplyFinder);
    await driver.tap(key5Finder);
    await driver.tap(equalsFinder);
    expect(await driver.getText(txtResultFinder), '26');
  });

  test('2x3-20/5=2', () async {
    expect(await driver.getText(txtResultFinder), '0');
    await driver.tap(key2Finder);
    await driver.tap(multplyFinder);
    await driver.tap(key3Finder);
    await driver.tap(minusFinder);
    await driver.tap(key2Finder);
    await driver.tap(key0Finder);
    await driver.tap(divideFinder);
    await driver.tap(key5Finder);
    await driver.tap(equalsFinder);
    expect(await driver.getText(txtResultFinder), '2');
  });
}
