import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// Cinco eventos:
// Cambio en el correo electrónico - Email changed
class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged: {email: $email}';
}

// Cambio en la contraseña - Password changed
class PasswordChanged extends LoginEvent {
  final String _password;

  PasswordChanged({@required String password}): _password = password;

  @override
  List<Object> get props => [_password];

  @override
  String toString() => 'PasswordChanged: {password: $_password}';

  String get password => _password;
}

// Enviado - Submitted
class Submitted extends LoginEvent {
  final String _email;
  final String _password;

  Submitted({@required String email, @required String password})
      : _email = email,
        _password = password;

  @override
  List<Object> get props => [_email, _password];

  @override
  String toString() => 'Submitted: {email: $_email, password: $_password}';

  String get email => _email;
  String get password => _password;
}

// Logueo con Google - Login with Google pressed
class LoginWithGooglePressed extends LoginEvent {}

// Logueo con credenciales - Login with credentials
class LoginWithCredentialsPressed extends LoginEvent {
  final String _email;
  final String _password;

  LoginWithCredentialsPressed(
      {@required String email, @required String password})
      : _email = email,
        _password = password;

  @override
  List<Object> get props => [_email, _password];

  @override
  String toString() =>
      'LoginWithCredentials: {email: $_email, password: $_password}';

  String get email => _email;
  String get password => _password;
}
