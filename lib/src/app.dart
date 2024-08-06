import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop_1/src/bloc/login/login_bloc.dart';
import 'package:flutter_workshop_1/src/pages/login/login_page.dart';
import 'package:flutter_workshop_1/src/pages/routes.dart';


final navigatorState = GlobalKey<NavigatorState>();

class Workshop1App extends StatelessWidget {
  const Workshop1App({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider(create: (context) => LoginBloc());

    return MultiBlocProvider(
      providers: [loginBloc],
      child: MaterialApp(
        title: "CMApp",
        routes: AppRoute.all,
        home: const LoginPage(),
        navigatorKey: navigatorState,
      ),
    );
  }
}
