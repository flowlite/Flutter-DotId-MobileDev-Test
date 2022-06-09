// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlacesStore on _PlacesStore, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: '_PlacesStore.state'))
      .value;

  late final _$_placeFutureAtom =
      Atom(name: '_PlacesStore._placeFuture', context: context);

  @override
  ObservableFuture<dynamic>? get _placeFuture {
    _$_placeFutureAtom.reportRead();
    return super._placeFuture;
  }

  @override
  set _placeFuture(ObservableFuture<dynamic>? value) {
    _$_placeFutureAtom.reportWrite(value, super._placeFuture, () {
      super._placeFuture = value;
    });
  }

  late final _$placesContentsAtom =
      Atom(name: '_PlacesStore.placesContents', context: context);

  @override
  List<PlacesContent>? get placesContents {
    _$placesContentsAtom.reportRead();
    return super.placesContents;
  }

  @override
  set placesContents(List<PlacesContent>? value) {
    _$placesContentsAtom.reportWrite(value, super.placesContents, () {
      super.placesContents = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_PlacesStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$getPlacesAsyncAction =
      AsyncAction('_PlacesStore.getPlaces', context: context);

  @override
  Future<dynamic> getPlaces() {
    return _$getPlacesAsyncAction.run(() => super.getPlaces());
  }

  @override
  String toString() {
    return '''
placesContents: ${placesContents},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
