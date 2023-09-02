import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'four_animation.dart';

class ThirdAnimation extends StatefulWidget {
  const ThirdAnimation({Key? key}) : super(key: key);

  @override
  State<ThirdAnimation> createState() => _ThirdAnimationState();
}

class _ThirdAnimationState extends State<ThirdAnimation>
    with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Tween<double> _animation;
  double widthAndHeight = 150.h;

  @override
  void initState() {
    super.initState();

    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    );

    _animation = Tween<double>(
      begin: 0,
      end: pi * 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();

    _yController
      ..reset()
      ..repeat();

    _zController
      ..reset()
      ..repeat();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50.h,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text(
            'Animation Flutter',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AnimatedBuilder(
                animation: Listenable.merge([
                  _xController,
                  _yController,
                  _zController,
                ]),
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateX(_animation.evaluate(_xController))
                      ..rotateY(_animation.evaluate(_yController))
                      ..rotateZ(_animation.evaluate(_zController)),
                    child: Stack(
                      children: [
                        // back
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..translate(Vector3(0, 0, -widthAndHeight)),
                          child: Container(
                            color: Colors.purple,
                            width: widthAndHeight,
                            height: widthAndHeight,
                          ),
                        ),
                        // left side
                        Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix4.identity()..rotateY(pi / 2.0),
                          child: Container(
                            color: Colors.red,
                            width: widthAndHeight,
                            height: widthAndHeight,
                          ),
                        ),
                        // left side
                        Transform(
                          alignment: Alignment.centerRight,
                          transform: Matrix4.identity()..rotateY(-pi / 2.0),
                          child: Container(
                            color: Colors.blue,
                            width: widthAndHeight,
                            height: widthAndHeight,
                          ),
                        ),
                        // front
                        Container(
                          color: Colors.green,
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                        // top side
                        Transform(
                          alignment: Alignment.topCenter,
                          transform: Matrix4.identity()..rotateX(-pi / 2.0),
                          child: Container(
                            color: Colors.orange,
                            width: widthAndHeight,
                            height: widthAndHeight,
                          ),
                        ),
                        // bottom side
                        Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.identity()..rotateX(pi / 2.0),
                          child: Container(
                            color: Colors.brown,
                            width: widthAndHeight,
                            height: widthAndHeight,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FourAnimation(),
            ),
          );
        },
        icon: Icon(
          Icons.arrow_forward,
          size: 25.w,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }
}
