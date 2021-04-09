import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_brisa/controller/map_controller.dart';
import 'package:marvel_brisa/custom_widgets/custom_snackbar.dart';
import 'package:marvel_brisa/custom_widgets/custom_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:marvel_brisa/utils/show_dialog.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final _mapController = MapController();

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
                onMapCreated: _mapController.onMapCreated,
                initialCameraPosition: CameraPosition(
                  //Posição inicial fixa em Ibicuitinga (minha cidade).
                  target: LatLng(-4.95962, -38.6284),
                  zoom: 11,
                ),
                markers: _mapController.markers != null
                    ? _mapController.markers
                    : {},
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: TextFormField(
                  validator: _mapController.validatorFormField,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(3),
                    hintText: "Type an address",
                  ),
                ),
              ),
            ),
            Container(
              child: IconButton(
                onPressed: () {
                  //A função só vai prosseguir se os campos de formulário forem válidos.
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  //Criando um marker fixo para o exemplo.
                  final Marker marker = Marker(
                    markerId: MarkerId("123"),
                    //Latitude e longitude fixas do ponto a ser marcado no mapa.
                    position: LatLng(-7.219996596848331, -39.32716231676682),
                    onTap: _showDialog,
                    infoWindow: InfoWindow(
                      title: "Brisanet",
                      snippet: "Juazeiro do Norte / CE",
                    ),
                  );
                  _mapController.setMarker(marker);
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

  //Função que chama um método costumizado com o objetivo de mostrar um diálogo e logo depois uma snackbar.
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
