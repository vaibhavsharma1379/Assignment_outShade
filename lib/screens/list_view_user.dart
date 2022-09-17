import 'package:assignment/assets/user_data.dart';
import 'package:assignment/screens/input_data_screen.dart';
import 'package:assignment/screens/user_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDataList extends StatelessWidget {
  @override
  userData userdata = new userData();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text(
          "Users",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: user["users"].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  leading: Text(
                    '${user['users'].elementAt(index)['id']}',
                    style: TextStyle(fontSize: 20),
                  ),
                  title: MaterialButton(
                    onPressed: () async {
                      print(userdata.userDetails);
                      return Provider.of<userData>(context, listen: false)
                              .userDetails
                              .containsKey(
                                  '${user['users'].elementAt(index)['name']}')
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserDataSceen(
                                  name:
                                      '${user['users'].elementAt(index)['name']}',
                                  age:
                                      '${Provider.of<userData>(context, listen: false).userDetails['${user['users'].elementAt(index)['name']}'][0]}',
                                  gender:
                                      '${Provider.of<userData>(context, listen: false).userDetails['${user['users'].elementAt(index)['name']}'][1]}',
                                ),
                              ),
                            )
                          : showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  showInputDialogBox(
                                    index: index,
                                  ));
                    },
                    hoverColor: Colors.green,
                    child: Text(
                      "${user['users'].elementAt(index)['name']}",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
                  tileColor: Colors.cyan,
                  trailing: Text('${user['users'].elementAt(index)['atype']}')

                  // contentPadding: EdgeInsets.only(top: 15, bottom: 15),
                  ),
            );
          }),
    );
  }
}
