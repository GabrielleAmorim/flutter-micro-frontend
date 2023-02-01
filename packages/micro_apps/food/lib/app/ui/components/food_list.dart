import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/food_controller.dart';
import '../../data/model/category/category_model.dart';

class FoodList extends StatelessWidget {
  FoodList({super.key});

  final FoodController controller = Get.put(FoodController());

  Widget _card(CategoryModel food) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: 16,
            left: 32,
          ),
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 32,
                  left: 100,
                  right: 16,
                ),
                child: Text(
                  food.strCategory,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 100,
                  right: 16,
                ),
                child: Text(food.strCategoryDescription),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  food.strCategoryThumb,
                  width: 120,
                  height: 120,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: const Text("Food MicroApp"),
      ),
      body: Container(
        color: Colors.grey[200],
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Obx(
              () => ListView.separated(
                itemCount: controller.foods.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (_, index) => const SizedBox(height: 50),
                itemBuilder: (_, index) {
                  CategoryModel food = controller.foods[index];
                  return _card(food);
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
