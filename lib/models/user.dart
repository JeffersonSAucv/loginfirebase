
import 'package:firebase_auth/firebase_auth.dart';

class User {
  String uid;
  String name;
  String lastname;
  int age;
  String email;
  String phoneNumber;
  String photoUrl;

  User({this.uid, this.name, this.lastname, this.age, this.email, this.phoneNumber, this.photoUrl});

  Map<String, dynamic> toJSON() => {
    'uid': uid,
    'name': name,
    'lastname': lastname,
    'age': age,
    'email': email,
    'phoneNumber': phoneNumber,
    'photoUrl': photoUrl
  };

  void getDataFromFirebaseUser( FirebaseUser userAuth ){
    this.uid = userAuth.uid;
    this.name = userAuth.displayName;
    this.phoneNumber = userAuth.phoneNumber ?? '';
    this.photoUrl = userAuth.photoUrl;
  }

  /* void getDataFromFirestore( DocumentSnapshot snapshot ){
    this.name = snapshot.value['name'];
  } */

}