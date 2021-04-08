import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:marvel_brisa/model/response_api.dart';

import 'package:marvel_brisa/utils/helper_url_api.dart';

class MarvelApi {
  static Future<MarvelApiResponse> getResponse() async {
    try {
      var url = Uri.parse(HelperUrlApi().gerarUrl());

      print(url);

      var response = await http.get(
        url,
      );

      Map mapResponse = convert.json.decode(response.body);

      final MarvelApiResponse apiResponse =
          MarvelApiResponse.fromJson(mapResponse);

      return apiResponse;
    } catch (error) {
      print("###########");
      print(error);
      print("###########");
    }
  }
}
