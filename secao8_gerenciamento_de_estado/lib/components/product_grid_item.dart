import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secao8_gerenciamento_de_estado/models/auth.dart';
import 'package:secao8_gerenciamento_de_estado/models/cart.dart';
import 'package:secao8_gerenciamento_de_estado/models/product.dart';
import 'package:secao8_gerenciamento_de_estado/utils/app_routes.dart';

class ProductGridItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(product.title, textAlign: TextAlign.center),
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              onPressed: () => product.toggleFavorite(auth.token ?? '', auth.userId ?? ''),
              icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Produto Adicionado com Sucesso!!!'),
                  action: SnackBarAction(
                    label: 'Desfazer',
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    }
                  )
                )
              );
            },
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
          )
        ),
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DETAIL,
              arguments: product,
            );
          },
        )
      ),
    );
  }
}