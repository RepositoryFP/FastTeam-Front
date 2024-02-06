import 'package:Fast_Team/widget/refresh_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListAbsentPage extends StatefulWidget {
  const ListAbsentPage({super.key});

  @override
  State<ListAbsentPage> createState() => _ListAbsentPageState();
}

class _ListAbsentPageState extends State<ListAbsentPage> {
  List<dynamic>? routeArguments;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initData();
  }

  initData() async {
    setState(() {
      routeArguments =
          ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
    });
    // print(routeArguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees'),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: RefreshWidget(
          //     onRefresh: () => initData(),
          //     child: FutureBuilder<dynamic>(
          //       future: initData(),
          //       builder: (context, snapshot) {
          //         if (snapshot.connectionState == ConnectionState.waiting) {return Padding(
          //                     padding: EdgeInsets.symmetric(vertical: 10.w),
          //                     child: Center(
          //                       child: CircularProgressIndicator(),
          //                     ),
          //                   );}
          //                   else if (snapshot.hasError) {
          //         return Text('Error: ${snapshot.error}');
          //       } else if (snapshot.hasData) {
          //         final employee = snapshot.data!;
          //         print(employee);
          //         return Container();

          //       }
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
