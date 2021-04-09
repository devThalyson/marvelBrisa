import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
part 'map_controller.g.dart';

class MapController = _MapControllerBase with _$MapController;

abstract class _MapControllerBase with Store {
  @observable
  GoogleMapController mapController;

  @observable
  Set<Marker> markers;

  @action
  onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @action
  setMarker(Marker marker) {
    markers = {};
    mapController.moveCamera(
      //Latitude e longitude fixas do ponto cujo a camera do mapa vai procurar.
      CameraUpdate.newLatLng(LatLng(-7.219996596848331, -39.32716231676682)),
    );
    markers.add(marker);
  }

  String validatorFormField(String txt) {
    if (txt.isEmpty) {
      return "Fill the field";
    }
  }
}
