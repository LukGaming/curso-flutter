import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:helloworld/models/user.dart';
import 'package:helloworld/services/userService.dart';
import '../models/user.dart';

class UserCrud extends StatefulWidget {
  const UserCrud({ Key? key }) : super(key: key);

  @override
  State<UserCrud> createState() => _UserCrudState();
}



class _UserCrudState extends State<UserCrud> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  Future<User>? _futureAlbum;
  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment
                  .center, // Align however you like (i.e .centerRight, centerLeft)
              child:
                  Text("Cadastro de Usuários", style: TextStyle(fontSize: 20)),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Endereco de email"),
              keyboardType: TextInputType.emailAddress,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  // hintText: 'Senha',
                  labelText: "Senha"),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _futureAlbum =   createUser(
                        emailController.text, passwordController.text);
                  });
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text("$_futureAlbum"));
                    },
                  );

                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data.

                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}