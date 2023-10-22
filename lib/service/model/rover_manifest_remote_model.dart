

import 'package:roverexplorer/service/model/photo_manifest_remote_model.dart';

class RoverManifestRemoteModel {
  final PhotoManifestRemoteModel photoManifest;

  const RoverManifestRemoteModel({required this.photoManifest});

  factory RoverManifestRemoteModel.fromJson(Map<String, dynamic> json) {
    return RoverManifestRemoteModel(photoManifest: PhotoManifestRemoteModel.fromJson(json['photo_manifest']));
  }
}