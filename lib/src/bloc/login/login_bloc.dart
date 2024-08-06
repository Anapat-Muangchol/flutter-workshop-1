import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_workshop_1/src/model/user.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {

    // Add count
    on<LoginEventAdd>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      emit(state.setCount(state.count + 1));
    });

    // Minus count
    on<LoginEventRemove>((event, emit) async {
      if (state.count == 0) {
        return;
      }
      if (state.count < 0) {
        await Future.delayed(const Duration(seconds: 1));
        emit(state.setCount(0));
        return;
      }
      await Future.delayed(const Duration(seconds: 1));
      emit(state.setCount(state.count - 1));
    });

    // Login
    on<LoginEventLogin>((event, emit) async {
      if (event.payload.username == 'admin' && event.payload.password == '1234') {
        emit(state.setIsAuthed(true));
      } else {
        emit(state.setIsAuthed(false));
      }
      await Future.delayed(const Duration(seconds: 1));
    });

  }
}
