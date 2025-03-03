class Product {
  String name;
  String description;
  double price;

  Product(this.name, this.description, this.price);

  String get nameg => name;
  String get descriptiong => description;
  double get priceg => price;

  set names(String newName) {
    if (newName.isNotEmpty) name = newName;
  }

  set descriptions(String newDescription) {
    if (newDescription.isNotEmpty) description = newDescription;
  }

  set prices(double newPrice) {
    if (newPrice > 0) price = newPrice;
  }

  @override
  String toString() {
    return 'Product: $name\nDescription: $description\nPrice: \$_${price.toStringAsFixed(2)}';
  }
}
