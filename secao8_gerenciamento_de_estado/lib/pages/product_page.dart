import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secao8_gerenciamento_de_estado/components/app_drawer.dart';
import 'package:secao8_gerenciamento_de_estado/components/product_item.dart';
import 'package:secao8_gerenciamento_de_estado/models/product_list.dart';
import 'package:secao8_gerenciamento_de_estado/utils/app_routes.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<ProductList>(context, listen: false).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar produtos'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM),
            icon: Icon(Icons.add)
          )
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: products.itemsCount,
            itemBuilder: (ctx, i) => Column(
              children: [
                ProductItem(product: products.items[i]),
                Divider(),
              ],
            ),
          )
        ),
      )
    );
  }
}