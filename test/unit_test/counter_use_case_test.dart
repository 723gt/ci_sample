import 'package:ci_sample/state/counter_state.dart';
import 'package:ci_sample/use_case/conter_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  test("count Up", () {
    final container = ProviderContainer();
    expect(container.read(counterStateProvider), 0);
    container.read(counterUseCaseProvider).countUp();
    expect(container.read(counterStateProvider), 7);
  });
}
