import 'package:course/arguments/edit_course_page.dart';
import 'package:course/pages/enrolled_course.dart';
import 'package:course/pages/my_course_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/lobby_page.dart';
import 'pages/create_course_page.dart';
import 'pages/search_course_page.dart';
import 'pages/teachers_page.dart';
import 'pages/edit_course_page.dart';

// 定義 router
final Map<String, WidgetBuilder> routes = {
  '/': (context) => HomePage(),
  '/login': (context) => const LoginPage(),
  '/register': (context) => const RegisterPage(),
  '/lobby': (context) => LobbyPage(),
  '/create-course': (context) => CreateCoursePage(),
  '/search-course': (context) => const SearchCoursePage(),
  '/teachers': (context) => const TeacherPage(),
  '/edit-course': (context) => EditCoursePage(
        args: ModalRoute.of(context)!.settings.arguments
            as EditCoursePageArguments?,
      ),
  '/enrolled-courses': (context) => const EnrolledCoursePage(),
  '/my-courses': (context) => const MyCoursePage()
};
