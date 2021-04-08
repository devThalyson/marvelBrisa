import 'package:flutter/material.dart';
import 'package:marvel_brisa/custom_widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  final String titulo;
  final List<Widget> actions;
  final double expandirAte;
  final int elevacao;
  final bool fixar;
  final Widget child;

  CustomAppBar(
      {@required this.titulo,
      this.actions,
      this.elevacao,
      this.fixar = true,
      this.expandirAte,
      @required this.child});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, condition) {
        return [
          SliverAppBar(
            actions: actions,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: CustomText(
                texto: titulo,
                cor: Colors.white,
                tamanhoFonte: 20,
                bold: true,
              ),
            ),
            expandedHeight: expandirAte != null ? expandirAte : 100,
            pinned: fixar,
          ),
        ];
      },
      body: Container(
        color: Colors.white,
        child: child,
      ),
    );
  }
}
