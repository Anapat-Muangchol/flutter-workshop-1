part of 'login_bloc.dart';

enum AuthedStatus { init, success, failed }

class LoginState extends Equatable {
  final int count;
  final bool isAuthed;

  // const LoginState({required this.count});
  const LoginState({this.count = 0, this.isAuthed = false});

  LoginState setCount(int? count) {
    return LoginState(
      count: count ?? this.count,
      isAuthed: isAuthed,
    );
  }

  LoginState setIsAuthed(bool? isAuthed) {
    return LoginState(
      count: count,
      isAuthed: isAuthed ?? this.isAuthed,
    );
  }

  @override
  List<Object?> get props => [count, isAuthed];
}
