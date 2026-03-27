import 'package:flutter/material.dart';
import 'package:td2/UI/vueDetail.dart';

import 'package:td2/api/myApi.dart';
import 'package:td2/api/myApiRest.dart';

import 'package:td2/models/task.dart';
import 'package:td2/models/taskRest.dart';



class screen3 extends StatelessWidget{

  final MyApiRest apiRest = MyApiRest();

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Test api rest tout ça tout ça"),
      ),
      body: FutureBuilder<List<TaskRest>>(
        future: apiRest.fetchTasks(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center (child : CircularProgressIndicator(),);
          }
          else if (snapshot.hasError)
          {
            return Center(child: Text(snapshot.error.toString()));

          } else {
            return ListView.builder(
                itemCount: snapshot.data?.length??0,
                itemBuilder: (context, index) {
                  return Card(
                      color: Colors.white,
                      elevation: 7,
                      margin: const EdgeInsets.all(10),
                      child:
                      ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            child: Text(snapshot.data?[index].id.toString() ??
                                ""),),
                          title: Text(snapshot.data?[index].title ?? ""),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => DetailScreen(taskRest: snapshot.data![index]),
                            ),
                          );
                        },
                      )
                  );
                }
            );
          }
          return Container();
        },
      ),
    );
  }
}