import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'TaskMessage.dart';

class ColumnTaskMessagesFromList extends StatefulWidget {
  final List myboxList;
  final Color color_Secondary;
  final Color color_Green;
  final double screenWidth;
  final double TaskLeftPadding;
  late final int currentIndex;
  ColumnTaskMessagesFromList({
    required this.myboxList,
    required this.color_Secondary,
    required this.color_Green,
    required this.screenWidth,
    required this.TaskLeftPadding,
    required this.currentIndex,
  });

  @override
  _ColumnTaskMessagesFromListState createState() =>
      _ColumnTaskMessagesFromListState();
}

class _ColumnTaskMessagesFromListState
    extends State<ColumnTaskMessagesFromList> {
  @override
  Widget build(BuildContext context) {
    Color _color_TaskMessage = widget.color_Secondary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        ...List.generate(
          widget.myboxList.length,
          (index) => Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onPanUpdate: (details) {
                int sensitivity = 10;
                // Swiping in right direction.
                if (details.delta.dx > sensitivity) {
                  setState(() {
                    _color_TaskMessage = widget.color_Green;
                  });
                }

                // Swiping in left direction.
                if (details.delta.dx < -sensitivity) {
                  setState(() {
                    _color_TaskMessage = widget.color_Secondary;
                  });
                }
              },
              child: TaskMessage(
                color_Green: widget.color_Green,
                color_Secondary: _color_TaskMessage,
                screen_width: widget.screenWidth,
                name: widget.myboxList[index].name,
                description: widget.myboxList[index].getAt(index).description,
                date: widget.myboxList[index].getAt(index).date,
                time: widget.myboxList[index].getAt(index).time,
                repetitiveness:
                    widget.myboxList[index].getAt(index).repetitiveness,
                notifications:
                    widget.myboxList[index].getAt(index).notifications,
                // notifications_halfOfDay: widget.mybox.getAt(index).description,
                importance: widget.myboxList[index].getAt(index).importance,
                location: widget.myboxList[index].getAt(index).location,
                // longtitude: widget.mybox.getAt(index).location['key2'],
                recording_file_path:
                    widget.myboxList[index].getAt(index).recordingFilePath,
                photo_file_path:
                    widget.myboxList[index].getAt(index).photoFilePath,
                friend_name: widget.myboxList[index].getAt(index).friendName,
                RemoveWidth: 2 * widget.TaskLeftPadding,
                // indexListDate: [
                //   "taskNotificatios_Date.elementAt(0)",
                //   "gres  erw re 1"
                // ],
                // indexListTime: [
                //   "taskNotificatios_Time.elementAt(0)",
                //   " yrew e 1"
                // ],
                onTap: (int index1) {
                  setState(() {
                    // readJson();
                    widget.currentIndex = index1;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(ColumnTaskMessagesFromList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.myboxList.length != oldWidget.myboxList.length) {
      setState(() {});
    }
  }

  // void getInfo(int taskNumber) {
  //   Box box = widget.mybox.getAt(taskNumber);

  // }
}
