
enum RecentlyViewedType {
  unknown(-1), product(0), shop(1);

  final int value;

  const RecentlyViewedType(this.value);

  bool operator <(RecentlyViewedType type) => value < type.value;
  bool operator >(RecentlyViewedType type) => value > type.value;
}

/// T can be shop, product or whatever
class RecentlyViewedModel<T> {
  String? thumbnail;

  bool liked = false;

  RecentlyViewedType type = RecentlyViewedType.unknown;

  T? data;
}
