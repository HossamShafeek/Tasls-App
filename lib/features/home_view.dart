import 'package:flutter/material.dart';
import 'package:tasks_app/config/local/cache_helper.dart';
import 'package:tasks_app/features/Auth/presentation/views/login_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: TextButton(onPressed: (){
          CacheHelper.removeData(key: 'token').then((value){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return LoginView();
            },));
          });
        }, child: Text('Logout')),
      ),
    );
  }
}
