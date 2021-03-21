import 'package:flutter/material.dart';


Color primaryColor = Color(0xff18203d);
Color secondaryColor = Color(0xff232c51);
Color logoGreen = Color(0xff25bcbb);

class History extends StatelessWidget {
  const History({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'History';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Order History'),
            ),
            ListTile(
              leading: Icon(Icons.storage),
              title: Text('Inventory History'),
            ),
            ListTile(
              leading: Icon(Icons.local_grocery_store),
              title: Text('Stock History'),
            ),
          ],
        ),
      ),
    );
  }
}
