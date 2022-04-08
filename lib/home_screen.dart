import 'package:assignment_5/helper/helper_image.dart';
import 'package:assignment_5/helper/helpers.dart';
import 'package:assignment_5/model/model_image.dart';
import 'package:assignment_5/model/models.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoaded = false;
  List<Welcome>? postss;

//creating a function which will call helper class
  getData() async {
    postss = await PostHelper().getPost();
    setState(() {
      isLoaded = true;
    });
  }

  List<KImage>? imagees;

  getkImage() async {
    imagees = await ImageHelper().getImage();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    getkImage();
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Data"),
              Container(
                height: 500,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: postss!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(postss![index].title.toString()),
                          subtitle: Text(postss![index].body.toString()),
                          leading: Text(postss![index].id.toString()),
                        ),
                      );
                    }),
              ),
              Text("Images"),
              Container(
                height: 500,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: imagees!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Image.network(
                            imagees![index].thumbnailUrl.toString()),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Text(postss![index].title.toString())),