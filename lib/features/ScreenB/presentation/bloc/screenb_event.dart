part of 'screenb_bloc.dart';

abstract class ScreenbEvent extends Equatable {
  const ScreenbEvent();

  @override
  List<Object> get props => [];
}

class ScreenBInitial extends ScreenbEvent {}
