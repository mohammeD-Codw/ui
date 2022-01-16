import 'package:app00/models/authorsModel.dart';
import 'package:flutter/material.dart';

class Authors extends StatelessWidget {
AuthorsModel authorsModel;
Authors(this.authorsModel);
  @override
  Widget build(BuildContext context) {
    return
        Column(children: [CircleAvatar(backgroundImage: NetworkImage(authorsModel.imageUrl),radius: 40,),SizedBox(height: 10),Text(authorsModel.userName)]);

  }
}
