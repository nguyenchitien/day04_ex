import 'package:day04_ex/navigator/favorite_navigator.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FavoritePage"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("FavoritePage"),
              FlatButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, FavoritesRoutes.detail);
                },
                child: Text("Go to detail"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
