import 'dart:io';
import '../product_manager.dart';

void main() {
  ProductManager productManager = ProductManager();

  while (true) {
    print('\n📦 eCommerce CLI Menu:');
    print('1️⃣ Add Product');
    print('2️⃣ View All Products');
    print('3️⃣ View Single Product');
    print('4️⃣ Edit Product');
    print('5️⃣ Delete Product');
    print('6️⃣ Exit');
    stdout.write('Enter your choice: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter product name: ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter product description: ');
        String description = stdin.readLineSync()!;
        stdout.write('Enter product price: ');
        double price = double.parse(stdin.readLineSync()!);
        productManager.addProduct(name, description, price);
        break;

      case '2':
        productManager.viewAllProducts();
        break;

      case '3':
        stdout.write('Enter product index (starting from 1): ');
        int index = int.parse(stdin.readLineSync()!) - 1;
        productManager.viewProduct(index);
        break;

      case '4':
        stdout.write('Enter product index (starting from 1): ');
        int index = int.parse(stdin.readLineSync()!) - 1;
        stdout.write('Enter new name (leave blank to skip): ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter new description (leave blank to skip): ');
        String description = stdin.readLineSync()!;
        stdout.write('Enter new price (leave blank to skip): ');
        String priceInput = stdin.readLineSync()!;
        double? price = priceInput.isNotEmpty ? double.parse(priceInput) : null;
        productManager.editProduct(index, name: name.isEmpty ? null : name, description: description.isEmpty ? null : description, price: price);
        break;

      case '5':
        stdout.write('Enter product index (starting from 1): ');
        int index = int.parse(stdin.readLineSync()!) - 1;
        productManager.deleteProduct(index);
        break;

      case '6':
        print('👋 Exiting application. Goodbye!');
        return;

      default:
        print('⚠️ Invalid option! Please try again.');
    }
  }
}
