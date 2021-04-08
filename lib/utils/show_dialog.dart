import 'package:flutter/material.dart';
import 'package:marvel_brisa/custom_widgets/custom_text.dart';

class ShowDialog {
  onClickDialogOkorNot(BuildContext context, String msg, Function function) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(msg),
            actions: [
              TextButton(
                child: CustomText(
                  texto: "Yes",
                  cor: Colors.blue[800],
                  bold: true,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  function();
                },
              ),
              TextButton(
                child: CustomText(
                  texto: "Cancel",
                  cor: Colors.blue[800],
                  bold: true,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
