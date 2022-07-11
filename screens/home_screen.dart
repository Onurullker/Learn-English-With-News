import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/data/home_data.dart';
import 'package:news_app/widgtes/home_container.dart';

class HomeScreen extends StatelessWidget {
  final String title = ("Learn English With News");
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
         ),
        ),
        
        body: ListView.builder(
          itemCount: mydata.length,
          itemBuilder: (context, index) {
            return HomeContainer(
              imageUrl: mydata[index]["image"],
              title: mydata[index]["title"],
            );
          },
        ));
  }
}
