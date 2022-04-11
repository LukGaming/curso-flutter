// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:helloworld/models/user.dart';
import 'package:helloworld/services/userService.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  Future<User>? _futureUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("Listagem de usuários"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _futureUser = getUsers();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              content: Text("Usuários Recuperados"));
                        },
                      );
                    });
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                  },
                  child: const Text('Listar Usuários'),
                  
                ),
              ),
              Container(child: Users(),)
            ],
          )
        ],
      ),
    );
  }
}

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(100, (index) {
        return Center(
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headline5,
          ),
        );
      }),
    );
  }
}

// child: ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _futureAlbum =   createUser(
//                         emailController.text, passwordController.text);
//                   });
//                   showDialog(
//                     context: context,
//                     builder: (context) {
//                       return AlertDialog(
//                           // Retrieve the text the that user has entered by using the
//                           // TextEditingController.
//                           content: Text("$_futureAlbum"));
//                     },
//                   );

//                   // Validate will return true if the form is valid, or false if
//                   // the form is invalid.
//                   if (_formKey.currentState!.validate()) {
//                     // Process data.

//                   }
//                 },
//                 child: const Text('Submit'),
//               ),