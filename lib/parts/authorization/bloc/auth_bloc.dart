part of "../auth_part.dart";

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;
  final AppLogger _logger;
  AuthBloc(this._authRepository, this._logger) : super(AuthLoadInProgress()) {
    on<LogAuthEvent>(_onLogAuthEvent);
    on<UnLogAuthEvent>(_onUnLogAuthEvent);
    on<ReloadAuthEvent>(_onReloadAuthEvent);
  }

  FutureOr<void> _onLogAuthEvent(
    LogAuthEvent event,
    Emitter<AuthState> emit,
  ) async {}
  FutureOr<void> _onUnLogAuthEvent(
    UnLogAuthEvent event,
    Emitter<AuthState> emit,
  ) async {}
  FutureOr<void> _onReloadAuthEvent(
    ReloadAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    String? pKey;
    try {
      emit(AuthLoadInProgress());
      pKey = await _authRepository.getPrivateKey();
    } catch (e, s) {
      _logger.error(
        LoggerRecord(
          'Failed to get Private key',
          name: '_authRepository -> getPrivateKey()',
          error: AppError.fromException(e),
          stackTrace: s,
        ),
      );
    }
    if (pKey == null) {
      emit(AuthUnLogged());
      return;
    }
    try {
      final account = AptosAccount.fromPrivateKey(pKey);
      pKey = '';
      emit(AuthLogged(accounts: [account]));
      return;
    } catch (e, s) {
      _logger.error(
        LoggerRecord(
          'Failed to get account from private key',
          name: 'AptosAccount -> fromPrivateKey()',
          error: AppError.fromException(e),
          stackTrace: s,
        ),
      );
    }
    if (pKey == null) {
      emit(AuthUnLogged());
      return;
    }

    emit(AuthUnLogged());
    return;
  }
}
