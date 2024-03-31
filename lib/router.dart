import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/lobby_page.dart';
import 'pages/create_course_page.dart';
import 'pages/search_course_page.dart';
import 'pages/teachers_page.dart';

// 定義 router
final Map<String, WidgetBuilder> routes = {
  '/': (context) => HomePage(),
  '/login': (context) => const LoginPage(),
  '/register': (context) => const RegisterPage(),
  '/lobby': (context) => LobbyPage(),
  '/create-course': (context) => CreateCoursePage(),
  '/search-course': (context) => const SearchCoursePage(),
  '/teachers': (context) => const TeacherPage()
};
