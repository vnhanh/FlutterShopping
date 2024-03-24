

import 'dart:async';

import 'package:shopping/common/bloc/bloc_constant.dart';
import 'package:shopping/home_products/data/remote/api/home_products_api.dart';

class HomeProductsRepository {
  final api = HomeProductApi();

  final controller = StreamController<ApiState>();

  Stream<ApiState> get status async* {
    yield LoadingApiState();

    try {
      final response = await api.loadAll();
      yield SuccessApiData(data: response);
    } on Exception catch (e) {
      // create debug environment
      if (true) {
        print("Caught exception while calling api get all home products data with error ${e.toString()}");
      }
      yield FailedApiData(code: -1, message: e.toString());
    }

    yield* controller.stream;
  }
}
