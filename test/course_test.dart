// import 'package:flutter_test/flutter_test.dart';
// import 'package:course/services/course/course_service.dart'; // 更換成你的服務文件

// import 'package:flutter_test/flutter_test.dart';
// import 'package:dio/dio.dart';

// void main() {
//   group('Course Service Tests', () {
//     Dio dio = Dio(); // 初始化 Dio 實例
//     CourseService courseService = CourseService(dio); // 將 Dio 實例傳遞給服務

//     test('Test getEnrolledCourses', () async {
//       // Arrange - 登入並設置 Authorization header
//       await login(dio); // 假設你有一個登入函數可以完成登入操作
//       // Act
//       List<Course> courses = await courseService.getEnrolledCourses();

//       // Assert
//       expect(courses.isNotEmpty, true);
//       // 在這裡加入更多斷言，比如檢查 courses 中的元素是否符合預期的結果
//     });

//     // 再寫其他的測試，例如測試 cancelCourse 和 getMyCourses
//   });
// }

// // 登入函數示例
// Future<void> login(Dio dio) async {
//   try {
//     var response = await dio.post('login', data: {'username': 'example', 'password': 'password'});
//     String token = response.data['token']; // 假設登入成功後返回 token
//     dio.options.headers['Authorization'] = 'Bearer $token'; // 設置 Authorization header
//   } catch (error) {
//     print(error);
//   }
// }

