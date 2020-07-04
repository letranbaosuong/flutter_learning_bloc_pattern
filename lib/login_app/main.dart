import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning_app/login_app/src/app.dart';
import 'package:flutter_bloc_learning_app/login_app/src/bloc/bloc.dart';
import 'package:flutter_bloc_learning_app/login_app/src/models/models.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();

  runApp(
    BlocProvider(
      create: (BuildContext context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AuthenticationStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
}
