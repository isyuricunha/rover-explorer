class RoverRemoteModel {
  final int id;
  final String landingDate;
  final String launchDate;
  final String name;
  final String status;

  const RoverRemoteModel(
      {required this.id,
      required this.landingDate,
      required this.launchDate,
      required this.name,
      required this.status});

  factory RoverRemoteModel.fromJson(Map<String, dynamic> json) {
    return RoverRemoteModel(
        id: json['id'],
        landingDate: json['landing_date'],
        launchDate: json['launch_date'],
        name: json['name'],
        status: json['status']);
  }
}
