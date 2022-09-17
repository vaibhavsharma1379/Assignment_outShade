import 'package:assignment/assets/user_data.dart';
import 'package:assignment/screens/list_view_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDataSceen extends StatelessWidget {
  UserDataSceen({required this.name, required this.age, required this.gender});
  final String name;
  final String age;
  final String gender;
  userData userdata = new userData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signed User Data'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            color: Colors.teal,
            padding: EdgeInsets.only(right: 15, left: 15, top: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                ListTile(
                  title: Text('Age'),
                  textColor: Colors.white,
                  trailing: Text(age),
                ),
                ListTile(
                  title: Text('Gender'),
                  textColor: Colors.white,
                  trailing: Text(gender),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MaterialButton(
                        child: Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black54,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDataList()));
                        }),
                    MaterialButton(
                      color: Colors.white,
                      hoverColor: Colors.lightBlueAccent,
                      onPressed: () {
                        Provider.of<userData>(context, listen: false)
                            .removeData(name);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserDataList()));
                      },
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black54,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
