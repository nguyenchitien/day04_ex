import 'package:flutter/material.dart';

class HomeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Detail"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: Text("${index + 1}"),
          title: Text("HomeDetail => Product ${index + 1}"),
        ),
        itemCount: 1000,
      ),
    );
  }
}
