import '../../model/category_model.dart';

class CategoriesRepository {
  Future<List<Category>> fetchCategories() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Category(name: "All", image: "assets/images/all.png"),
      Category(name: "Burger", image: "assets/images/burger.png"),
      Category(name: "Cake", image: "assets/images/cake.png"),
      Category(name: "Fries", image: "assets/images/fries.png"),
      Category(name: "Chicken", image: "assets/images/chicken.png"),
      Category(name: "Waffle", image: "assets/images/waffle.png"),
    ];
  }
}