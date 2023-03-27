import 'exercise_unit.dart';

class TrainingSession {
  String name;
  List<ExerciseUnit> exercises;

  TrainingSession({
    required this.name,
    required this.exercises,
  });

  TrainingSession.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        exercises = json['exercises'];
}
