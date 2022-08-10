import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../inner_screens/add_task.dart';
import '../inner_screens/profile.dart';
import '../screens/all_workers_screen.dart';
import '../screens/task.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
            decoration: const BoxDecoration(color: Colors.cyan),
            child: Column(
              children: [
                Flexible(
                    child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/1256/1256650.png')),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                    child: Text(
                  'Work OS ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.darkBlue,
                      fontSize: 22,
                      fontStyle: FontStyle.italic),
                ))
              ],
            )),
        const SizedBox(
          height: 30,
        ),
        _listTiles(
            label: 'All tasks',
            fct: () {
              _navigateToTaskScreen(context);
            },
            icon: Icons.task_outlined),
        _listTiles(
            label: 'My account', fct: () {

          _navigateToProfileScreen(context);
        }, icon: Icons.settings_outlined),
        _listTiles(
            label: 'Registered works',
            fct: () {
              _navigateToAllWorkerScreen(context);
            },
            icon: Icons.workspaces_outline),
        _listTiles(
            label: 'Add task',
            fct: () {
              _navigateToAddTaskScreen(context);
            },
            icon: Icons.add_task_outlined),
        const Divider(
          thickness: 1,
        ),
        _listTiles(
            label: 'Logout',
            fct: () {
              _logout(context);
            },
            icon: Icons.logout_outlined),
      ],
    ));
  }

  void _navigateToAllWorkerScreen(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AllWorkersScreen(),
      ),
    );
  }

  void _navigateToAddTaskScreen(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskScreen(),
      ),
    );
  }

  void _navigateToTaskScreen(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TasksScreen(),
      ),
    );
  }


  void _navigateToProfileScreen(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      ),
    );
  }

  void _logout(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://cdn-icons.flaticon.com/png/512/4436/premium/4436954.png?token=exp=1659891852~hmac=291182ad9901abb83dfbc188350dba92',
                    height: 20,
                    width: 20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Sign out'),
                ),
              ],
            ),
            content: Text(
              'Do you wanna Sign out',
              style: TextStyle(
                  color: Constants.darkBlue,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          );
        });
  }

  Widget _listTiles(
      {required String label, required Function fct, required IconData icon}) {
    return ListTile(
      onTap: () {
        fct();
      },
      leading: Icon(
        icon,
        color: Constants.darkBlue,
      ),
      title: Text(
        label,
        style: TextStyle(
            color: Constants.darkBlue,
            fontSize: 20,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}
