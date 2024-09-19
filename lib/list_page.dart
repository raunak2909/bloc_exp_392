import 'package:bloc_exp_392/bloc/list_bloc.dart';
import 'package:bloc_exp_392/bloc/list_event.dart';
import 'package:bloc_exp_392/bloc/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List with Bloc'),
      ),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (_, state){

          var allData = state.mData;

          return allData.isNotEmpty ?  ListView.builder(
              itemCount: allData.length,
              itemBuilder: (_, index){
                return ListTile(
                  title: Text(allData[index]["title"]),
                  subtitle: Text(allData[index]["desc"]),
                  trailing: SizedBox(
                    width: 110,
                    child: Row(
                      children: [
                        IconButton(onPressed: (){
                          context.read<ListBloc>().add(UpdateMapEvent(updatedData: {
                            "title" : "Updated Note",
                            "desc" : "This note is Updated through BLOC"
                          }, index: index));
                        }, icon: Icon(Icons.edit)),
                        IconButton(onPressed: (){
                          context.read<ListBloc>().add(DeleteMapEvent(index: index));
                        }, icon: Icon(Icons.delete_outline, color: Colors.red,)),
                      ],
                    ),
                  ),
                );
              }) : Center(
            child: Text('No Data yet!!'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<ListBloc>().add(AddMapEvent(newData: {
            "title" : "New Note",
            "desc" : "This note is through BLOC"
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
