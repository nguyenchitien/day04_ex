import 'package:flutter/material.dart';

class FavoritesDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FavoritesDetail"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: Text("${index + 1}"),
          title: Text("FavoritesDetail => ${index + 1}"),
        ),
        itemCount: 1000,
      ),
    );
  }
}
