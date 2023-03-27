class Exercise {
  String name;
  String description;

  Exercise({
    required this.name,
    required this.description,
  });

  Exercise.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'];
}
