import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secao8_gerenciamento_de_estado/models/auth.dart';
import 'package:secao8_gerenciamento_de_estado/models/cart.dart';
import 'package:secao8_gerenciamento_de_estado/models/order_list.dart';
import 'package:secao8_gerenciamento_de_estado/models/product_list.dart';
import 'package:secao8_gerenciamento_de_estado/pages/auth_page.dart';
import 'package:secao8_gerenciamento_de_estado/pages/cart_page.dart';
import 'package:secao8_gerenciamento_de_estado/pages/orders_pages.dart';
import 'package:secao8_gerenciamento_de_estado/pages/product_detail_page.dart';
import 'package:secao8_gerenciamento_de_estado/pages/product_form_page.dart';
import 'package:secao8_gerenciamento_de_estado/pages/product_page.dart';
import 'package:secao8_gerenciamento_de_estado/pages/products_overview_page.dart';
import 'package:secao8_gerenciamento_de_estado/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => OrderList()),
        ChangeNotifierProvider(create: (_) => Auth()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.deepOrange),
          fontFamily: 'Lato',
        ),
        home: AuthPage(),
        routes: {
          AppRoutes.AUTH: (ctx) => AuthPage(),
          AppRoutes.HOME: (ctx) => ProductsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailPage(),
          AppRoutes.CART: (ctx) => CartPage(),
          AppRoutes.ORDERS: (ctx) => OrdersPages(),
          AppRoutes.PRODUCTS: (ctx) => ProductPage(),
          AppRoutes.PRODUCT_FORM: (ctx) => ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}