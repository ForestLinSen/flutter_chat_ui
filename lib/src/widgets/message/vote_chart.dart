import 'dart:math';

import 'package:flutter/material.dart';

class VoteChart extends StatelessWidget {
  const VoteChart(
      {Key? key,
      required this.options,
      required this.voteCount,
      required this.width})
      : super(key: key);

  final List<String> options;
  final List<num> voteCount;
  final double width;

  @override
  Widget build(BuildContext context) {
    final totalCount = voteCount.reduce((a, b) => a + b).toDouble();
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, i) {
        final ratio = voteCount[i] == 0 ? 0 : voteCount[i].toDouble() / totalCount;
        return Container(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: max(0.6 * width * ratio, 70),
                padding: EdgeInsets.only(left: 5, top: 2, bottom: 2),
                child: Text(
                  options[i],
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(5)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:
                    Text('${(ratio * 100).toStringAsFixed(0).toString()}%'),
              ),
            ],
          ),
        );
      },
      itemCount: options.length,
    );
  }
}

// Row(
// children: [
// Expanded(
// flex: 7,
// child: Container(
// alignment: Alignment.centerLeft,
// child: Padding(
// padding:
// const EdgeInsets.symmetric(horizontal: 8.0),
// child: Text(
// "Coach 🚍",
// style: const TextStyle(color: Colors.white),
// ),
// ),
// height: 25,
// width: 100,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(5),
// color: Colors.pinkAccent,
// ),
// ),
// ),
// Expanded(
// flex: 3,
// child: Text("57%"),
// ),
// ],
// )
