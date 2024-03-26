import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping/home_products/domain/bloc/load/home_products_load_event.dart';
import 'package:shopping/home_products/domain/bloc/load/home_products_load_state.dart';
import 'package:shopping/home_products/data/remote/repository/home_products_repository.dart';

class HomeProductsLoadBloc extends Bloc<HomeProductsLoadEvent, HomeProductsLoadState> {

  // final StreamSubscription<HomeProductsLoadState> subscription;

  final HomeProductsRepository repository;

  HomeProductsLoadBloc({required this.repository}) : super(const HomeProductsLoadState.idle()) {
    on<HomeProductsLoadRequested>(_onLoadRequested);
  }

  Future<void> _onLoadRequested(
      HomeProductsLoadRequested event,
      Emitter<HomeProductsLoadState> emit,
  ) async {
    print("TestAlan - event $event");
    emit(const HomeProductsLoadState.loading());
  }
}
