import 'package:flutter/material.dart';
import 'package:loginfirebase/libs/auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          _TopBanner(),
          Positioned(
              bottom: 300,
              right: 150,
              child: Container(
                //decoration: BoxDecoration(border: Border.all()),
                child: Container(
                  child: FlatButton(
                    child: Text('CERRAR SESION'),
                    onPressed: () {
                      Auth.instance.logOut(context);
                    },
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}

class _TopBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Text("APP SOCIAL",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/logindetail');
            },
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
