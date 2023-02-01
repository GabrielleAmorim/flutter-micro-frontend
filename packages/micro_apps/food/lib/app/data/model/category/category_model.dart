class CategoryModel {
  CategoryModel({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  factory CategoryModel.fromMap(Map<String, dynamic> json) {
    return CategoryModel(
      idCategory: json['idCategory'] ?? "",
      strCategory: json['strCategory'] ?? "",
      strCategoryThumb: json['strCategoryThumb'] ?? "",
      strCategoryDescription: json['strCategoryDescription'],
    );
  }
}
