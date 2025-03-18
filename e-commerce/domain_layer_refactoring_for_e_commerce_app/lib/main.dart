import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/usecases/view_all.dart';
import 'domain/usecases/view_specific.dart';
import 'domain/usecases/create_product.dart';
import 'domain/usecases/update_product.dart';
import 'domain/usecases/delete_product.dart';

import 'data/repositories/mock_product_repository.dart';

void main() {
  final repository = MockProductRepository();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => ViewAll(repository)),
        Provider(create: (_) => ViewSpecific(repository)),
        Provider(create: (_) => CreateProduct(repository)),
        Provider(create: (_) => UpdateProduct(repository)),
        Provider(create: (_) => DeleteProduct(repository)),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eCommerce App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewAll = Provider.of<ViewAll>(context);

    return Scaffold(
      appBar: AppBar(title: Text('eCommerce Products')),
      body: FutureBuilder(
        future: viewAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error loading products'));
          }
          final products = snapshot.data ?? [];

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('\$${product.price}'),
              );
            },
          );
        },
      ),
    );
  }
}
