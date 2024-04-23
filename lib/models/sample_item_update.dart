import 'package:flutter/material.dart';

class SampleItemUpdate extends StatefulWidget {

  final String? initialName;

  const SampleItemUpdate({super.key, this.initialName});

  @override
  State<SampleItemUpdate> createState() => _SampleItemUpdateState();
}

class _SampleItemUpdateState extends State<SampleItemUpdate> {
  late TextEditingController textEditingController;
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController(text: widget.initialName);
  }

  


  @override
  void dispose() {
    textEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.initialName != null ? 'Chinh sua' : 'Them moi'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).pop(textEditingController.text);
            }, 
            icon: const Icon(Icons.save))
        ],
      ),
      body: TextFormField(
        controller: textEditingController,
      ),
    );
  }
}