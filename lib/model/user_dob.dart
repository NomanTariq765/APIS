class UserDob {
  final int age;
  final DateTime date;

  UserDob({required this.age, required this.date});

  factory UserDob.fromMap(Map<String, dynamic>? json) {
    if (json == null) {
      return UserDob(age: 0, date: DateTime.now());
    }

    return UserDob(
      age: json['age'] ?? 0,  // Use safe access with '?'
      date: DateTime.parse(json['date'] ?? ''),  // Use safe access with '?'
    );
  }
}
