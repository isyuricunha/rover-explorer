import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:roverexplorer/data/manifest_provider.dart';
import 'package:roverexplorer/domain/model/rover_manifest_ui_model.dart';
import 'package:roverexplorer/screens/error_screen.dart';
import 'package:roverexplorer/screens/loading_screen.dart';
import 'package:roverexplorer/screens/photo_list.dart';

class ManifestList extends StatefulWidget {
  static const routeName = 'manifest';
  static const fullPath = '/$routeName';

  final String title;

  final String roverName;

  const ManifestList({super.key, required this.title, required this.roverName});

  @override
  State<StatefulWidget> createState() => _ManifestListState();
}

class _ManifestListState extends State<ManifestList> {
  @override
  void initState() {
    super.initState();
    var manifestProvider = context.read<ManifestProvider>();
    manifestProvider.getMarsRoverManifest(widget.roverName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Consumer<ManifestProvider>(
        builder: (context, manifestState, child) =>
            switch (manifestState.roverManifestUiState) {
          Success() => ListView.builder(
              itemCount: ((manifestState.roverManifestUiState) as Success)
                  .roverManifestUiModelList
                  .length,
              cacheExtent: 20.0,
              controller: ScrollController(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (context, index) => Manifest(
                  (manifestState.roverManifestUiState as Success)
                      .roverManifestUiModelList[index],
                  widget.roverName)),
          Loading() => const LoadingScreen(),
          Error() => const ErrorScreen()
        },
      ),
    );
  }
}

class Manifest extends StatelessWidget {
  final RoverManifestUiModel roverManifestUiModel;

  final String roverName;

  const Manifest(this.roverManifestUiModel, this.roverName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () => {
          context.push(
            '${PhotoList.fullPath}/$roverName?sol=${roverManifestUiModel.sol}'
          )
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    AppLocalizations.of(context).sol(roverManifestUiModel.sol),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                    AppLocalizations.of(context)
                        .earthDate(roverManifestUiModel.earthDate),
                    style: const TextStyle(fontSize: 12)),
                Text(
                  AppLocalizations.of(context)
                      .numberPhoto(roverManifestUiModel.photoNumber),
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
