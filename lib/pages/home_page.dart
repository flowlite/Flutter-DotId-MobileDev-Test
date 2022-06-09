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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: [
                  _tabBarWidget("Places"),
                  _tabBarWidget("Gallery"),
                  _tabBarWidget("User"),
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PlacesPage(),

            //  todo: (NEXT) set TODO messages here
            Container(color: Colors.red),
            Container(color: Colors.blue),
          ],
        )
      ),
    );
  }

  Widget _tabBarWidget(String title){
    return Tab(child: Text(title));
  }
}