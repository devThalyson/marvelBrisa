import 'package:flutter/material.dart';
import 'package:marvel_brisa/custom_widgets/custom_text.dart';

class CustomSnackbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: CustomText(
        texto: "Comic successfully sent!",
      ),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );
  }
}
