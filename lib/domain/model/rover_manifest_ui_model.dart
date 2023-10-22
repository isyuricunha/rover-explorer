
sealed class RoverManifestUiState{}

class Loading extends RoverManifestUiState{}

class Error extends RoverManifestUiState{}

class Success extends RoverManifestUiState{
  List<RoverManifestUiModel> roverManifestUiModelList;

  Success(this.roverManifestUiModelList);
}

class RoverManifestUiModel {
  String sol;
  String earthDate;
  String photoNumber;

  RoverManifestUiModel(this.sol, this.earthDate, this.photoNumber);
}