import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/featchers/home_fetcher/presentation/views/home_view.dart';

class SettingView extends StatelessWidget{
 static String id='setting_View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(
        ('Setting'),
        style:Theme.of(context).textTheme.bodyLarge,
      ),
      // centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context ,HomeView.id );
        },
        icon:const Icon(Icons.arrow_back_ios_rounded),
      ),
    ),
      body: Container(color: Colors.amber,),);
  }


}