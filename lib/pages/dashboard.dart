import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../crud/edit_timer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
/*
  firebase.auth().currentUser ;// pour récup l'objet
  firebase.auth().currentUser.uid ; // pour l'id
*/

  final Stream<QuerySnapshot> _timerStream = // appelle la BDD
  FirebaseFirestore.instance.collection('Timer').snapshots(includeMetadataChanges: true);
  bool switchValue = false;
  bool isVisible = true;
  showMessage() {
    final userAuth = FirebaseAuth.instance.currentUser?.uid;
    String userAuthString = userAuth.toString();
    return userAuthString;
  }
  @override

  Widget build(BuildContext context) { //Début de construction de la page d'affichage
    return Scaffold(
      appBar: AppBar(title: const Text('Timer '), //Bandeau qui s'afffiche pas...?

        leading: Switch(
        value: switchValue,
        onChanged: (value) {
          switchValue = value;
          isVisible = !isVisible;
          setState(() {

          });
        },
      ),
    ),
      body: StreamBuilder(
        stream: _timerStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong"); //message d'erreur pour indiquer si il a réussi a se connecté ou non
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(), //icone de chargement
            );
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),


            child: ListView.builder(//Commande qui permet d'éditer l'élément en cliquant dessus
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (_, index) {
                if ( snapshot.data?.docChanges[index].doc['UserID'] == showMessage() ){
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            editTimer(docid: snapshot.data!.docs[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [

                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3,
                          right: 3,
                        ),
                        child: Visibility(
                          visible: isVisible,
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          title: Text( //copier coller ce coode pour afficher la valeur que l'on shoutaite montrer
                            snapshot.data!.docChanges[index].doc['name'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data!.docChanges[index].doc['description'],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),

                        ),
                      ),
                    ],
                  ),
                );



          }

          else {
                  return const Text("Vous n'avez pas de timer");
          }

        },

      ),

    );

  }));

}}