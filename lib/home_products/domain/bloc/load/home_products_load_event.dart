
import 'package:equatable/equatable.dart';

sealed class HomeProductsLoadEvent extends Equatable {
  const HomeProductsLoadEvent();
}

final class HomeProductsLoadRequested extends HomeProductsLoadEvent {
  final String? userId;

  const HomeProductsLoadRequested(this.userId);

  @override
  List<Object?> get props => [userId];
}

final class HomeProductsReloadRequested extends HomeProductsLoadEvent {
  final String? userId;

  const HomeProductsReloadRequested(this.userId);

  @override
  List<Object?> get props => [userId];
}
