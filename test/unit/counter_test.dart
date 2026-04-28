import 'package:flutter_test/flutter_test.dart';

class CounterTest {
  int count = 0;

  void incrementCount(int by) {
    count += by;
  }

  void decrementCount(int by) {
    count -= by;
  }

  void resetCount() {
    count = 0;
  }
}

void main() {
  // final counter = CounterTest();
  // test("Initial value should be 0", () {
  //   expect(counter.count, 0);
  // });

  // test('Counter should be incremented by 1', () {
  //   counter.incrementCount(1);
  //   expect(counter.count, 1);
  // });

  // test('Counter should be incremented by 5 ', () {
  //   counter.incrementCount(5);
  //   expect(counter.count, 6);
  // });

  // test('Counter should be decremented by 10', () {
  //   counter.decrementCount(10);
  //   expect(counter.count, -4);
  // });

  // test('Counter should be incremented by 4', () {
  //   counter.incrementCount(4);
  //   expect(counter.count, 0);
  // });

  // test('Counter should be incremented by 500', () {
  //   counter.incrementCount(500);
  //   expect(counter.count, 500);
  // });

  // test('Counter should be reset to 0', () {
  //   counter.resetCount();
  //   expect(counter.count, 0);
  // });

  late CounterTest counter;

  setUp(() {
    counter = CounterTest();
  });

  test('Counter should be incremented', () {
    counter.incrementCount(1);
    expect(counter.count, 1);
  });

  test('Counter should be decremented', () {
    counter.decrementCount(1);
    expect(counter.count, -1);
  });

  group('Increment', () {
    test('increment by 100', () {
      counter.incrementCount(100);
      expect(counter.count, 100);
    });
    test('increment by -100', () {
      counter.incrementCount(-100);
      expect(counter.count, -100);
    });
    test('increment by -500', () {
      counter.incrementCount(-500);
      expect(counter.count, -500);
    });
  });
}
