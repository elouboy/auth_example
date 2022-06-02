import 'package:auth_example/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
 const HomeView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<HomeViewModel>.reactive(
     builder: (context, model, child) => const Scaffold(
       backgroundColor: Colors.white,
       body:  Center(
         child:  Text('Home View', style:  TextStyle(color: Colors.black)),
       )
     ),
     viewModelBuilder: () => HomeViewModel(),
   );
 }
}