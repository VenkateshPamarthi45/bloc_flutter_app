import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'screenb_event.dart';
part 'screenb_state.dart';

class ScreenbBloc extends Bloc<ScreenbEvent, ScreenbState> {
  ScreenbBloc() : super(ScreenbInitial()) {
    on<ScreenbEvent>((event, emit) {
      print(event);
    });
  }
}
