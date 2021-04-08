// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on _ControllerBase, Store {
  final _$markersAtom = Atom(name: '_ControllerBase.markers');

  @override
  Set<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  final _$comicsAtom = Atom(name: '_ControllerBase.comics');

  @override
  List<Comic> get comics {
    _$comicsAtom.reportRead();
    return super.comics;
  }

  @override
  set comics(List<Comic> value) {
    _$comicsAtom.reportWrite(value, super.comics, () {
      super.comics = value;
    });
  }

  final _$positionAtom = Atom(name: '_ControllerBase.position');

  @override
  LatLng get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(LatLng value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  final _$getComicsAsyncAction = AsyncAction('_ControllerBase.getComics');

  @override
  Future getComics() {
    return _$getComicsAsyncAction.run(() => super.getComics());
  }

  final _$_ControllerBaseActionController =
      ActionController(name: '_ControllerBase');

  @override
  dynamic setPosition() {
    final _$actionInfo = _$_ControllerBaseActionController.startAction(
        name: '_ControllerBase.setPosition');
    try {
      return super.setPosition();
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMarker(Marker marker) {
    final _$actionInfo = _$_ControllerBaseActionController.startAction(
        name: '_ControllerBase.setMarker');
    try {
      return super.setMarker(marker);
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
markers: ${markers},
comics: ${comics},
position: ${position}
    ''';
  }
}
