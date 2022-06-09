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
    // Simulate network delay
    return http.get(Uri.parse('https://dot-mobile-test.web.app/place.json')).then(
      (value) {
        var response = jsonDecode(value.toString());
        if (response is PlacesResponseCollection){
          return response;
        }
        else {
          return null;
        }
    });
  }
}