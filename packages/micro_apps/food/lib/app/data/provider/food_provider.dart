import '../http/http.dart';
import '../model/category/category_model.dart';

class FoodProvider {
  final RestClientAdapter httpClient = DioClient();
  Future<List<CategoryModel>> getFoods() async {
    try {
      final response = await httpClient.get(
        '/api/json/v1/1/categories.php',
      );
      return (response.data['categories'] as List)
          .map((e) => CategoryModel.fromMap(e as Map<String, dynamic>))
          .toList();
    } on Exception {
      rethrow;
    }
  }
}
