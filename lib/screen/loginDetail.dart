import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginfirebase/libs/auth.dart';

class LoginDetail extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos Usarios'),
      ),
      body: Center(
        child: Container(
            child: FutureBuilder<FirebaseUser>(
                future: Auth.instance.user,
                builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                  if (snapshot.hasData) {
                    final user = snapshot.data;

                    return ListView(
                      children: <Widget>[
                        SizedBox(height: 10),
                        CircleAvatar(
                          radius: 40,
                          child: user.photoUrl != null
                              ? ClipOval(child: Image.network(user.photoUrl,fit: BoxFit.cover, width: 80, height: 80,))
                              : _getAlias(user.displayName)
                        ),
                        SizedBox(height: 10),
                        Text(
                          user.displayName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          user.email,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: TextField(),
                        )
                      ],
                    );
                  } else if (snapshot.hasData) {
                    return Center(
                      child: Text("Network Error"),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                })),
      ),
    );
  }

    Widget _getAlias(String displayName) {
    final List<String> tmp = displayName.split(" ");
    String alias = "";
    print(tmp);
    if (tmp.length > 0) {
      alias = tmp[0][0];
      if (tmp.length == 2 ||
          tmp.length == 3 ||
          tmp.length == 4 ||
          tmp.length == 5) {
        alias += tmp[1][0];
      }
    } else {
      alias = tmp[0][0];
    }
  }
}
