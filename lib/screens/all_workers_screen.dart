import 'package:flutter/material.dart';
import '../widgets/all_workers_widgets.dart';
import '../widgets/drawer_widget.dart';

class AllWorkersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          'All worker',
          style:  TextStyle(color: Colors.pink),
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return AllWorkersWidget();
          }),
    );
  }
}
