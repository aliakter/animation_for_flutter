import 'package:animation_for_flutter/usecase/people_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/person.dart';
import 'fifth_animation.dart';

class FourAnimation extends StatefulWidget {
  const FourAnimation({Key? key}) : super(key: key);

  @override
  State<FourAnimation> createState() => _FourAnimationState();
}

class _FourAnimationState extends State<FourAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50.h,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text(
            'People Animation Flutter 4',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];
          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PeopleDetailsScreen(
                    person: person,
                  ),
                ),
              );
            },
            leading: Hero(
              tag: person.name,
              child: Text(
                person.emoji,
                style: TextStyle(
                  fontSize: 30.sp,
                ),
              ),
            ),
            title: Text(
              person.name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
            ),
            subtitle: Text(
              '${person.age} years old',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20.w),
          );
        },
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FifthAnimation(),
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
