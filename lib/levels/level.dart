import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:platform_game/actors/player.dart';

class Level extends World {
  final String levelName;

  Level({required this.levelName});

  late TiledComponent level;

  @override
  Future<dynamic> onLoad() async {
    level = await TiledComponent.load('$levelName.tmx', Vector2(16, 16));
    add(level);
    final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>('Spawnpoints');
    for (final spawnPoint in spawnPointsLayer!.objects) {
      switch (spawnPoint.class_) {
        case 'Player':
          final player = Player(character: 'Ninja Frog', position: Vector2(spawnPoint.x, spawnPoint.y));
          add(player);
      }
    }
    return super.onLoad();
  }
}
