import 'product.dart';

class ProductManager {
  final List<Product> products = [];

  void addProduct(String name, String description, double price) {
    products.add(Product(name, description, price));
    print('✅ Product added successfully!');
  }

  void viewAllProducts() {
    if (products.isEmpty) {
      print('⚠️ No products available.');
      return;
    }
    for (int i = 0; i < products.length; i++) {
      print('\n Product #${i + 1}\n${products[i]}');
    }
  }

  void viewProduct(int index) {
    if (index < 0 || index >= products.length) {
      print('❌ Product not found!');
      return;
    }
    print('\n Product #${index + 1}\n${products[index]}');
  }

  void editProduct(int index,
      {String? name, String? description, double? price}) {
    if (index < 0 || index >= products.length) {
      print('❌ Product not found!');
      return;
    }
    if (name != null) products[index].name = name;
    if (description != null) products[index].description = description;
    if (price != null) products[index].price = price;

    print('✅ Product updated successfully!');
  }

  void deleteProduct(int index) {
    if (index < 0 || index >= products.length) {
      print('❌ Product not found!');
      return;
    }
    products.removeAt(index);

    print('🗑️ Product deleted successfully!');
  }
}
