

class ExploreProductResponse {
  final String? id;

  final bool liked;

  final String? thumbnailUrl;

  const ExploreProductResponse({
    required this.id,
    required this.liked,
    required this.thumbnailUrl,
  });

  const ExploreProductResponse.empty() : this(id: null, liked: false, thumbnailUrl: null);

  factory ExploreProductResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String? id,
        'liked': bool liked,
        'thumbnail': String? thumbnailUrl,
      } => ExploreProductResponse(
        id: id,
        liked: liked,
        thumbnailUrl: thumbnailUrl
      ),
      _ => const ExploreProductResponse.empty()
    };
  }
}
