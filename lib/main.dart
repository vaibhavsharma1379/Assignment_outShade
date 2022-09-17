import 'package:assignment/screens/list_view_user.dart';
import 'package:flutter/material.dart';
import 'assets/user_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return userData();
      },
      child: MaterialApp(
        home: UserDataList(),
      ),
    );
  }
}
