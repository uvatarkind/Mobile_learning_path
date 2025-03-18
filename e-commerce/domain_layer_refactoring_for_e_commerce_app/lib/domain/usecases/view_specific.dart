import '../entities/product.dart';
import '../repositories/product_repository.dart';

class ViewSpecific {
  final ProductRepository repository;
  ViewSpecific(this.repository);
  Future<Product?> call(String id) async {
    return await repository.getProductById(id);
  }
}
