import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Formulaire de la clé
  final _formKey = GlobalKey<FormState>();
  // Controller
  final prenomEditingController = TextEditingController();
  final nomEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  static register(final _auth, String email,String password,BuildContext context) async {
    _auth.createUserWithEmailAndPassword(email: email, password: password);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context){

    // Champ pour le prenom
    final prenomField = TextFormField(
        autofocus: false,
        controller: prenomEditingController,
        keyboardType: TextInputType.name,
        //validation
        onSaved: (value) {
          prenomEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon:  const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Prenom",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    // Champ pour le nom
    final nomField = TextFormField(
        autofocus: false,
        controller: nomEditingController,
        keyboardType: TextInputType.name,
        //validation
        onSaved: (value) {
          nomEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon:  const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nom",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    // Champ pour le mail
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        //validation
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon:  const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    // Champ pour le mot de passe
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,

        //validation
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon:  const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Mot de passe",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    // Champ pour la confirmation du  mot de passe
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,

        //validation
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon:  const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: " Confimation du Mot de passe",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    // Boutton se connecter
    final inscriptionButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.greenAccent,
      child: MaterialButton(
          padding:  const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {

            register ( _auth, emailEditingController.value.text,confirmPasswordEditingController.value.text, context );

            /*
                      FirebaseFirestore.instance.collection('User').add({ //champs a ajouté a la BDD User est le nom donner a la BDD qui va stocker les informations
              'Prénom'/* nom du champs dans la table user*/: prenomEditingController.value.text,//Nom du controller ainsi que le type de champs que c'est
              'Nom': nomEditingController.value.text,
              'MDP': confirmPasswordEditingController.value.text,
              'Email': emailEditingController.value.text,
                      });*/
                       //c'est la qu'il faut mettre ou es ce qu'il sera rediriger a l'inscription
                                              // par défaut ca renvoi a la page de  connexion
                      },
          child: const Text(
            "S'inscire",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            // Vers la route
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child:  Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          'assets/logo.jpg',
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(height: 25),
                    prenomField,
                    const SizedBox(height: 20),
                    nomField,
                    const SizedBox(height: 20),
                    emailField,
                    const SizedBox(height: 20),
                    passwordField,
                    const SizedBox(height: 20),
                    confirmPasswordField,
                    const SizedBox(height: 20),
                    inscriptionButton,
                    const SizedBox(height: 15,),
                  ]
                ),
                ),
              ),
            ),
          ),
        ),
      );
  }
}