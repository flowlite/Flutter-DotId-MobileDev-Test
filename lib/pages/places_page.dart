import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotid_mobiledev_test/entity/place/placesContent/places_content.dart';
import 'package:flutter_dotid_mobiledev_test/stores/places_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class PlacesPage extends StatefulWidget {
  const PlacesPage({Key? key}) : super(key: key);

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  PlacesStore? _placesStore;
  List<ReactionDisposer>? _disposers;

  String _searchQuery = "";

  /// LIFECYCLE METHODS
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _placesStore ??= Provider.of<PlacesStore>(context);

    _disposers ??= [
      reaction(
        (_) => _placesStore?.errorMessage,
        (String? message) {
          if (message != null) {
            _showMessage(message);
          }
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _init();

    return Scaffold(
        //  todo: (NEXT) JANGAN LUPA DI HAPUS
        // appBar: AppBar(
        //   title: Text("Places"),
        // ),
        body: Column(
          children: [
            _searchWidget(), 
            _placesBuilder()
          ],
    ));
  }

  @override
  void dispose() {
    _disposers?.forEach((d) => d());
    super.dispose();
  }

  /// TASKS METHODS
  _init() {
    _getPlaces();
  }

  _getPlaces() {
    //  todo: (NEXT) JANGAN LUPA DI PASANG
    _placesStore?.getPlaces();
  }

  /// VIEW METHODS
  _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  /// WIDGET LISTS
  Widget _searchWidget() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 25),
      child: TextFormField(
        initialValue: _searchQuery,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 3.0)),
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

  Widget _placesBuilder() {
    return Observer(
      builder: (_) {
        switch (_placesStore?.state) {
          case StoreState.initial:
            return Container(child: CircularProgressIndicator(value: null));
          case StoreState.loading:
            return Container(child: CircularProgressIndicator(value: null));
          case StoreState.loaded:
            {
              //  todo: (NEXT) JANGAN LUPA DI HAPUS
              print(":: LOADED OBS ::");
              return _placesList(_placesStore?.placesContents ?? []);
            }
          default:
            Container(child: CircularProgressIndicator(value: null));

            return Container();
        }
      },
    );
  }

  Widget _placesList(List<PlacesContent> entities) {
    return Expanded(
      // fit: FlexFit.loose,
      child: Container(
        // padding: EdgeInsets.zero,
        // padding: EdgeInsets.only(left: 25),
        child: RefreshIndicator(
          onRefresh: () {
            return _getPlaces();
          },
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: 30.0),
              // shrinkWrap: true,
              itemCount: entities.length,
              itemBuilder: (context, count) {
                return _placesItem(entities[count]);
              }),
        ),
      ),
    );
  }

  Widget _placesItem(PlacesContent pContent) {
    // var imageUrl =
    //     "https://cdn.pixabay.com/photo/2015/01/08/18/27/startup-593341_960_720.jpg";
    // var title = "Places";
    // var distance = "5.0km";

    var imageUrl = pContent.image ?? "";
    var title = pContent.title;
    var distance = pContent.content;

    double _containerBorder = 5.0;

    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      decoration: BoxDecoration(
          color: Colors.grey[300],
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
              child: Container(
                color: Colors.grey[700],
                child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    height: 70,
                    width: 70,
                    errorWidget: (context, url, error) {
                      return Container(
                          child: Icon(
                              Icons.image_not_supported_outlined, color: Colors.grey));
                    }),
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
        ],
      ),
    );
  }
}
