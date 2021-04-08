import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_brisa/controller/controller.dart';
import 'package:marvel_brisa/custom_widgets/custom_snackbar.dart';
import 'package:marvel_brisa/custom_widgets/custom_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marvel_brisa/utils/show_dialog.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  GoogleMapController mapController;
  final _controller = Controller();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          texto: "Send Comic to an Address",
        ),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: [
        Expanded(
          child: Observer(
            builder: (_) {
              return GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(-4.95962, -38.6284),
                  zoom: 11,
                ),
                markers: _controller.markers != null ? _controller.markers : {},
                onTap: (position) {
                  print(position);
                },
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: _controller.validatorFormField,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(3),
                      hintText: "Type an address",
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: IconButton(
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  _controller.setPosition();
                  mapController.moveCamera(
                    CameraUpdate.newLatLng(_controller.position),
                  );
                  final Marker marker = Marker(
                    markerId: MarkerId("123"),
                    position: _controller.position,
                    onTap: _showDialog,
                    infoWindow: InfoWindow(
                      title: "Brisanet",
                      snippet: "Juazeiro do Norte / CE",
                    ),
                  );
                  _controller.setMarker(marker);
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  _showDialog() {
    ShowDialog().onClickDialogOkorNot(
      context,
      "Are you sure you want to send the comic to the selected address?",
      () {
        final snackBar = CustomSnackbar();
        ScaffoldMessenger.of(context).showSnackBar(
          snackBar.build(context),
        );
      },
    );
  }
}
