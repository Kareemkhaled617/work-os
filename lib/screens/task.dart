import 'package:flutter/material.dart';
import '../constant/constant.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/task_widget.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String? taksCategory;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          'Tasks',
          style:  TextStyle(color: Colors.pink),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showTaskCategoryDialog(context, size);
            },
            icon: const Icon(
              Icons.filter_list_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          // itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return const TaskWidget(
              taskTitle: "snapshot.data!.docs[index]['taskTitle']",
              taskDescription: "snapshot.data!.docs[index]['taskDescription']",
              taskId:"snapshot.data!.docs[index]['taskId']",
              uploadedBy: "snapshot.data!.docs[index]['uploadedBy']",
              isDone:true,
              // snapshot.data!.docs[index]['isDone'],
            );
          }),
      // StreamBuilder<QuerySnapshot>(
      //   stream: FirebaseFirestore.instance
      //       .collection('tasks')
      //       .where('taskCategory', isEqualTo: taksCategory)
      //       .orderBy('createdAt', descending: true)
      //       .snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (snapshot.connectionState == ConnectionState.active) {
      //       if (snapshot.data!.docs.isNotEmpty) {
      //         return ListView.builder(
      //             itemCount: snapshot.data!.docs.length,
      //             itemBuilder: (BuildContext context, int index) {
      //               return TaskWidget(
      //                 taskTitle: snapshot.data!.docs[index]['taskTitle'],
      //                 taskDescription: snapshot.data!.docs[index]
      //                 ['taskDescription'],
      //                 taskId: snapshot.data!.docs[index]['taskId'],
      //                 uploadedBy: snapshot.data!.docs[index]['uploadedBy'],
      //                 isDone: snapshot.data!.docs[index]['isDone'],
      //               );
      //             });
      //       } else {
      //         return const Center(
      //           child: Text('No tasks has been uploaded'),
      //         );
      //       }
      //     }
      //     return const Center(
      //       child: Text('Something went wrong'),
      //     );
      //   },
      // ),
    );
  }

  void showTaskCategoryDialog(context, size) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Task category',
              style: TextStyle(color: Colors.pink.shade300, fontSize: 20),
            ),
            content: SizedBox(
              width: size.width * 0.9,
              child: ListView.builder(
                  shrinkWrap: true,
                   itemCount: Constants.taskCategoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                         print(
                            'taskCategoryList[index] ${Constants.taskCategoryList[index]}');
                        setState(() {
                          taksCategory = Constants.taskCategoryList[index];
                        });
                        Navigator.canPop(context)
                            ? Navigator.pop(context)
                            : null;
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.red[200],
                          ),
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                               Constants.taskCategoryList[index],
                              style: const TextStyle(
                                  color: Color(0xFF00325A),
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: const Text('Close'),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      taksCategory = null;
                    });
                    Navigator.canPop(context) ? Navigator.pop(context) : null;
                  },
                  child: const Text('Cancel filter'))
            ],
          );
        });
  }
}