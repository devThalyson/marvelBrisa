import 'package:http/http.dart' as http;

class MapsApi {
  static Future<String> getLocation(double lat, double long) async {
    try {
      Uri url = Uri.parse(
          "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=AIzaSyAXhk1498g30RPHcP6Wytkouh0Mn28obVo");

      var response = await http.get(
        url,
      );
      print(response.body);
    } catch (erro) {
      print("#######");
      print(erro);
      print("#######");
    }
  }
}
