import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roverexplorer/data/manifest_provider.dart';
import 'package:roverexplorer/data/photo_provider.dart';
import 'package:roverexplorer/screens/manifest_list.dart';
import 'package:roverexplorer/screens/photo_list.dart';
import 'package:roverexplorer/screens/rover_list.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:roverexplorer/service/mars_rover_manifest_service.dart';
import 'package:roverexplorer/service/mars_rover_photo_service.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ManifestProvider(ManifestService())),
    ChangeNotifierProvider(create: (context) => PhotoProvider(PhotoService()))
  ], child:const MarsRoverExplorer()));
}

GoRouter router() {
  return GoRouter(routes: [
    GoRoute(
        path: RoverList.routeName,
        builder: (context, state) =>
            const RoverList(title: "Mars Rover Explorer"),
        routes: [
          GoRoute(
              path: 'manifest/:rovername',
              name: 'manifest',
              builder: (context, state) {
                return ManifestList(
                    title: "Mars Rover Explorer",
                    roverName:
                        state.pathParameters["rovername"] ?? 'not found');
              }),
          GoRoute(
              path: 'photo/:name',
              name: 'photo',
            builder: (context, state) {
                return PhotoList(
                    title: 'Mars Rover Explorer',
                    roverName: state.pathParameters['name'] ?? 'not found',
                    sol: state.queryParameters['sol'] ?? 'not found'
                );
            }
          )
        ])
  ]);
}

class MarsRoverExplorer extends StatelessWidget {
  const MarsRoverExplorer({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mars Rover Explorer',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router(),
    );
  }
}
