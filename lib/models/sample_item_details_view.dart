import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/sample_item_update.dart';
import 'package:flutter_application_3/models/sample_item_view_model.dart';
import 'package:flutter_application_3/sample_item.dart';

class SampleItemDetailsView extends StatefulWidget {
  final SampleItem item;

  const SampleItemDetailsView({super.key, required this.item});

  @override
  State<SampleItemDetailsView> createState() => _SampleItemDetailsViewState();
}

class _SampleItemDetailsViewState extends State<SampleItemDetailsView> {
  final viewModel = SampleItemViewModel();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        actions: [
          IconButton(
           onPressed: (){
            showModalBottomSheet<String?>(
              context: context, 
              builder: (context) => SampleItemUpdate(initialName: widget.item.name.value,)).then((value) {
                if(value != null){
                  viewModel.updateItem(widget.item.id, value);
                }
              });
           }, 
           icon: const Icon(Icons.edit)),
          IconButton(
           onPressed: (){
            showDialog(
              context: context, 
              builder: (context) {
                return AlertDialog(
                  title: const Text('Xac nhan xoa'),
                  content: const Text("ban co chac muon xoa muc nay"),
                  actions: [
                    TextButton(
                      onPressed: ()=> Navigator.of(context).pop(false), 
                      child: const  Text('Bo qua')),
                    TextButton(
                      onPressed: ()=> Navigator.of(context).pop(true), 
                      child: const  Text('Xoa')),
                  ],
                );
              }).then((confirmed) {
                if (confirmed) {
                  Navigator.of(context).pop(true);
                }
              });
           }, 
           icon: const Icon(Icons.delete)),
        ],
      ),
      body: ValueListenableBuilder<String>(
        valueListenable: widget.item.name,
        builder: (_, name, __){
          return Center(child: Text(name),);
        },
      ) ,
    );
  }
}