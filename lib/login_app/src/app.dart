import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learning_app/login_app/src/bloc/bloc.dart';
import 'package:flutter_bloc_learning_app/login_app/src/models/models.dart';
import 'package:flutter_bloc_learning_app/login_app/src/views/views.dart';

class App extends StatelessWidget {
  final UserRepository userRepository;

  const App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial) {
            return SplashPage();
          }

          if (state is AuthenticationSuccess) {
            return HomePage();
          }

          if (state is AuthenticationFailure) {
            return LoginPage(
              userRepository: userRepository,
            );
          }

          if (state is AuthenticationInProgress) {
            return LoadingIndicator();
          }

          return Center(
            child: Text('No Action'),
          );
        },
      ),
    );
  }
}
