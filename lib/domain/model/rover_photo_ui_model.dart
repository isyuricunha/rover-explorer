sealed class RoverPhotoUiState {}

class Loading extends RoverPhotoUiState{}

class Error extends RoverPhotoUiState{}

class Success extends RoverPhotoUiState {
  List<RoverPhotoUiModel> roverPhotoUiModelList;

  Success(this.roverPhotoUiModelList);
}

class RoverPhotoUiModel {
  int id;
  String roverName;
  String imgSrc;
  String sol;
  String earthDate;
  String cameraFullName;

  RoverPhotoUiModel(this.id, this.roverName, this.imgSrc, this.sol, this.earthDate, this.cameraFullName);
}