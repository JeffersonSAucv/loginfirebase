import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginfirebase/libs/auth.dart';

class LoginPage extends StatelessWidget {



  void _goTo(BuildContext context, FirebaseUser user){

    if (user != null) {
      Navigator.pushReplacementNamed(context, '/homepage');
    } else {
        print("login failed");
    }

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.network(
            'https://us.123rf.com/450wm/estherpoon/estherpoon1608/estherpoon160800055/62128240-space-background-with-stars.jpg?ver=6',
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "BIENVENIDO ELIGE UNA OPCIÓN\n PARA LOGEARTE",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: SocialButton(
                        icon: FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      onPressed: () async {
                        print("Login google");
                        final user  = await Auth.instance.google();
                         _goTo(context, user);
                        print("Login google correcto");
                      },
                    ),
                    IconButton(
                      icon: SocialButton(
                        icon: FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                      onPressed: () async {
                        print("Login facebok");
                        final user  = await Auth.instance.facebook(context);
                        _goTo(context, user);
                        print("listo");
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  const SocialButton({this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: FaIcon(
        icon,
        color: color,
        size: 40,
      ),
    );
  }
}
