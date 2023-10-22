import 'package:flutter/cupertino.dart';
import 'package:roverexplorer/domain/model/rover_manifest_convertor.dart';
import 'package:roverexplorer/domain/model/rover_manifest_ui_model.dart';
import 'package:roverexplorer/service/mars_rover_manifest_service.dart';
import 'package:roverexplorer/service/model/rover_manifest_remote_model.dart';

class ManifestProvider with ChangeNotifier {
  final ManifestService _manifestService;

  ManifestProvider(this._manifestService);

  RoverManifestUiState _roverManifestUiState = Loading();

  RoverManifestUiState get roverManifestUiState => _roverManifestUiState;

  set roverManifestUiState(RoverManifestUiState newRoverManifestUiState) {
    _roverManifestUiState = newRoverManifestUiState;
    notifyListeners();
  }

  Future getMarsRoverManifest(String roverName) async {
    Future.delayed(Duration.zero, (){
      roverManifestUiState = Loading();
    });
    RoverManifestRemoteModel result = await _manifestService.fetchManifest(roverName);
    roverManifestUiState = toUiModel(result);
  }

}