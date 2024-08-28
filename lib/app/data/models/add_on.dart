class Addon {
  int id;
  String name;
  double price;
  int quantity;

  Addon(
      {required this.id,
      required this.name,
      required this.price,
      this.quantity = 1});

  // To update the quantity
  void updateQuantity(int increment) {
    quantity += increment;
  }

  // To create a copy with modified quantity
  Addon copyWith({int? quantity}) {
    return Addon(
      id: id,
      name: name,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }
}
