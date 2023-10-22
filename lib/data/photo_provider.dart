import 'package:flutter/material.dart';
import 'package:roverexplorer/domain/model/rover_photo_ui_model.dart';
import 'package:roverexplorer/service/mars_rover_photo_service.dart';
import 'package:roverexplorer/service/model/rover_photo_remote_model.dart';

class PhotoProvider with ChangeNotifier {
  final PhotoService _photoService;

  PhotoProvider(this._photoService);

  RoverPhotoUiState _roverPhotoUiState = Loading();

  RoverPhotoUiState get roverPhotoUiState => _roverPhotoUiState;

  set roverPhotoUiState(RoverPhotoUiState newRoverPhotoUiState) {
    _roverPhotoUiState = newRoverPhotoUiState;
    notifyListeners();
  }

  Future getMarsRoverPhoto(String roverName, String sol) async {
    Future.delayed(Duration.zero, () {
      roverPhotoUiState = Loading();
    });
    RoverPhotoRemoteModel result =
        await _photoService.fetchPhoto(roverName, sol);
    roverPhotoUiState = Success(result.photos
        .map((photo) => RoverPhotoUiModel(
            photo.id,
            photo.rover.name,
            photo.imgSrc,
            photo.sol.toString(),
            photo.earthDate,
            photo.camera.fullName))
        .toList());
  }
}
