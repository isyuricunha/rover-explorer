import 'manifest_photo_remote_model.dart';

class PhotoManifestRemoteModel {
  final String landingDate;
  final String launchDate;
  final String maxDate;
  final int maxSol;
  final String name;
  final List<ManifestPhotoRemoteModel> photos;
  final String status;
  final int totalPhotos;

  const PhotoManifestRemoteModel(
      {required this.landingDate,
      required this.launchDate,
      required this.maxDate,
      required this.maxSol,
      required this.name,
      required this.photos,
      required this.status,
      required this.totalPhotos});

  factory PhotoManifestRemoteModel.fromJson(Map<String, dynamic> json) {
    return PhotoManifestRemoteModel(
        landingDate: json['landing_date'],
        launchDate: json['launch_date'],
        maxDate: json['max_date'],
        maxSol: json['max_sol'],
        name: json['name'],
        photos: (json['photos'] as List)
            .map((e) => ManifestPhotoRemoteModel.fromJson(e))
            .toList(),
        status: json['status'],
        totalPhotos: json['total_photos']);
  }
}
