class AppError {
  final String? message;
  AppError(this.message);
  factory AppError.fromException(dynamic e, [StackTrace? s]) {
    if (e is AppError) {
      return e;
    }

    return AppError(e.toString());
  }
}
