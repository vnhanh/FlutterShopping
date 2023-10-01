
class ApiError {
  final int? code;
  final String? error;

  const ApiError({required this.code, this.error});

  static ApiError getUnknownError() {
    return const ApiError(code : -1);
  }
}