class AuthException implements Exception{
  static const Map<String, String> errors ={
    'INVALID_LOGIN_CREDENTIALS': 'E-mail ou senha inválido(s)!',
    'EMAIL_EXISTS': 'E-mail já cadastrado.',
    'INVALID_EMAIL': 'E-mail ou senha inválido(s)!',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida!',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'Acesso bloqueado temporariamente. Tente novamente mais tarde.',
    'USER_DISABLED': 'Conta de usuário desabilitada.',
  };
  
  final String key;

  AuthException(this.key);

  @override
  String toString(){
    return errors[key] ?? 'Ocorreu um erro! $key';
  }
}