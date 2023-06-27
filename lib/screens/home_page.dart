import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/widget/new_task.dart';

import '../Model/task.dart';
import '../Model/tasks.dart';
import '../widget/list_task_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        
        resizeToAvoidBottomInset: true,
        backgroundColor: Color.fromARGB(240, 255, 255, 255),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              ListTile(
                  title: Text(
                    "Today's Task",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMEd().format(DateTime.now()).toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 15
                    ),
                  ),
                  trailing: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => NewTaskDialog(),
                      );
                    },

                    child: Text(" New Task",  style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 15
                    ),),
                  )
              ),
              // ListTask()
              SizedBox(
                height: 10,
              ),
              Container(

                child: ListTask(),
              )
            ],
          ),
        ),
        );
  }
}
