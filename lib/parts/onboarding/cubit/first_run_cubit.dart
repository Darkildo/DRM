part of "../onboarding_part.dart";

class FirstRunCubit extends Cubit<FirstRunState> {
  final AppLogger _logger;
  FirstRunCubit(this._logger) : super(FirstRunInitial()) {
    try {
      SharedPreferences.getInstance().then((prefs) async {
        final firstRun = prefs.getBool('isFirstRun');
        if (firstRun == null) {
          emit(FirstRunLoaded(isFirstRun: true));
          await prefs.setBool(Constants.firstRunStorageKey, true);
        } else {
          emit(FirstRunLoaded(isFirstRun: false));
        }
        return;
      });
    } catch (e, s) {
      _logger.error(
        LoggerRecord(
          'Failed to get first run value',
          name: 'FirstRunCubit -> constructor',
          error: AppError.fromException(e),
          stackTrace: s,
        ),
      );
      emit(FirstRunLoaded(isFirstRun: true));
    }
  }
}

extension FirstRunCubitBuildContextX on BuildContext {
  FirstRunCubit get rirstRunCubit => read<FirstRunCubit>();

  FirstRunCubit get watchFirstRunCubit => watch<FirstRunCubit>();
}
