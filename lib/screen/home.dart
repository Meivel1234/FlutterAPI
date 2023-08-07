import 'package:flutter/material.dart';
// import 'package:flutter_2/screen/EnoticePage.dart';
import 'package:flutter_2/screen/UsersPage.dart';
import 'package:flutter_2/services/user_api.dart';
import 'package:flutter_2/screen/HomeworkPage.dart';

import '../model/RandomUserDataModel.dart';
import 'EnoticePage.dart';

// import '../model/RandomUserDataModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Result> users = [];
  void getuser() async {
    UserApi.fetchUser();
  }

  @override
  initState() {
    super.initState();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UserPage()));
              },
              child: Text("Users")),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnoticePage()));
              },
              child: Text("E-Notice")),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeworkPage()));
              },
              child: Text("Homework")),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UserPage()));
              },
              child: Text("next")),
          // ListView.builder(
          //   itemCount: users.length,
          //   itemBuilder: (context, index) {
          //     final user = users[index];

          //     return ListTile(
          //       leading: Image.network("${user.picture.large}"),
          //       title:
          //           Text("${user.name.title} ${user.name.first} ${user.name.last}"),
          //       subtitle: Text(user.location.country!),
          //       onTap: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => const UserPage()));
          //       },
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
