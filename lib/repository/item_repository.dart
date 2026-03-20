class ItemRepository {
  // Simulate fetching items from API or local data
  Future<List<Map<String, String>>> fetchItems() async {
    await Future.delayed(Duration(milliseconds: 500)); // simulate network delay
    return [
      {
        "image": "assets/images/screen1.jpg",
        "title": "Pizza Margherita",
        "subtitle": "Classic Italian Pizza",
        "time": "30-40 min",
        "discount": "Flat ₹120 OFF above ₹299"
      },
      {
        "image": "assets/images/screen2.jpg",
        "title": "Sushi Set",
        "subtitle": "Fresh Japanese Sushi",
        "time": "25-35 min",
        "discount": "Flat ₹140 OFF above ₹299"
      },
      // Add more items dynamically here
    ];
  }
}