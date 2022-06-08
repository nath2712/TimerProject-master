import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../home.dart';
import '../main.dart';

class editGroupe extends StatefulWidget {

  DocumentSnapshot docid;
  editGroupe({required this.docid});

  @override
  _editGroupeState createState() => _editGroupeState();

}


class _editGroupeState extends State<editGroupe> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController IDgroupe = TextEditingController();
  @override
  void initState() {
    super.initState();
    title = TextEditingController(text: widget.docid.get('name'));
    content = TextEditingController(text: widget.docid.get('description'));
    IDgroupe = TextEditingController(text: widget.docid.get('id'));
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
        title: const Text("Modifier le Groupe " ),

        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'name': title.text,
                'description': content.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Text("save"),
          ),
          MaterialButton(
            onPressed: () {

              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Home()));

            },
            child: Text("Retour"),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Text("delete"),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Text("delete"),
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
                      controller: title,
                      decoration: InputDecoration(
                        hintText: 'title',
                      ),
                      ),
                    ),
                ],
                  ),
              subtitle:Row(
                children:[
                  const Text('ID du groupe:'),
                  Expanded(
                    child: TextField(
                      controller: IDgroupe,

                    ),
                  ),
                ],
              ),
              ),
            const SizedBox(height:20),

          ],
            )


        ),


      );


  }
}















