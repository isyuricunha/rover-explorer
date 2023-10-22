import 'dart:convert';

import 'model/rover_manifest_remote_model.dart';
import 'package:http/http.dart' as http;

class ManifestService {

  Future<RoverManifestRemoteModel> fetchManifest(String roverName) async {
    final response = await http.get(Uri.parse(
        'https://api.nasa.gov/mars-photos/api/v1/manifests/$roverName?api_key=DEMO_KEY'));

    if(response.statusCode == 200) {
      return RoverManifestRemoteModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load manifest");
    }
  }
}