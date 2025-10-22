import 'package:flutter/material.dart';
import 'package:secao7_navegacao_e_multiplas_telas/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  Widget _createIcon(IconData icon, String label, Function() onTap){
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.primary,
            alignment: Alignment.bottomLeft,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 24,
                color: Colors.white,
              ),
            )
          ),
          _createIcon(Icons.restaurant, 'Refeições', () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)),
          _createIcon(Icons.settings, 'Configurações', () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS)),
        ],
      ),
    );
  }
}