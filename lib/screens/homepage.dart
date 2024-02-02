import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:time_machine/time_machine.dart';
import 'package:zylu_assignment/database/employee_database.dart';
import 'package:zylu_assignment/model/employee.dart';
import '../firebase_options.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Color activeEmployee(Employee employee) {
      // get todays date
      final today = LocalDateTime.now();
      // employee join date
      final date = DateTime.parse(employee.dateJoined);
      final joinedDate = LocalDateTime.dateTime(date);

      // difference in dates
      final difference = today.periodSince(joinedDate);
      // if active and difference is greater that 5 => Green Tile
      if (employee.isActive && difference.years > 5) {
        return Colors.green;
      } else {
        return Theme.of(context).colorScheme.secondaryContainer;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee List"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: EmployeeDatabase().getEmployee(),
          builder: (context, snapshot) {
            final employeeList = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: employeeList!.length,
                  itemBuilder: (context, index) {
                    final employee = employeeList.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        tileColor: activeEmployee(employee),
                        leading: CircleAvatar(child: Text(employee.name[0])),
                        title: Text(
                          employee.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(employee.dateJoined),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
