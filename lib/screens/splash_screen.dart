import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/screens/home_page.dart';

import '../Model/tasks.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Thực hiện công việc tải dữ liệu ở đây (ví dụ: load dữ liệu từ local, API, ...)
    loadData().then((_) {
      // Sau khi tải dữ liệu xong, chuyển đến màn hình chính
      navigateToMainScreen();
    });
  }

  Future<void> loadData() async {
    await Provider.of<Tasks>(context, listen: false).loadTasksFromLocal();
    print("load");
  }

  void navigateToMainScreen() {
    // Chuyển đến màn hình chính
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Hiển thị một biểu tượng loading
      ),
    );
  }
}