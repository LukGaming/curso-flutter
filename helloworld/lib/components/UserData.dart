import 'package:flutter/material.dart';

class UserData extends StatefulWidget {
  const UserData({Key? key, required this.username, required this.email}) : super(key: key);
  final String username;
  final String email;

  @override
  State<UserData> createState() => _UserDataState(username: this.username, email: this.email);
}

class _UserDataState extends State<UserData> {
   _UserDataState({required this.username, required this.email});
  final String username;
  final String email;
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.flight_land),
        title:  Text(username),
        subtitle:  Text(email),
        trailing: Icon(Icons.more_vert)
        // onTap: () {
        //   /* react to the tile being tapped */
        //   return null;
        // });
        );
  }
}
