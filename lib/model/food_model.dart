class FoodModel {

  final String title;
  final String image;
  final String time;
  final String discount;
  final String category;

  FoodModel({required this.title, required this.image,required this.time, required this.discount, required this.category});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      title: json['title'],
      image: json['image'],
      time: json['time'],
      discount: json['discount'],
      category: json['category'],
    );
  }
}