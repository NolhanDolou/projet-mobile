import 'package:flutter/material.dart';
import 'package:td2/api/myApi.dart';
import 'package:td2/models/task.dart';


class screen2 extends StatelessWidget{

  final MyAPI myApi = MyAPI();

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("test2"),
      ),
      body: FutureBuilder<List<Task>>(
        future: myApi.getTasks(),
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
                        subtitle: Text(snapshot.data?[index].tags.join(" ") ??
                            "")
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