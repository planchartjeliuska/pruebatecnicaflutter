import 'package:flutter/material.dart';

import '../models/User.dart';

class DetailWidget extends StatelessWidget {
  final User user;

  const DetailWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Theme.of(context).colorScheme.inversePrimary,
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/profile.png", width: 100, height: 100),
              Text(user.username),
              Text(user.email)
            ],
          ),
        )
      ],
    );
    throw UnimplementedError();
  }

}