
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop_1/src/app.dart';
import 'package:flutter_workshop_1/src/bloc/login/login_bloc.dart';
import 'package:flutter_workshop_1/src/pages/routes.dart';

import '../../model/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _isObscurePassword = true;

  int _debugCounter = 0;

  @override
  void initState() {
    super.initState();
    _usernameController.text = "admin";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Text("Login Page ${state.count}");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(32),
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ..._buildFTextField(),
                    const SizedBox(height: 32),
                    ..._buildButton(),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return Text(
                            "Login Result: ${state.isAuthed ? "Success" : "Error"}",
                            style: TextStyle(
                              color: state.isAuthed ? Colors.green : Colors.red,
                            ));
                      },
                    ),
                    Row(
                      children: [
                        // Text("Debug: ${context.read<LoginBloc>().state.count}"), // not realtime update
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return Text("Debug: ${state.count}");
                          },
                        ),
                        IconButton(
                            // onPressed: _handleClickAdd,
                            onPressed: () =>
                                context.read<LoginBloc>().add(LoginEventAdd()),
                            icon: const Icon(Icons.add)),
                        IconButton(
                            // onPressed: _handleClickMinus,
                            onPressed: () =>
                                context.read<LoginBloc>().add(LoginEventRemove()),
                            icon: const Icon(Icons.remove))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildFTextField() {
    return [
      TextField(
        controller: _usernameController,
        decoration: const InputDecoration(
          labelText: "Username",
          icon: Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Icon(Icons.account_box),
          ),
        ),
      ),
      TextField(
        controller: _passwordController,
        decoration: const InputDecoration(
          labelText: "Password",
          icon: Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Icon(Icons.lock),
          ),
        ),
        obscureText: _isObscurePassword,
      ),
    ];
  }

  _buildButton() {
    return [
      ElevatedButton(
        onPressed: _handleClickLogin,
        child: const Text("Login"),
      ),
      OutlinedButton(
        onPressed: _handleClickClear,
        child: const Text("Clear"),
      ),
      OutlinedButton(
        onPressed: _handleClickRegister,
        child: const Text("Register"),
      ),
    ];
  }

  void _handleClickLogin() async {
    print("login (${_usernameController.text} : ${_passwordController.text})");

    final user = User(
      username: _usernameController.text,
      password: _passwordController.text,
    );
    context.read<LoginBloc>().add(LoginEventLogin(user));
    if (context.read<LoginBloc>().state.isAuthed) {
      // Navigator.pushNamed(context, AppRoute.home); // go and allow back
      if (navigatorState.currentContext != null) {
        Navigator.pushReplacementNamed(navigatorState.currentContext!, AppRoute.home);  // go and not allow back
      }
    }

  }

  void _handleClickClear() {
    _usernameController.text = "";
    _passwordController.text = "";
  }

  void _handleClickRegister() {
    Navigator.pushNamed(context, AppRoute.register);
  }

  void _handleClickAdd() {
    setState(() {
      _debugCounter++;
    });
  }

  void _handleClickMinus() {
    _debugCounter--;
    setState(() {});
  }
}
