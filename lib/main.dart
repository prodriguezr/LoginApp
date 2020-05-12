import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/src/bloc/auth_bloc/bloc.dart';
import 'package:flutter_firebase_login/src/bloc/simple_bloc_delegate.dart';
import 'package:flutter_firebase_login/src/repository/user_repository.dart';
import 'package:flutter_firebase_login/src/ui/home_screen.dart';
import 'file:///D:/Pablo/workspace/flutter_firebase_login/lib/src/ui/login/login_screen.dart';
import 'package:flutter_firebase_login/src/ui/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UserRepository userRepository = UserRepository();

  runApp(BlocProvider(
    create: (context) =>
        AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized)
            return SplashScreen();
          if (state is Authenticated)
            return HomeScreen(name: state.displayName);
          else if (state is Unauthenticated) 
            return LoginScreen(userRepository: _userRepository,);
        },
      ),
    );
  }
}
