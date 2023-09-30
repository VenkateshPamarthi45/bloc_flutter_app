import 'package:bloc_sample_1/counter_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterState {}

class InitialState extends CounterState {}

class UpdatedState extends CounterState {
  final int count;
  UpdatedState(this.count);
}

abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}

// Define the bloc

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc({required CounterUseCase counterUseCase})
      : _counterUseCase = counterUseCase,
        super(InitialState()) {
    on<IncrementCounterEvent>((event, emit) {
      if (state is InitialState) {
        var count = _counterUseCase.increaseCount(0);
        emit(UpdatedState(count));
      } else {
        var count =
            _counterUseCase.increaseCount((state as UpdatedState).count);
        emit(UpdatedState(count));
      }
    });
    on<DecrementCounterEvent>((event, emit) {
      if (state is InitialState) {
        var count = _counterUseCase.decreaseCount(0);
        emit(UpdatedState(count));
      } else {
        var count =
            _counterUseCase.decreaseCount((state as UpdatedState).count);
        emit(UpdatedState(count));
      }
    });
  }
  final CounterUseCase _counterUseCase;
}
