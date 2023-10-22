import 'package:flutter/material.dart';
import 'package:roverexplorer/domain/model/rover_photo_ui_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Photo extends StatelessWidget {
  final RoverPhotoUiModel roverPhotoUiModel;

  final GestureTapCallback gestureTapCallback;

  const Photo(this.roverPhotoUiModel, this.gestureTapCallback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: gestureTapCallback,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Text(roverPhotoUiModel.roverName,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold))),
                  Image.network(roverPhotoUiModel.imgSrc),
                  Text(AppLocalizations.of(context).sol(roverPhotoUiModel.sol),
                      style: const TextStyle(fontSize: 12)),
                  Text(
                      AppLocalizations.of(context)
                          .earthDate(roverPhotoUiModel.earthDate),
                      style: const TextStyle(fontSize: 12)),
                  Text(roverPhotoUiModel.cameraFullName,
                      style: const TextStyle(fontSize: 12))
                ],
              ),
            ),
          ),
        ));
  }
}
