import 'dart:convert';

import 'package:crypto/crypto.dart';

//Classe que auxilia a criação da URL de acesso a api (junta as minhas chaves com um hash)
class HelperUrlApi {
  static String publicApiKey = "8d1659d056386a45684e2ddbfce56be2";
  static String privateApiKey = "b101e3407b99901911547838c3d78247d6f3745b";

  var url = "http://gateway.marvel.com/v1/public/comics";
  var timeStamp = DateTime.now();
  var hash;

  String gerarUrl() {
    gerarHash();
    String urlFinal =
        "$url?apikey=${HelperUrlApi.publicApiKey}&hash=$hash&ts=${timeStamp.toIso8601String()}";

    return urlFinal;
  }

  gerarHash() {
    hash = generateMd5(timeStamp.toIso8601String() +
        HelperUrlApi.privateApiKey +
        HelperUrlApi.publicApiKey);
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
