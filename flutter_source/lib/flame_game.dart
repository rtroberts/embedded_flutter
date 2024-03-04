import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class CashPopGame extends FlameGame {
  CashPopGame({required this.winningNumber})
      : super(
            camera:
                CameraComponent.withFixedResolution(width: 1069, height: 666));

  double get width => size.x;
  double get height => size.y;
  Vector2 get center => Vector2(width / 2, height / 2);
  int winningNumber = Random().nextInt(50);

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    camera.viewfinder.anchor = Anchor.topLeft;
    var winner = WinningNumber(position: center, winner: winningNumber);
    world.add(winner);
    winner.enter();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}

class WinningNumber extends TextComponent {
  WinningNumber({required super.position, required int winner})
      : super(
            text: winner.toString(),
            priority: 4,
            anchor: Anchor.center,
            textRenderer: TextPaint(
                style:
                    const TextStyle(fontSize: 12, color: Colors.blue, shadows: [
              Shadow(
                  offset: Offset(12, 12),
                  blurRadius: 0,
                  color: Color.fromARGB(120, 0, 0, 0))
            ])));

  void enter() {
    final scaleEffect =
        ScaleEffect.to(Vector2.all(0.5), ReverseLinearEffectController(1));
    final opacityEffect = OpacityEffect.to(0, ReverseLinearEffectController(1));
    final moveEffect =
        MoveEffect.by(Vector2(0, 2), ReverseLinearEffectController(2));
    add(scaleEffect);
    add(opacityEffect);
    add(moveEffect);
  }
}
