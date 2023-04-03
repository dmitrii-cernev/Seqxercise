import 'package:flutter/material.dart';

import '../model/exercise.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

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
    itemCount: getExercises().length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          title: Text(getExercises()[index].name),
          subtitle: Text(getExercises()[index].description),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            debugPrint('${getExercises()[index].name} was tapped');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseDetailedInfoScreen(
                  exercise: getExercises()[index],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

List<Exercise> getExercises() {
  return [
    Exercise(
      name: 'Squat',
      description: 'Squat',
    ),
    Exercise(
      name: 'Bench Press',
      description: 'Bench Press',
    ),
    Exercise(
      name: 'Deadlift',
      description: 'Deadlift',
    ),
    Exercise(
      name: 'Overhead Press',
      description: 'Overhead Press',
    ),
  ];
}

class ExerciseDetailedInfoScreen extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailedInfoScreen({Key? key, required this.exercise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //show the exercise name and description and a return button
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(exercise.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(exercise.description),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Return'),
            ),
          ],
        ),
      ),
    );
  }
}
