import 'package:http/http.dart' as http;
import 'package:shopping/home_products/data/remote/model/remote_model.dart';

class HomeProductApi {
  Future<HomeProductsResponse> loadAll() async {
    const url = "https://vnhanh.demo.shopping/api/v1/home/products";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode > 0 && response.statusCode < 400) {
        final json = HomeProductsResponse.fromJson(response.body as Map<String, dynamic>);
        return json;
    }
    return const HomeProductsResponse.empty();
  }
}
