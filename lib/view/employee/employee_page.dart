import 'package:flutter/material.dart';
import 'package:Fast_Team/controller/employee_controller.dart';
import 'package:get/get.dart';

class EmployeePage extends StatefulWidget {
  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  EmployeeController? employeeController;
  List<Map<String, dynamic>> employees = [];
  List<Map<String, dynamic>> filteredEmployees = [];

  @override
  void initState() {
    super.initState();
    employeeController = Get.put(EmployeeController());
    fetchData();
  }

  Future<void> fetchData() async {
    var result = await employeeController!.retrieveEmployeeList();
    if (result['status'] == 200) {
      List<dynamic> data = result['details']['data'];
      
      setState(() {
        employees = List<Map<String, dynamic>>.from(data);
        filteredEmployees.addAll(employees);
      });
    }
  }

  void filterEmployees(String query) {
    setState(() {
      filteredEmployees = employees
          .where((employee) =>
              employee['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees'),
      ),
      body: Column(
        children: [
          _searchBar(),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEmployees.length,
              itemBuilder: (context, index) {
                final employee = filteredEmployees[index];
                return _employeeList(employee);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _employeeList(Map<String, dynamic> employee) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(employee['image']),
          ),
          title: Text(
            employee['nama'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          // subtitle: Text(
          //   employee['email'],
          //   style: TextStyle(fontSize: 14),
          // ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon:
                    Icon(Icons.phone, size: 24, color: Colors.blue),
                onPressed: () {
                  // Implement phone call functionality
                },
              ),
              SizedBox(width: 10),
              IconButton(
                icon:
                    Icon(Icons.email, size: 24, color: Colors.blue),
                onPressed: () {
                  // Implement email functionality
                },
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(5),
                child: Image.asset(
                  'assets/img/whatsapp.png',
                  width: 20,
                  height: 20,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        // Divider(
        //   thickness: 1,
        //   color: Colors.grey,
        // ),
      ],
    );
  }
  Padding _searchBar() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              filterEmployees('');
            },
          ),
        ),
        onChanged: (value) {
          filterEmployees(value);
        },
      ),
    );
  }

}