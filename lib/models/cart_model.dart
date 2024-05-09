class Cart {
  final String name;
  final double price;
  final String brand;
  bool isSelected;
  int amount;

  final String imagePath;

  Cart({
    required this.name,
    required this.imagePath,
    required this.amount,
    required this.brand,
    required this.isSelected,
    required this.price,
  });
}
