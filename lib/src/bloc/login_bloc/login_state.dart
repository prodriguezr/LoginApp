class LoginState {
  // Declaración de variables
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid;

  // Constructor
  LoginState(
      {this.isEmailValid,
      this.isPasswordValid,
      this.isSubmitting,
      this.isSuccess,
      this.isFailure});

  // Cuatro estados:
  // - Vacio - empty
  factory LoginState.empty() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isFailure: false,
      isSubmitting: false,
      isSuccess: false,
    );
  }
  // - Cargando - loading
  factory LoginState.loading() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isFailure: false,
      isSuccess: false,
    );
  }

  // - Fallo - failure
  factory LoginState.failure() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isFailure: true,
      isSuccess: false,
    );
  }

  // - Exito - success
  factory LoginState.success() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isFailure: false,
      isSuccess: true,
    );
  }

  // Funciones adicionales: copywith - update
  LoginState copyWith(bool isEmailValid, bool isPaswordValid, bool isSubmitting,
      bool isFailure, bool isSuccess) {
        return LoginState(
          isEmailValid: isEmailValid ?? this.isEmailValid,
          isSuccess: isSuccess ?? this.isSuccess,
          isSubmitting: isSubmitting ?? this.isSubmitting,
          isFailure: isFailure ?? this.isFailure,
          isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        );
      }

  LoginState update({bool isEmailValid, bool isPasswordValid = false}) {
    return copyWith(isEmailValid, isPasswordValid, false, false, false);
  }

  @override
  String toString() {
    return ''' LoginState {
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isFailure: $isFailure,
      isSuccess: $isSuccess,
    }
    ''';
  }
}
