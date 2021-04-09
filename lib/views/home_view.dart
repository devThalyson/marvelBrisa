import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_brisa/controller/comics_controller.dart';
import 'package:marvel_brisa/custom_widgets/comic_card.dart';
import 'package:marvel_brisa/custom_widgets/custom_appbar.dart';
import 'package:marvel_brisa/model/comic.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _comicsController = ComicsController();

  @override
  void initState() {
    super.initState();

    //Ao iniciar o app, a api de quadrinhos vai ser chamada.
    _comicsController.getComics();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      titulo: "Marvel Comics",
      child: _body(),
    );
  }

  _body() {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(5),
          elevation: 10,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: (search) {
                    print("#######");
                    print(search);
                    _comicsController.searchComic(search);
                    print(search);
                    print("#######");
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(3),
                    hintText: "Search a especific comic",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(3),
                child: Icon(Icons.search),
              ),
            ],
          ),
        ),
        Observer(
          builder: (_) {
            List<Comic> _comics = _comicsController.comics != null
                ? _comicsController.comics
                : _comicsController.cachedComics;
            return _comics != null
                ? MediaQuery.removePadding(
                    context: _,
                    removeTop: true,
                    child: Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 4 / 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: _comics.length != 0 ? _comics.length : 0,
                        itemBuilder: (_, index) {
                          //Organizando a lista de quadrinhos por ordem alfabetica.
                          _comics.sort(
                            (a, b) => a.title.compareTo(b.title),
                          );
                          Comic comic = _comics[index];
                          return ComicCard(
                            comic,
                          );
                        },
                      ),
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
          },
        ),
      ],
    );
  }
}
