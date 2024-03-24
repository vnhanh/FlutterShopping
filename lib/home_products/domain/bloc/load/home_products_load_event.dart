
sealed class HomeProductsLoadEvent {
  const HomeProductsLoadEvent();
}

final class HomeProductsLoadRequested extends HomeProductsLoadEvent {
  final String? userId;

  const HomeProductsLoadRequested(this.userId);
}

final class HomeProductsReloadRequested extends HomeProductsLoadEvent {
  final String? userId;

  const HomeProductsReloadRequested(this.userId);
}
