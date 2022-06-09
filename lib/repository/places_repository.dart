import 'dart:convert';

import 'package:flutter_dotid_mobiledev_test/entity/place/placesContent/places_content.dart';
import 'package:http/http.dart' as http;

import '../responseCollection/place_response_collection.dart';

abstract class BasePlacesRepository {
  Future fetchPlaces();
}

class PlacesRepository implements BasePlacesRepository {
  @override
  Future fetchPlaces() {
    return http
        .get(Uri.parse('https://dot-mobile-test.web.app/place.json'))
        .then((value) {
      try {
        var json = jsonDecode(value.body);
        print(":: RESULT : ${value.body} ::");

        var response = PlacesResponseCollection.fromJson(json);
        //  todo: (NEXT) JANGAN LUPA DI HAPUS
        print(":: TYPE : ${response.toString()} ::");
        if (response is PlacesResponseCollection) {
          return response;
        } else {
          print(":: ERROR response type ::");
          return null;
        }
      } catch (err) {
        print("ERROR: $err");
        return null;
      }
    });
  }
}
