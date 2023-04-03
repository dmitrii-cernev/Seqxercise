import 'exercise_unit.dart';

class TrainingSession {
  String name;
  List<ExerciseUnit> exercises;
  int restTime;

  TrainingSession({
    required this.name,
    required this.exercises,
    required this.restTime,
  });

  TrainingSession.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        exercises = json['exercises'],
        restTime = json['restTime'];

  get totalTime => exercises.fold(
      0, (previousValue, element) => previousValue + element.leadTime) +
      restTime * exercises.length;
}
