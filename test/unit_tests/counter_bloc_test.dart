import 'package:bloc_sample_1/counter_usecase.dart';
import 'package:bloc_sample_1/states.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('CounterBloc', () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc(counterUseCase: CounterUseCase());
    });

    test('initial value must be initial State', () {
      expect(InitialState, counterBloc.state);
    });

    blocTest(
      'when increment button pressed updated state must be given',
      build: () => counterBloc,
      act: (bloc) => bloc.add(IncrementCounterEvent()),
      expect: () => UpdatedState,
    );
  });
}
