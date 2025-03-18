import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ViewAll {
  final ProductRepository repository;
  ViewAll(this.repository);
  Future<List<Product>> call() async {
    return await repository.getAllProducts();
  }
}
