
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'crud/add_timer.dart';
import 'pages/dashboard.dart';
import 'pages/timer.dart';
import 'pages/setting.dart';
import 'pages/profile.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentTab = 0;
  final List<Widget> screens = [
  const Dashboard(),
     const Temps(),
  const Profile(),
  const Setting()
];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Dashboard();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return const AddPage();
          },
            fullscreenDialog: true,


          ));

        },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Dashboard();
                            currentTab = 0;
                      });
                     },
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.dashboard,
                color: currentTab == 0 ? Colors.blue : Colors.blue,
              ),
              Text(
                'Dashboard',
                style: TextStyle(
                    color: currentTab == 0 ? Colors.blue : Colors.grey
                ),
              )
            ],
          ),
                     ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Temps();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.timer,
                          color: currentTab == 1 ? Colors.blue : Colors.blue,
                        ),
                        Text(
                          'Timer',
                          style: TextStyle(
                              color: currentTab == 1 ? Colors.blue : Colors.grey
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              // Right Tab Bar Icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Profile();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 2 ? Colors.blue : Colors.blue,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: currentTab == 2 ? Colors.blue : Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Setting();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentTab == 3 ? Colors.blue : Colors.blue,
                        ),
                        Text(
                          'Groupe',
                          style: TextStyle(
                              color: currentTab == 3 ? Colors.blue : Colors.grey
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}