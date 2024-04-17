import 'package:flutter/cupertino.dart';

import '../models/User.dart';

class RowWidget extends StatelessWidget {
  final String image;
  final String text;


  const RowWidget({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(8.0)),
            Image.asset(image, width: 40.0, height:40.0),
            Expanded(
              child: Text(text),
            ),
          ],
        ),

      );

  }




}