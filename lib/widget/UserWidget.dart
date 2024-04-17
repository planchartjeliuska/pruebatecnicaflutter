
import 'package:flutter/material.dart';
import 'package:pruebatecnicaflutter/UserDetail.dart';

import '../models/User.dart';

class UserWidget extends StatelessWidget{
  final User user;

  const UserWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> UserDetailPage(userId: user.id)
            )
        );
      },
      child: Card(
          margin: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  user.email,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 17.0,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  user.website,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 17.0,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          )
      )
    );
  }
}