import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:roverexplorer/service/model/rover_photo_remote_model.dart';

class PhotoService {

  Future<RoverPhotoRemoteModel> fetchPhoto(String roverName, String sol) async {
    final response = await http.get(Uri.parse(
        'https://api.nasa.gov/mars-photos/api/v1/rovers/$roverName/photos?api_key=DEMO_KEY&sol=$sol'
    ));

    if (response.statusCode == 200) {
      return RoverPhotoRemoteModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load photo');
    }
  }
}