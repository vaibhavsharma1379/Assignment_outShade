import 'package:assignment/screens/user_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../assets/user_data.dart';

class showInputDialogBox extends StatelessWidget {
  showInputDialogBox({required this.index});
  final int index;
  userData AddUser = new userData();
  late String age;
  late String gender;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(Icons.details),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      title: Text("Input User Details"),
      contentPadding: EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              age = value;
            },
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                labelText: 'Enter Your Age'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            onChanged: (value) {
              gender = value;
            },
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                labelText: 'Enter Your Gender'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Provider.of<userData>(context, listen: false).addData(
                '${user['users'].elementAt(index)['name']}', age, gender);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDataSceen(
                  name: '${user['users'].elementAt(index)['name']}',
                  age: age,
                  gender: gender,
                ),
              ),
            );
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
