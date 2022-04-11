import 'package:flutter/material.dart';
// import 'package:helloworld/components/UserCrud.dart';
import 'package:helloworld/components/UserList.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Primeiro Formulário';
 
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        brightness: Brightness.dark,
        // textTheme: TextTheme.lerp(r, b, t),
        /* dark theme settings */
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        // body: const UserCrud(),
        body: UserList(),
      ),
    );
  }
}



