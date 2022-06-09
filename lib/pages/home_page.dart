import 'package:flutter/material.dart';

import 'places_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  todo: (NEXT) JANGAN LUPA DI HAPUS
        body: Column(
          children: [
            PageView(
              children: [
                PlacesPage(),

                //  todo: (NEXT) set TODO messages here
                Container(color: Colors.red),
                Container(color: Colors.blue),
              ],
            ),
            TabBar(
              tabs: [
                _tabBarWidget("Places"),
                _tabBarWidget("Gallery"),
                _tabBarWidget("User"),
              ],
            )
          ],
        )
    );
  }

  Widget _tabBarWidget(String title){
    return Text(title);
  }
}