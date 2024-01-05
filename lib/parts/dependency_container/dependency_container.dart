import 'package:drm/parts/authorization/auth_part.dart';
import 'package:drm/parts/logger/logger_kit.dart';
import 'package:drm/parts/onboarding/onboarding_part.dart';

typedef DIC = DependencyContainer;

class DependencyContainer {
  static final DependencyContainer _i = DependencyContainer._internal();
  factory DependencyContainer() => _i;
  DependencyContainer._internal();

  final IAuthRepository authRepository = AuthRepository();

  final logger = initializeDeLog();

  late final AuthBloc authBloc = AuthBloc(authRepository, logger);

  late final FirstRunCubit firstRunCubit = FirstRunCubit(logger);
}
