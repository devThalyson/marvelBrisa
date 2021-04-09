import 'package:marvel_brisa/api/marvel_api.dart';
import 'package:marvel_brisa/model/comic.dart';
import 'package:marvel_brisa/model/response_api.dart';
import 'package:mobx/mobx.dart';
part 'comics_controller.g.dart';

class ComicsController = _ComicsControllerBase with _$ComicsController;

abstract class _ComicsControllerBase with Store {
  MarvelApiResponse marvelResponse;

  @observable
  List<Comic> cachedComics;

  @observable
  List<Comic> comics;

  @action
  getComics() async {
    marvelResponse = await MarvelApi.getResponse();
    cachedComics = marvelResponse.data.comics;
  }

  @action
  searchComic(String search) {
    comics = cachedComics;
    comics = comics
        .where(
          (element) => element.title.toLowerCase().startsWith(
                search.toLowerCase(),
              ),
        )
        .toList();
  }
}
