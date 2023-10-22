import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roverexplorer/domain/model/rover_ui_model.dart';
import 'package:roverexplorer/domain/model/rover_uimodel_creator.dart';
import 'package:roverexplorer/screens/manifest_list.dart';

class RoverList extends StatefulWidget {
  static const routeName = '/';

  const RoverList({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _RoverListState();

}

class _RoverListState extends State<RoverList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: roverUiModelList.length,
          cacheExtent: 20.0,
          controller: ScrollController(),
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) => Rover(roverUiModelList[index])),
    );
  }
}


class Rover extends StatelessWidget {
  final RoverUiModel roverUiModel;

  const Rover(this.roverUiModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () => {
          context.push('${ManifestList.fullPath}/${roverUiModel.name}')
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
                  roverUiModel.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset(roverUiModel.img),
              const Text("Credit: NASA/JPL", style: TextStyle(fontSize: 11)),
              Text("Landing date: ${roverUiModel.landingDate}", style: const TextStyle(fontSize: 12)),
              Text("Distance traveled: ${roverUiModel.distance}", style: const TextStyle(fontSize: 12))
            ],
          ),
        )),
      ),
    );
  }
}
