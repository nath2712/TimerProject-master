import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../loginscreen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
   showMessage() {
    final userAuth = FirebaseAuth.instance.currentUser?.uid;
    String userAuthString = userAuth.toString();
    return Text(userAuthString);
  }
 // final mail = showMessage();
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  height: 150,
                  child: Image.asset('assets/logo.jpg', fit: BoxFit.contain),
              ),
              const Text("Bienvenue", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10,),
              const Text("Id :",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
               showMessage(),
              const Text("Email",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(height: 15,),
              ActionChip(label: const Text("Se déconnecter"),
                onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
              )],
          ),
        )
      ),
    );
}
}