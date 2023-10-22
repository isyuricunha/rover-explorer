class ManifestPhotoRemoteModel {
  final List<String> cameras;
  final String earthDate;
  final int sol;
  final int totalPhotos;

  const ManifestPhotoRemoteModel({required this.cameras,
    required this.earthDate,
    required this.sol,
    required this.totalPhotos});

  factory ManifestPhotoRemoteModel.fromJson(Map<String, dynamic> json) {
    return ManifestPhotoRemoteModel(
        cameras: List<String>.from(json['cameras']),
        earthDate: json['earth_date'],
        sol: json['sol'],
        totalPhotos: json['total_photos']);
  }
}