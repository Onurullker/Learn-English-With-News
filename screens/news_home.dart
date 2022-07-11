import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/apihelper/news_api.dart';
import 'package:news_app/widgtes/news_container.dart';

class NewsHome extends StatefulWidget {
  final String?title;
  final String?category;

  const NewsHome({Key? key, this.title, this.category}) : super(key: key);

  @override
  State<NewsHome> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NewsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(widget.title!),
        ),
        body: FutureBuilder(
          future: getNews("sports"),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data;
                    return NewsContainer(
                      imageUrl: data[index].imageUrl,
                      title: data[index].title,
                      description: data[index].description,
                      author: data[index].author,
                      link: data[index].link,
                    );
                  });
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
