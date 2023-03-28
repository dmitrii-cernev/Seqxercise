import 'package:flutter/material.dart';

import '../model/exercise_unit.dart';
import '../model/trainingSession.dart';

class TrainingSessionScreen extends StatelessWidget {
  const TrainingSessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: getListViewWidget(),
      ),
    );
  }
}

ListView getListViewWidget() {
  return ListView.builder(
    itemCount: getTrainingSessions().length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          title: Text(getTrainingSessions()[index].name),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            debugPrint('${getTrainingSessions()[index].name} was tapped');
          },
        ),
      );
    },
  );
}

List<TrainingSession> getTrainingSessions() {
  return [
    TrainingSession(name: 'Session #1', exercises: [
      ExerciseUnit(name: 'Squat', description: 'Squat', leadTime: 10),
      ExerciseUnit(
          name: 'Bench Press', description: 'Bench Press', leadTime: 10),
      ExerciseUnit(name: 'Deadlift', description: 'Deadlift', leadTime: 10),
    ]),
    TrainingSession(name: 'Session #2', exercises: [
      ExerciseUnit(name: 'Squat', description: 'Squat', leadTime: 10),
      ExerciseUnit(
          name: 'Dumbel Press', description: 'Dumbel Press', leadTime: 10),
      ExerciseUnit(name: 'Deadlift', description: 'Deadlift', leadTime: 10),
    ]),
  ];
}
