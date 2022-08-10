import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  final List<Color> _colors = [
    Colors.orangeAccent,
    Colors.pink,
    Colors.amber,
    Colors.purple,
    Colors.brown,
    Colors.blue,
  ];
  @override
  Widget build(BuildContext context) {
    _colors.shuffle();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 5,
        ),
        Flexible(
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: _colors[3],
              ),
              shape: BoxShape.circle,
              image: const DecorationImage(
                  image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png',
                  ),
                  fit: BoxFit.fill),
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Commenter name',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Commenter body',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
