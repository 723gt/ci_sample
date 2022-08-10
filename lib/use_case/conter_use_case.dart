import 'package:ci_sample/state/counter_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class CounterUseCase {
  void countUp();
}

class CounterUseCaseImp extends CounterUseCase {
  CounterUseCaseImp({required this.reader});
  final Reader reader;
  @override
  void countUp() {
    final currentCount = reader(counterStateProvider);
    reader(counterStateProvider.state).state = currentCount + 1;
  }
}

final counterUseCaseProvider = Provider<CounterUseCase>((ref) {
  return CounterUseCaseImp(reader: ref.read);
});
