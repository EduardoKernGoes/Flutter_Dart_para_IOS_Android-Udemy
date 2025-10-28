import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secao8_gerenciamento_de_estado/components/app_drawer.dart';
import 'package:secao8_gerenciamento_de_estado/components/order.dart';
import 'package:secao8_gerenciamento_de_estado/models/order_list.dart';

class OrdersPages extends StatefulWidget {
  const OrdersPages({super.key});

  @override
  State<OrdersPages> createState() => _OrdersPagesState();
}

class _OrdersPagesState extends State<OrdersPages> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<OrderList> (
      context,
      listen: false
    ).loadOrders().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus pedidos'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: AppDrawer(),
      body: _isLoading ?
      Center(
        child: CircularProgressIndicator()
      )
      :
      ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i])
      )
    );
  }
}