// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ComicsController on _ComicsControllerBase, Store {
  final _$cachedComicsAtom = Atom(name: '_ComicsControllerBase.cachedComics');

  @override
  List<Comic> get cachedComics {
    _$cachedComicsAtom.reportRead();
    return super.cachedComics;
  }

  @override
  set cachedComics(List<Comic> value) {
    _$cachedComicsAtom.reportWrite(value, super.cachedComics, () {
      super.cachedComics = value;
    });
  }

  final _$comicsAtom = Atom(name: '_ComicsControllerBase.comics');

  @override
  List<Comic> get comics {
    _$comicsAtom.reportRead();
    return super.comics;
  }

  @override
  set comics(List<Comic> value) {
    _$comicsAtom.reportWrite(value, super.comics, () {
      super.comics = value;
    });
  }

  final _$getComicsAsyncAction = AsyncAction('_ComicsControllerBase.getComics');

  @override
  Future getComics() {
    return _$getComicsAsyncAction.run(() => super.getComics());
  }

  final _$_ComicsControllerBaseActionController =
      ActionController(name: '_ComicsControllerBase');

  @override
  dynamic searchComic(String search) {
    final _$actionInfo = _$_ComicsControllerBaseActionController.startAction(
        name: '_ComicsControllerBase.searchComic');
    try {
      return super.searchComic(search);
    } finally {
      _$_ComicsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cachedComics: ${cachedComics},
comics: ${comics}
    ''';
  }
}
