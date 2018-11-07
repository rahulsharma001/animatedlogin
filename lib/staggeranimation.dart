import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  Animation buttonSqueezeAnimation;
  Animation buttonZoomOut;
  AnimationController buttonController;
  Animation<EdgeInsets> containerCircleAnimation;

  StaggerAnimation({Key key, this.buttonController})
      : buttonSqueezeAnimation = new Tween(
          begin: 320.0,
          end: 70.0,
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: Interval(0.0, 0.150),
          ),
        ),
        buttonZoomOut = new Tween(
          begin: 70.0,
          end: 1000.0,
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: Interval(
              0.550,
              0.999,
            ),
          ),
        );

  Future<Null> _playAnimation() async {
    try {
      await buttonController.forward();
      await buttonController.reverse();
    } on TickerCanceled {}
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return InkWell(
      onTap: () {
        _playAnimation();
      },
      child: Hero(
          tag: "fade",
          child: buttonZoomOut.value <= 300 ? Container(
            width: buttonZoomOut.value == 70 ?  buttonSqueezeAnimation.value : buttonZoomOut.value,
            height: buttonZoomOut.value == 70 ?60.0:buttonZoomOut.value,
            alignment: FractionalOffset.center,
            
          ) : Container()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: buttonController,
    );
  }
}
