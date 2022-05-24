abstract class AuthState {
  AuthState();
}

class AuthInitial extends AuthState {
  AuthInitial();
}

class AuthError extends AuthState {
  String msg;
  AuthError({required this.msg});
}

class AuthLoading extends AuthState {
  AuthLoading();
}

class AuthComplate extends AuthState {
  AuthComplate();
}
