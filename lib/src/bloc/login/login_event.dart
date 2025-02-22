part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEventAdd extends LoginEvent {}
class LoginEventRemove extends LoginEvent {}

class LoginEventLogin extends LoginEvent {
  final User payload;
  LoginEventLogin(this.payload);
}