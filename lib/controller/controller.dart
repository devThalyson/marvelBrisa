import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marvel_brisa/api/marvel_api.dart';
import 'package:marvel_brisa/model/comic.dart';
import 'package:marvel_brisa/model/response_api.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  MarvelApiResponse marvelResponse;

  @observable
  Set<Marker> markers;

  @observable
  List<Comic> comics;

  @observable
  LatLng position;

  @action
  getComics() async {
    marvelResponse = await MarvelApi.getResponse();
    comics = marvelResponse.data.comics;
  }

  @action
  setPosition() {
    position = LatLng(-7.219996596848331, -39.32716231676682);
  }

  @action
  setMarker(Marker marker) {
    markers = {};
    markers.add(marker);
  }

  String validatorFormField(String txt) {
    if (txt.isEmpty) {
      return "Fill the field";
    }
  }
}
