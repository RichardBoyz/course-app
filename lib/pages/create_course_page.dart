import 'package:course/services/course/course_service.dart';
import 'package:flutter/material.dart';

class CreateCoursePage extends StatefulWidget {
  @override
  _CreateCoursePageState createState() => _CreateCoursePageState();
}

class _CreateCoursePageState extends State<CreateCoursePage> {
  String selectedDay = '1';
  String selectedStartHour = '00';
  String selectedStartMinute = '00';
  String selectedEndHour = '00';
  String selectedEndMinute = '00';

  final TextEditingController _nameController = TextEditingController();
  bool _errorName = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('建立課程'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: '課程名稱',
                border: const OutlineInputBorder(),
                errorText: _errorName ? '請輸入課程名稱' : null,
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text('每周'),
            DropdownButtonFormField<String>(
              value: selectedDay,
              decoration: const InputDecoration(labelText: '星期'),
              items: const [
                DropdownMenuItem(value: '1', child: Text('每周一')),
                DropdownMenuItem(value: '2', child: Text('每周二')),
                DropdownMenuItem(value: '3', child: Text('每周三')),
                DropdownMenuItem(value: '4', child: Text('每周四')),
                DropdownMenuItem(value: '5', child: Text('每周五')),
                DropdownMenuItem(value: '6', child: Text('每周六')),
                DropdownMenuItem(value: '7', child: Text('每周日')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedDay = value!;
                });
              },
            ),
            const SizedBox(height: 20.0),
            const Text('開始時間'),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedStartHour,
                    decoration: const InputDecoration(labelText: '小時'),
                    items: List.generate(24, (index) {
                      return DropdownMenuItem(
                        value: index.toString().padLeft(2, '0'),
                        child: Text(index.toString().padLeft(2, '0')),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        selectedStartHour = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedStartMinute,
                    decoration: const InputDecoration(labelText: '分鐘'),
                    items: List.generate(60 ~/ 5, (index) {
                      final minute = index * 5;
                      return DropdownMenuItem(
                        value: minute.toString().padLeft(2, '0'),
                        child: Text(minute.toString().padLeft(2, '0')),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        selectedStartMinute = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text('結束時間'),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedEndHour,
                    decoration: const InputDecoration(labelText: '小時'),
                    items: List.generate(24, (index) {
                      return DropdownMenuItem(
                        value: index.toString().padLeft(2, '0'),
                        child: Text(index.toString().padLeft(2, '0')),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        selectedEndHour = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedEndMinute,
                    decoration: const InputDecoration(labelText: '分鐘'),
                    items: List.generate(60 ~/ 5, (index) {
                      final minute = index * 5;
                      return DropdownMenuItem(
                        value: minute.toString().padLeft(2, '0'),
                        child: Text(minute.toString().padLeft(2, '0')),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        selectedEndMinute = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                _createCourse(context);
              },
              child: const Text('建立課程'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _createCourse(BuildContext context) async {
    String courseName = _nameController.text;
    setState(() {
      _errorName = courseName.isEmpty;
    });

    if (_errorName) {
      return;
    }
    String timeText =
        '$selectedStartHour:$selectedStartMinute-$selectedEndHour:$selectedEndMinute';
    String message = '建立成功';
    var snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );
    try {
      var isCreateSuccessed = await createCourse({
        'name': courseName,
        'time_period': timeText,
        'time_week': int.parse(selectedDay),
      });

      if (isCreateSuccessed) {
        SnackBar snackBar = _buildSnackBar('建立成功');
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
      } else {
        SnackBar snackBar = _buildSnackBar('建立失敗');
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (error) {
      print(error);
    }
  }

  SnackBar _buildSnackBar(String text) {
    return SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 2),
    );
  }
}
