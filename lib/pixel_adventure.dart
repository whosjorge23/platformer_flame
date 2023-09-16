import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:platform_game/levels/level.dart';

class PixelAdventure extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF211f30);

  late final CameraComponent cam;

  final world = Level(levelName: 'Level-01');

  @override
  FutureOr<void> onLoad() {
    //Load all images into cache
    loadAllImagesIntoCache();

    cam = CameraComponent.withFixedResolution(world: world, width: 640, height: 360);
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, world]);
    return super.onLoad();
  }

  loadAllImagesIntoCache() async {
    await images.loadAllImages();
  }
}
