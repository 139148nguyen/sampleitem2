import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/sample_item_details_view.dart';
import 'package:flutter_application_3/models/sample_item_update.dart';
import 'package:flutter_application_3/models/sample_item_widget.dart';

import 'sample_item_view_model.dart';

class SampleItemListView extends StatefulWidget {
  const SampleItemListView({super.key});

  @override
  State<SampleItemListView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView> {
  final viewModel = SampleItemViewModel();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            onPressed: (){
              showModalBottomSheet(
                context: context, 
                builder: (context)=> const SampleItemUpdate()
                ).then((value){
                  if(value != null ){
                    viewModel.addItem(value);
                  }
                });
            }, 
            icon: const Icon(Icons.add))],
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _){
          return ListView.builder(
            itemCount: viewModel.items.length,
            itemBuilder: (context,index){
               final item = viewModel.items[index];
               return SampleItemWidget(
                key: ValueKey(item.id),
                item: item,
                onTap: (){
                  Navigator.of(context).push<bool>(
                    MaterialPageRoute(builder: (context) => SampleItemDetailsView(item: item))
                  ).then((deleted) {
                   if(deleted ?? false) {
                    viewModel.removeItem(item.id);
                   }
                  });
                },);
            });
        },
      ),
    );
  }
}