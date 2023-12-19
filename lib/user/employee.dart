import 'package:flutter/material.dart';
import 'package:Fast_Team/utils/bottom_navigation_bar.dart';

class EmployeePage extends StatefulWidget {
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final List<Map<String, dynamic>> employees = [
    {
      'name': 'John Doe',
      'email': 'john.doe@example.com',
      'phone': '+1 123-456-7890',
      'whatsapp': '+1 123-456-7890',
      'avatar':
          'https://media.istockphoto.com/id/1296058958/vector/happy-young-woman-watching-into-rounded-frame-isolated-on-white-3d-vector-illustration.jpg?s=612x612&w=0&k=20&c=x9lmmoKVqxRro-G3S48IWIKQiykb2Yv1CkuiizDJ6gw=',
    },
    {
      'name': 'Jane Smith',
      'email': 'jane.smith@example.com',
      'phone': '+1 987-654-3210',
      'whatsapp': '+1 987-654-3210',
      'avatar':
          'https://media.istockphoto.com/id/1296058958/vector/happy-young-woman-watching-into-rounded-frame-isolated-on-white-3d-vector-illustration.jpg?s=612x612&w=0&k=20&c=x9lmmoKVqxRro-G3S48IWIKQiykb2Yv1CkuiizDJ6gw=',
    },
    // Add more employees here
  ];

  List<Map<String, dynamic>> filteredEmployees = [];

  @override
  void initState() {
    super.initState();
    filteredEmployees.addAll(employees);
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
        title: Text('Employee List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
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
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEmployees.length,
              itemBuilder: (context, index) {
                final employee = filteredEmployees[index];
                return Column(
                  children: <Widget>[
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(employee['avatar']),
                      ),
                      title: Text(
                        employee['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16, // Mengubah ukuran font
                        ),
                      ),
                      subtitle: Text(
                        employee['email'],
                        style: TextStyle(fontSize: 14), // Mengubah ukuran font
                      ),
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
                              width: 20, // Mengubah ukuran ikon WhatsApp
                              height: 20, // Mengubah ukuran ikon WhatsApp
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1, // Mengubah ketebalan garis pembatas
                      color: Colors.grey, // Mengubah warna garis pembatas
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTabTapped: (index) {
          if (index == 0) {
            Navigator.of(context).pushNamed('/home');
          } else if (index == 4) {
            Navigator.of(context).pushNamed('/profile');
          } else if (index == 2) {
            Navigator.of(context).pushNamed('/request');
          } else if (index == 3) {
            Navigator.of(context).pushNamed('/inbox');
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    home: EmployeePage(),
  ));
}
