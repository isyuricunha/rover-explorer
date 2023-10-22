class CameraRemoteModel {
  final String fullName;
  final int id;
  final String name;
  final int roverId;

  const CameraRemoteModel(
      {required this.fullName,
      required this.id,
      required this.name,
      required this.roverId});

  factory CameraRemoteModel.fromJson(Map<String, dynamic> json) {
    return CameraRemoteModel(
        fullName: json['full_name'],
        id: json['id'],
        name: json['name'],
        roverId: json['rover_id']);
  }
}
