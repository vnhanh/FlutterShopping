import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping/home_products/domain/bloc/load/home_products_load_event.dart';
import 'package:shopping/home_products/domain/bloc/load/home_products_load_state.dart';

class HomeProductsLoadBloc extends Bloc<HomeProductsLoadEvent, HomeProductsLoadState> {
  // final StreamSubscription<HomeProductsLoadState> subscription;

  HomeProductsLoadBloc() : super(const HomeProductsLoadState.idle()) {

  }

  Future<void> _onLoadRequested(
      HomeProductsLoadEvent event,
      Emitter<HomeProductsLoadState> emitter,
  ) async {
    switch (event) {
      case HomeProductsLoadRequested:
        return emit(const HomeProductsLoadState.loading());

      case HomeProductsReloadRequested:
        return emit(const HomeProductsLoadState.loading());

      default:
        return emit(const HomeProductsLoadState.idle());
    }
  }
}
