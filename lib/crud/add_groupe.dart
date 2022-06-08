import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:timer/home.dart';
import '../home.dart';
import 'package:timer/pages/setting.dart';

class AddGroupe extends StatefulWidget {
  const AddGroupe({Key? key}) : super(key: key);

  @override
  State<AddGroupe> createState() => _AddPageState();
}

class _AddPageState extends State<AddGroupe> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  showMessage() {
    final userAuth = FirebaseAuth.instance.currentUser?.uid;
    String userAuthString = userAuth.toString();
    return userAuthString;
  }
  final docTimer = FirebaseFirestore.instance.collection('Groupe').doc();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final dureeController = TextEditingController();
  final ordreController= TextEditingController();
  final dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouté un groupe'),
          actions: [
            MaterialButton(
              onPressed: () {

                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => const Home()));

              },
              child: Text("Retour"),
            ),
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side:const BorderSide(color: Colors.white30, width: 1.5),
              ),

              title:Row(
                children:[
                  const Text('Nom:'),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration (
                        border: InputBorder.none,
                      ),
                      controller: nameController,
                    ),
                  ),
                ],
              ),

            ),
            const SizedBox(height:20),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side:const BorderSide(color: Colors.white30, width: 1.5),
              ),

              title:Row(
                children:[
                  const Text('description:'),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration (
                        border: InputBorder.none,
                      ),
                      controller: descriptionController,
                    ),
                  ),
                ],
              ),

            ),
            const SizedBox(height:20),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side:const BorderSide(color: Colors.white30, width: 1.5),
              ),

            ),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: (){
                  FirebaseFirestore.instance.collection('Groupe').add({
                    'UserID': showMessage(),
                    'id': docTimer.id.toString(),
                    'name': nameController.value.text,
                    'description': descriptionController.value.text,

                  });
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const Setting()));
                },
                child:const Text('Ajouter') ),
          ],
        ),

      ),

    );


  }
}















