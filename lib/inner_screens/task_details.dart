import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../widgets/comments_widget.dart';


class TaskDetails extends StatefulWidget {
  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  bool _isCommenting = false;
  var contentsInfo = TextStyle(
      fontWeight: FontWeight.normal, fontSize: 15, color: Constants.darkBlue);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: TextButton(
          onPressed: () {Navigator.pop(context);},
          child: Text(
            'Back',
            style: TextStyle(
                color: Constants.darkBlue,
                fontStyle: FontStyle.italic,
                fontSize: 20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Task Title',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Constants.darkBlue),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'uploaded by',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Constants.darkBlue),
                          ),
                          const Spacer(),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: Colors.pink.shade800,
                              ),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  image:  NetworkImage(
                                    'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png',
                                  ),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'uploaded name',
                                style: contentsInfo,
                              ),
                              Text(
                                'uploaded job',
                                style: contentsInfo,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Uploaded on:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Constants.darkBlue),
                          ),
                          Text(
                            'date:20-2-2021',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Constants.darkBlue),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Deadline date:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Constants.darkBlue),
                          ),
                          const Text(
                            'date:20-3-2021',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child:  Text(
                          'date:20-3-2021',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.green),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Done state:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Constants.darkBlue),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text('Done',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Constants.darkBlue)),
                          ),
                          const Opacity(
                            opacity: 1,
                            child:  Icon(
                              Icons.check_box,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Flexible(
                            child: Text('Not done',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Constants.darkBlue,
                                )),
                          ),
                          const Opacity(
                            opacity: 0,
                            child: Icon(
                              Icons.check_box,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Task description:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Constants.darkBlue),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Task description',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Constants.darkBlue,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: _isCommenting
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: TextField(
                                      maxLength: 200,
                                      // controller: ,
                                      style: TextStyle(
                                        color: Constants.darkBlue,
                                      ),
                                      keyboardType: TextInputType.text,
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide:
                                               BorderSide(color: Colors.white),
                                        ),
                                        errorBorder: const UnderlineInputBorder(
                                          borderSide:
                                               BorderSide(color: Colors.red),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              const BorderSide(color: Colors.pink),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            MaterialButton(
                                              onPressed: () {},
                                              color: Colors.pink.shade700,
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  side: BorderSide.none),
                                              child: const Padding(
                                                padding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 14),
                                                child:  Text(
                                                  'Post',
                                                  style:  TextStyle(
                                                      color: Colors.white,
                                                      // fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _isCommenting =
                                                        !_isCommenting;
                                                  });
                                                },
                                                child: const Text('Cancel')),
                                          ],
                                        ),
                                      ))
                                ],
                              )
                            : Center(
                                child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      _isCommenting = !_isCommenting;
                                    });
                                  },
                                  color: Colors.pink.shade700,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                      side: BorderSide.none),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 14),
                                    child: Text(
                                      'Add a comment',
                                      style: TextStyle(
                                          color: Colors.white,
                                          // fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(height: 30,),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            return CommentWidget();
                          },
                          separatorBuilder: (ctx, index) {
                            return const Divider(
                              thickness: 1,
                            );
                          },
                          itemCount: 20),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
