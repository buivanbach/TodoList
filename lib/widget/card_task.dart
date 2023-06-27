import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/task.dart';
import '../Model/tasks.dart';

class CardTask extends StatelessWidget {
  const CardTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<Task>(context);
    return Consumer<Task>(
      builder: (context, checkboxState, _) {
        final task = Provider.of<Task>(context);

        return Dismissible(

            key: Key(task.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            onDismissed: (direction) {
              Provider.of<Tasks>(context, listen: false).deleteTask(task.id);
            },
            child: Card(

              child: Column(
                children: <Widget>[
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20,top: 15,bottom: 15),
                          child: Text(
                            task.title,
                            overflow: TextOverflow.visible,
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                      Checkbox(
                        shape: CircleBorder(),
                        value: checkboxState.isDone,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        onChanged: (value) {
                          checkboxState.toggleDoneStatus();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
