import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secao8_gerenciamento_de_estado/exceptions/http_exception.dart';
import 'package:secao8_gerenciamento_de_estado/models/product.dart';
import 'package:secao8_gerenciamento_de_estado/models/product_list.dart';
import 'package:secao8_gerenciamento_de_estado/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);
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
              onPressed: (){
                Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM, arguments: product);
              },
              color: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.edit)
            ),
            IconButton(
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir Produto'),
                    content: Text('Tem certeza?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(false),
                        child: Text('Não')
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(true),
                        child: Text('Sim')
                      ),
                    ]
                  )
                ).then((value) async {
                  if(value ?? false) {
                    try {
                      await Provider.of<ProductList>(
                        context,
                        listen: false
                      ).removeProduct(product);
                    } on HttpException catch (e){
                      msg.showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                          duration: const Duration(milliseconds: 500),
                        ),
                        snackBarAnimationStyle: const AnimationStyle(
                          duration: Duration(milliseconds: 800)
                        )
                      );
                    }
                  }
                });
              },
              color: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.delete)
            )
          ],
        ),
      ),
    );
  }
}