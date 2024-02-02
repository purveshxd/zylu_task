import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zylu_assignment/model/employee.dart';

class EmployeeDatabase {
  final db = FirebaseFirestore.instance.collection('employees');

  Future<List<Employee>> getEmployee() {
    return db.get().then(
        (value) => value.docs.map((e) => Employee.fromMap(e.data())).toList());
  }
}
