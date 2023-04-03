import 'package:flutter/material.dart';

import '../model/exercise_unit.dart';
import '../model/training_session.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TrainingSessionDetailedInfoScreen(
                  trainingSession: getTrainingSessions()[index],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

class TrainingSessionDetailedInfoScreen extends StatelessWidget {
  final TrainingSession trainingSession;

  const TrainingSessionDetailedInfoScreen(
      {Key? key, required this.trainingSession})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // show detailed info about training session + a return button
    return Scaffold(
      appBar: AppBar(
        title: Text(trainingSession.name),
      ),
      body: Center(
        child: Column(
          children: [
            Text(trainingSession.name, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ListView(
                shrinkWrap: true,
                children: trainingSession.exercises.map((exercise) {
                  return ListTile(
                    title: Text(exercise.name),
                    subtitle: Text(exercise.description),
                    trailing: Text('${exercise.leadTime} sec'),
                  );
                }).toList()),
            Text(
              "Total time: ${trainingSession.totalTime} sec",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Return'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('Start'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
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
      ExerciseUnit(name: "Pull ups", description: "Podtegivanya", leadTime: 15),
    ]),
  ];
}
