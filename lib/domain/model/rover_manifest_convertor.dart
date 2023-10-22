import 'package:roverexplorer/domain/model/rover_manifest_ui_model.dart';
import 'package:roverexplorer/service/model/rover_manifest_remote_model.dart';

Success toUiModel(RoverManifestRemoteModel roverManifestRemoteModel) {
  final roverManifestUiModelList = roverManifestRemoteModel.photoManifest.photos
      .map((photo) => RoverManifestUiModel(
          photo.sol.toString(), photo.earthDate, photo.totalPhotos.toString()))
      .toList();

  roverManifestUiModelList.sort((a,b) => b.earthDate.compareTo(a.earthDate));

  return Success(roverManifestUiModelList);
}
