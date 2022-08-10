
import 'package:flutter/material.dart';

import '../inner_screens/task_details.dart';


class TaskWidget extends StatefulWidget {
  final String taskTitle;
  final String taskDescription;
  final String taskId;
  final String uploadedBy;
  final bool isDone;

   const TaskWidget(
      {required this.taskTitle,
        required this.taskDescription,
        required this.taskId,
        required this.uploadedBy,
        required this.isDone});
  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        onTap: () {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskDetails(
                // taskId: widget.taskId,
                // uploadedBy: widget.uploadedBy,
              ),
            ),
          );
        },
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    TextButton(
                        onPressed: () {
                          // User? user = _auth.currentUser;
                          // String _uid = user!.uid;
                          // if (_uid == widget.uploadedBy) {
                          //   FirebaseFirestore.instance
                          //       .collection('tasks')
                          //       .doc(widget.taskId)
                          //       .delete();
                          //   Navigator.pop(context);
                          // } else {
                          //   GlobalMethods.showErrorDialog(
                          //       error:
                          //       'You dont have access to delete this task',
                          //       context: context);
                          // }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                             Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                             SizedBox(
                              width: 10,
                            ),
                             Text(
                              'Delete',
                              style:  TextStyle(
                                color: Colors.red,
                              ),
                            )
                          ],
                        ))
                  ],
                );
              });
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: const EdgeInsets.only(right: 12.0),
          decoration: const BoxDecoration(
            border:  Border(
              right: BorderSide(width: 1.0),
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius:
            20, // https://image.flaticon.com/icons/png/128/850/850960.png
            child: Image.network(widget.isDone
                ? 'https://cdn-icons-png.flaticon.com/512/390/390973.png'
                : 'https://cdn-icons-png.flaticon.com/512/390/390973.png'),
          ),
        ),
        title: Text(
          widget.taskTitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.linear_scale,
              color: Colors.pink.shade800,
            ),
            Text(
              widget.taskDescription,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          size: 30,
          color: Colors.pink[800],
        ),
      ),
    );
  }
}