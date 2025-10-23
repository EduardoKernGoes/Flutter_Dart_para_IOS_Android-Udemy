import 'package:flutter/material.dart';
import 'package:secao8_gerenciamento_de_estado/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.title),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: (){},
              color: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.edit)
            ),
            IconButton(
              onPressed: (){},
              color: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.delete)
            )
          ],
        ),
      ),
    );
  }
}