import 'dart:io';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'pixel_adventure.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  bool isMobile;

  if (Platform.isAndroid || Platform.isIOS) {
    isMobile = true;
  } else {
    isMobile = false;
  }

  PixelAdventure game = PixelAdventure(showJoystick: isMobile);
  runApp(
    GameWidget(game: kDebugMode ? PixelAdventure(showJoystick: isMobile) : game),
  );
}
