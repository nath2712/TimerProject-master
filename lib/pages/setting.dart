import 'package:flutter/material.dart';
import 'package:timer/crud/add_groupe.dart';
import 'package:timer/crud/listeGroupe.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Groupes')),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                const Text("Les groupes", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10,),
                ActionChip(label: const Text("Créer un groupe"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => const AddGroupe()));
                  },
                ),
                ActionChip(label: const Text("Voir vos groupe"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => const ListeGroupe()));
                  },
                ),
                ActionChip(label: const Text("Rejoindre un groupe (marche pas)"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => const ListeGroupe()));
                  },
                ),
               /* const Text("Id :",
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

            ),*/
         ] ),
      ),
    ));

  }
}