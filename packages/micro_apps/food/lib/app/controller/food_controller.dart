import 'package:food/app/data/provider/food_provider.dart';
import 'package:get/get.dart';

import '../data/model/category/category_model.dart';

class FoodController extends GetxController {
  final FoodProvider provider = FoodProvider();

  final foods = <CategoryModel>[].obs;

  @override
  void onInit() {
    getFoods();
    super.onInit();
  }

  Future<void> getFoods() async {
    List<CategoryModel> response = await provider.getFoods();
    foods.assignAll(response);
  }
}
