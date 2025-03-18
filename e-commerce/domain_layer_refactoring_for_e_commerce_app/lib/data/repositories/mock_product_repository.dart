import 'dart:async';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

class MockProductRepository implements ProductRepository {
  final List<Product> _products = [
    Product(id: '1', name: 'Laptop', description: 'A powerful laptop', imageUrl: '', price: 1000),
    Product(id: '2', name: 'Phone', description: 'A smart phone', imageUrl: '', price: 500),
  ];

  @override
  Future<List<Product>> getAllProducts() async {
    return Future.value(_products);
  }

  @override
  Future<Product?> getProductById(String id) async {
    return Future.value(_products.firstWhere((product) => product.id == id, orElse: () => null));
  }

  @override
  Future<void> createProduct(Product product) async {
    _products.add(product);
  }

  @override
  Future<void> updateProduct(Product product) async {
    int index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    _products.removeWhere((p) => p.id == id);
  }
}
