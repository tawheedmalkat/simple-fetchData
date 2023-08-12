import 'package:fetchdata/photo.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FetData newdata = FetData();
  late Future<List<Photo>> photoList;



  @override
  void initState() {
    super.initState();
    photoList= newdata.getData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placeholder',style: TextStyle(color:Colors.red),),
        centerTitle: true,
      ),
        body: FutureBuilder(
      future: photoList,
      builder: (context, snapshot)
      {
        if (snapshot.hasData) {
          return ListView.separated(
              itemBuilder: (context, index) {
      if(index ==0)
      {
      return Column(
      children: [
      const SizedBox(height: 20,),
      C(snapshot.data![index]),
      ],
      );
      }
      else {
      return C(snapshot.data![index]);
      }
      },



              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: snapshot.data!.length);
        }
        else if (snapshot.hasError) {
          return Center(
            child: Text('has wrong'),
          );
        } else
          return const Center(child: CircularProgressIndicator(),);
      },
    ));
  }
}

C(Photo photo) {
  return Card(
    elevation: 7,
    margin:  const EdgeInsets.only(left: 16, right: 16),
    child: Container(
      height: 100,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      child: ListTile(
        title: Text(photo.title),
        leading: CircleAvatar(child:
        Image.network(photo.url,
          errorBuilder: (BuildContext context,
              Object exception, StackTrace? stackTrace) {
            return Icon(Icons.image);
          },),),
      ),),


  );
}
