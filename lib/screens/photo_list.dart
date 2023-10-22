import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roverexplorer/data/photo_provider.dart';
import 'package:roverexplorer/domain/model/rover_photo_ui_model.dart';
import 'package:roverexplorer/screens/error_screen.dart';
import 'package:roverexplorer/screens/loading_screen.dart';
import 'package:roverexplorer/screens/photo.dart';

class PhotoList extends StatefulWidget {
  static const routeName = 'photo';
  static const fullPath = '/$routeName';

  const PhotoList(
      {super.key,
      required this.title,
      required this.roverName,
      required this.sol});

  final String title;

  final String roverName;

  final String sol;

  @override
  State<StatefulWidget> createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  @override
  void initState() {
    super.initState();
    var photoProvider = context.read<PhotoProvider>();
    photoProvider.getMarsRoverPhoto(widget.roverName, widget.sol);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title)),
      body: Consumer<PhotoProvider>(
        builder: (context, photoState, child) =>
            switch (photoState.roverPhotoUiState) {
          Success() => ListView.builder(
              itemCount: (photoState.roverPhotoUiState as Success)
                  .roverPhotoUiModelList
                  .length,
              cacheExtent: 20.0,
              controller: ScrollController(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (context, index) =>
                  Photo((photoState.roverPhotoUiState as Success).roverPhotoUiModelList[index], () {})),
            Loading() => const LoadingScreen(),
            Error() => const ErrorScreen()
        },
      ),
    );
  }
}
