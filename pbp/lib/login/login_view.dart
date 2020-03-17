

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final String signIn =
    "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDOOONToIPijiVSnXHHXlSk4t3ShQEhfvM";
final String signUp =
    "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDOOONToIPijiVSnXHHXlSk4t3ShQEhfvM";

class LoginView extends StatelessWidget {
  TextEditingController controller = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    UserStore userStore = Provider.of(context);

    return Scaffold(
      appBar: null,
      backgroundColor: Colors.blueGrey[50],
      body: Column(
        children: [
          Container(
            child: Text("Enter User Code", style: TextStyle(color: Colors.black87),),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20,20),
            child: TextField(
              controller: this.controller,
              showCursor: true,
            ),
          ),
          Container(
            child: FlatButton(
              color: Colors.lime,
              child: Text("Connect"),
              onPressed: () async {
                userStore.uid = this.controller.text;
                Navigator.of(context).pushNamed("/games");
              },
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

}

class UserStore {
  bool register = false;
  String username;
  String password;
  String uid;

  UserProvider() {
    //
  }
}
