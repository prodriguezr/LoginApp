import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
 }

// 3 estados:
// App started
class AppStarted extends AuthenticationEvent { }
// LoggedIn
class LoggedIn extends AuthenticationEvent { }
// LoggedOut
class LoggedOut extends AuthenticationEvent { }
