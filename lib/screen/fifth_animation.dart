import 'package:animation_for_flutter/screen/six_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FifthAnimation extends StatefulWidget {
  const FifthAnimation({Key? key}) : super(key: key);

  @override
  State<FifthAnimation> createState() => _FifthAnimationState();
}

double defaultWidth = 150.w;

class _FifthAnimationState extends State<FifthAnimation> {
  var _isZoomedIn = false;
  var _buttonTitle = 'Zoom In';
  var _width = defaultWidth;
  var _curve = Curves.bounceOut;

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 370),
                width: _width,
                curve: _curve,
                child: Image.asset(
                  'assets/images/wallpaper.jpg',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isZoomedIn = !_isZoomedIn;
                  _buttonTitle = _isZoomedIn ? 'Zoom Out' : 'Zoom In';
                  _width = _isZoomedIn
                      ? MediaQuery.of(context).size.width
                      : defaultWidth;
                  _curve = _isZoomedIn ? Curves.bounceInOut : Curves.bounceOut;
                });
              },
              child: Text(
                _buttonTitle,
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
              builder: (context) => const SixAnimation(),
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
