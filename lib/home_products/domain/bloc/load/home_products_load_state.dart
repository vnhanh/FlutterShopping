import 'package:shopping/common/bloc/bloc_constant.dart';

class HomeProductsLoadState {
  final int status;

  const HomeProductsLoadState._({this.status = STATUS_IDLE});

  const HomeProductsLoadState.idle() : this._(status: STATUS_IDLE);

  const HomeProductsLoadState.loading() : this._(status: STATUS_LOADING);

  const HomeProductsLoadState.failed() : this._(status: STATUS_FAILED);

  const HomeProductsLoadState.success() : this._(status: STATUS_SUCCESS);
}
