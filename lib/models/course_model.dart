class Course {
  final int id;
  final String timeWeek;
  final String name;
  final String timePeriod;
  final int creator;
  final List<int> student;
  final List<int> lecturers;

  Course({
    required this.id,
    required this.timeWeek,
    required this.name,
    required this.timePeriod,
    required this.creator,
    required this.student,
    required this.lecturers,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      timeWeek: json['time_week'],
      name: json['name'],
      timePeriod: json['time_period'],
      creator: json['creator'],
      student: List<int>.from(json['student']),
      lecturers: List<int>.from(json['lecturers']),
    );
  }
}
