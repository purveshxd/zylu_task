import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Employee {
  final String name;
  final bool isActive;
  final String dateJoined;
  Employee({
    required this.name,
    required this.isActive,
    required this.dateJoined,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'isActive': isActive,
      'dateJoined': dateJoined,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      name: map['name'] as String,
      isActive: map['isActive'] as bool,
      dateJoined: map['dateJoined'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source) as Map<String, dynamic>);
}
