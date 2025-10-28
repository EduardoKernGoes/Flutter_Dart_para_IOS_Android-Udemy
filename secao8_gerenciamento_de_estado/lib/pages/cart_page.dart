import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secao8_gerenciamento_de_estado/components/cart_item.dart';
import 'package:secao8_gerenciamento_de_estado/models/cart.dart';
import 'package:secao8_gerenciamento_de_estado/models/order_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: Text('Carrinho')
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: Text(
                      'R\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white
                      )
                    ),
                  ),
                  Spacer(),
                  _CartButtonState(cart: cart),
                ],
              ),
            )
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, i) => CartItemWidget(cartItem: items[i])
            )
          )
        ],
      ),
    );
  }
}

class _CartButtonState extends StatefulWidget {
  const _CartButtonState({
    required this.cart,
  });

  final Cart cart;

  @override
  State<_CartButtonState> createState() => _CartButtonStateState();
}

class _CartButtonStateState extends State<_CartButtonState> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading ? CircularProgressIndicator() : TextButton(
      onPressed: widget.cart.itemsCount == 0 ? null : () async {
        setState(() => _isLoading = true);
        await Provider.of<OrderList>(context, listen: false).addOrder(widget.cart);
        setState(() => _isLoading = false);
        widget.cart.clear();
      },
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        )
      ),
      child: Text('Comprar'),
    );
  }
}