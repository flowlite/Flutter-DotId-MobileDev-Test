import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PlacesPage extends StatefulWidget {
  const PlacesPage({Key? key}) : super(key: key);

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  todo: (NEXT) JANGAN LUPA DI HAPUS
      appBar: AppBar(
        title: Text("Places"),
      ),
        body: Column(
          children: [
            _searchWidget(),

          ],
        )
    );
  }

  /// WIDGET LISTS
  Widget _searchWidget(){
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 30, top: 10),
      child: TextFormField(
        initialValue: _searchQuery,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 3.0
              )
          ),
          hintText: "Search...",
        ),
        onChanged: (value) {
          _searchQuery = value;
        },
      ),
    );

    // return Container(
    //   margin: EdgeInsets.only(left: 10, right: 10, bottom: 30, top: 10),
    //   padding: EdgeInsets.only(left: 10, right: 10, bottom: 30, top: 10),
    //   decoration: BoxDecoration(
    //     border: Border.all()
    //   ),
    //   child: ,
    // );
  }

  Widget placesList() {
    return Container(
      // padding: EdgeInsets.zero,
      // padding: EdgeInsets.only(left: 25),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, count){
            return placesItem();
          }
      ),
    );
  }

  Widget placesItem() {
    var imageUrl =
        "https://cdn.pixabay.com/photo/2015/01/08/18/27/startup-593341_960_720.jpg";
    var title = "Places";
    var distance = "5.0km";

    double _containerBorder = 8.0;

    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(_containerBorder))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_containerBorder),
                bottomLeft: Radius.circular(_containerBorder),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 70,
                width: 70,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 5),
            child: Text(
              '$distance',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// TASKS
  _getPlaces(){

  }
}