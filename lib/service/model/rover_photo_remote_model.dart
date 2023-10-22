import 'package:roverexplorer/service/model/photo_remote_model.dart';

class RoverPhotoRemoteModel {
  final List<PhotoRemoteModel> photos;

  const RoverPhotoRemoteModel({required this.photos});

  factory RoverPhotoRemoteModel.fromJson(Map<String, dynamic> json) {
    return RoverPhotoRemoteModel(
        photos: (json['photos'] as List)
            .map((e) => PhotoRemoteModel.fromJson(e))
            .toList());
  }
}
