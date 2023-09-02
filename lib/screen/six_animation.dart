import 'package:animation_for_flutter/screen/seven_animation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:developer' as devtools show log;
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

class CircleClipper extends CustomClipper<Path> {
  const CircleClipper();

  @override
  Path getClip(Size size) {
    var path = Path();

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    path.addOval(rect);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Color getRandomColor() => Color(
      0xFF000000 +
          math.Random().nextInt(
            0x00FFFFFF,
          ),
    );

class SixAnimation extends StatefulWidget {
  const SixAnimation({Key? key}) : super(key: key);

  @override
  State<SixAnimation> createState() => _SixAnimationState();
}

class _SixAnimationState extends State<SixAnimation> {
  var _color = getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50.h,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text(
            'Animation Flutter 6',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h),
        child: Center(
          child: ClipPath(
            clipper: const CircleClipper(),
            child: TweenAnimationBuilder(
              tween: ColorTween(
                begin: getRandomColor(),
                end: _color,
              ),
              onEnd: () {
                setState(() {
                  _color = getRandomColor();
                });
              },
              duration: const Duration(seconds: 1),
              child: Container(
                height: 250.h,
                width: 200.w,
                color: Colors.red,
              ),
              builder: (context, Color? color, child) {
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    color!,
                    BlendMode.srcATop,
                  ),
                  child: child,
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SevenAnimation(),
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
}
