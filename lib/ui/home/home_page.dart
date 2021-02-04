import 'package:day04_ex/navigator/home_navigator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("HomePage"),
              FlatButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.of(context).pushNamed(HomeRoutes.detail);
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
