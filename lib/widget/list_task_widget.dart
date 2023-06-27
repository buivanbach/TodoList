import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/widget/card_task.dart';

import '../Model/tasks.dart';
class ListTask extends StatefulWidget {
  const ListTask({Key? key}) : super(key: key);

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, listTaskData, _) {
        final listTask = listTaskData.items;
        print(listTask.isEmpty);

        return SizedBox(
          height: 500, // Đặt chiều cao cụ thể cho ListView
          child: !listTask.isEmpty
              ? ListView.builder(
            itemCount: listTask.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: listTask[i],
              child: CardTask(),
            ),
          )
              : Text("Nothing to do!"),
        );
      },
    );
  }
}
