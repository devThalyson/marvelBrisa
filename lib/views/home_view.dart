import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_brisa/controller/controller.dart';
import 'package:marvel_brisa/custom_widgets/comic_card.dart';
import 'package:marvel_brisa/custom_widgets/custom_appbar.dart';
import 'package:marvel_brisa/model/comic.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = Controller();

  @override
  void initState() {
    super.initState();

    _controller.getComics();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      titulo: "Marvel Comics",
      child: _body(),
    );
  }

  _body() {
    return Observer(
      builder: (_) {
        return _controller.comics != null
            ? MediaQuery.removePadding(
                context: _,
                removeTop: true,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 4 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _controller.comics.length != 0
                      ? _controller.comics.length
                      : 0,
                  itemBuilder: (_, index) {
                    _controller.comics.sort(
                      (a, b) => a.title.compareTo(b.title),
                    );
                    Comic comic = _controller.comics[index];
                    return ComicCard(
                      comic,
                    );
                  },
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
