import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secao8_gerenciamento_de_estado/models/auth.dart';
import 'package:secao8_gerenciamento_de_estado/pages/auth_page.dart';
import 'package:secao8_gerenciamento_de_estado/pages/products_overview_page.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? ProductsOverviewPage() : AuthPage();
  }
}