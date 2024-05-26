import 'package:flutter/material.dart';

abstract class Search extends SearchDelegate {
  

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
            onPressed: () {
              query='';
            }, 
            icon: const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white54,
              child: Icon(Icons.clear_rounded,color: Color.fromARGB(255, 255, 255, 255),))
          )
    ];
  }


}