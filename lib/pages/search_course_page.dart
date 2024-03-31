import 'package:course/cache/cache.dart';
import 'package:course/models/course_model.dart';
import 'package:course/services/course/course_service.dart';
import 'package:course/widgets/course_tile.dart';
import 'package:flutter/material.dart';

class SearchCoursePage extends StatefulWidget {
  const SearchCoursePage({super.key});

  @override
  State<SearchCoursePage> createState() => _SearchCoursePageState();
}

class _SearchCoursePageState extends State<SearchCoursePage> {
  Future<void> _getCourse() async {
    var courses = await getCourses({});
    setState(() {
      courseList = courses;
    });
  }

  int? userId = AppCache.userId;
  String? userRole = AppCache.userRole;

  @override
  void initState() {
    super.initState();
    _getCourse();
  }

  Future<void> _fatchNewCourses() async {
    _getCourse();
  }

  List<Course> courseList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('查詢課程'),
      ),
      body: ListView.builder(
        itemCount: courseList.length,
        itemBuilder: (context, index) {
          return CourseTile(
            courseId: courseList[index].id,
            name: courseList[index].name,
            timeWeek: courseList[index].timeWeek,
            timePeriod: courseList[index].timePeriod,
            student: courseList[index].student,
            isCreator: userId == courseList[index].creator,
            canEnroll: userRole == 'student' &&
                !courseList[index].student.contains(userId),
            fatchNewCourses: _fatchNewCourses,
          );
        },
      ),
    );
  }
}
