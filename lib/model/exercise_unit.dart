import 'package:seqxercise/model/exercise.dart';

class ExerciseUnit extends Exercise {
  int leadTime;

  ExerciseUnit({
    required String name,
    required String description,
    required this.leadTime,
  }) : super(name: name, description: description);

  ExerciseUnit.fromJson(Map<String, dynamic> json)
      : leadTime = json['leadTime'],
        super.fromJson(json);
}
