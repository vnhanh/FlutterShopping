

const int STATUS_IDLE = 0;
const int STATUS_LOADING = 1;
const int STATUS_SUCCESS = 2;
const int STATUS_FAILED = 3;

sealed class ApiState {
  const ApiState();
}

final class LoadingApiState extends ApiState {}

final class IdleApiState extends ApiState {}

final class SuccessApiData<T> extends ApiState {
  final T? data;

  const SuccessApiData({required this.data});
}

final class FailedApiData extends ApiState {
  final int? code;

  final String? message;

  const FailedApiData({required this.code, required this.message});

}