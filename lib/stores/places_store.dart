import 'package:flutter_dotid_mobiledev_test/entity/place/placesContent/places_content.dart';
import 'package:flutter_dotid_mobiledev_test/repository/places_repository.dart';
import 'package:flutter_dotid_mobiledev_test/responseCollection/place_response_collection.dart';
import 'package:mobx/mobx.dart';

part 'places_store.g.dart';

class PlacesStore extends _PlacesStore with _$PlacesStore {
  PlacesStore(PlacesRepository placesRepository) : super(placesRepository);
}

enum StoreState { initial, loading, loaded }

abstract class _PlacesStore with Store {
  final PlacesRepository _placesRepository;

  _PlacesStore(this._placesRepository);

  @observable
  ObservableFuture _placeFuture;

  @observable
  List<PlacesContent>? placesContents;

  @observable
  String? errorMessage;

  @computed
  StoreState get state {
    // If the user has not yet searched for a placesContent forecast or there has been an error
    if (_placeFuture == null ||
        _placeFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return _placeFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future getPlaces() async {
    try {
      // Reset the possible previous error message.
      errorMessage = null;
      // Fetch placesContent from the repository and wrap the regular Future into an observable.
      // This _placeFuture triggers updates to the computed state property.
      _placeFuture =
          ObservableFuture(_placesRepository.fetchPlaces());
      // ObservableFuture extends Future - it can be awaited and exceptions will propagate as usual.

      var response = await _placeFuture.result;
      if (response is PlacesResponseCollection){
        placesContents = response.data?.content;
      }
    } catch (err){
      errorMessage = "Couldn't fetch places. Is the device online?";
    }
  }
}