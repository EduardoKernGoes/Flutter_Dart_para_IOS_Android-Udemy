import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secao8_gerenciamento_de_estado/components/app_drawer.dart';
import 'package:secao8_gerenciamento_de_estado/components/badgee.dart';
import 'package:secao8_gerenciamento_de_estado/components/product_grid.dart';
import 'package:secao8_gerenciamento_de_estado/models/cart.dart';
import 'package:secao8_gerenciamento_de_estado/models/product_list.dart';
import 'package:secao8_gerenciamento_de_estado/utils/app_routes.dart';

enum FilterOptions {
  favorite, all
}

class ProductsOverviewPage extends StatefulWidget {
  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<ProductList>(
      context,
      listen: false
    ).loadProducts();
  }
  
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: Text('Minha loja'),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Todos'),
              ),
              PopupMenuItem(
                value: FilterOptions.favorite,
                child: Text('Somente Favoritos'),
              ),
            ],
            onSelected: (FilterOptions selectedValue){
              if(selectedValue == FilterOptions.favorite){
                provider.showFavoriteOnly();
              }else{
                provider.showAll();
              }
            },
          ),
          Consumer<Cart>(
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART);
                },
                icon: Icon(Icons.shopping_cart),
              ),
            builder: (ctx, cart, child) => Badgee(
              value: cart.itemsCount.toString(),
              child: child!,
            ),
          )
        ],
      ),
      body: ProductGrid(),
      drawer: AppDrawer(),
    );
  }
}