import 'dart:math';

import 'package:flutter/material.dart';

class VoteChart extends StatefulWidget {
  const VoteChart(
      {Key? key,
      required this.options,
      required this.voteCount,
      required this.width, required this.onTapOption, required this.messageId,
        })
      : super(key: key);

  final List<String> options;
  final List<int> voteCount;
  final double width;
  final DidSelectAnOption onTapOption;
  final String messageId;

  @override
  State<VoteChart> createState() => _VoteChartState();
}

typedef void DidSelectAnOption(String messageId, int index);

class _VoteChartState extends State<VoteChart> {
  int findMaxIndex(List<num> list) {
    var max = list[0];
    var maxIndex = 0;
    for (var i = 0; i < list.length; i++) {
      if (list[i] > max) {
        max = list[i];
        maxIndex = i;
      }
    }
    return maxIndex;
  }

  @override
  Widget build(BuildContext context) {
    final totalCount = widget.voteCount.reduce((a, b) => a + b).toDouble();
    final maxIndex = findMaxIndex(widget.voteCount);


    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 10),
      itemBuilder: (context, i) {
        final ratio =
            widget.voteCount[i] == 0 ? 0 : widget.voteCount[i].toDouble() / totalCount;
        return Container(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  widget.onTapOption(widget.messageId, i);
                },
                child: Stack(
                  children: [
                    Container(
                      width: max(0.7 * widget.width * ratio, 5),
                      height: 22,
                      padding:
                          const EdgeInsets.only(left: 5, top: 2, bottom: 2),
                      decoration: BoxDecoration(
                        color: i == maxIndex && totalCount != 0
                            ? Colors.pinkAccent
                            : Colors.black.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        widget.options[i],
                        style: TextStyle(
                          color: i == maxIndex && totalCount != 0
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('${(ratio * 100).toStringAsFixed(0).toString()}%'),
              ),
            ],
          ),
        );
      },
      itemCount: widget.options.length,
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
