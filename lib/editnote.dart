import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';

// ignore: camel_case_types, must_be_immutable
class editnote extends StatefulWidget {
  DocumentSnapshot docid;
  editnote({Key? key, required this.docid}) : super(key: key);

  @override
  _editnoteState createState() => _editnoteState();
}

// ignore: camel_case_types
class _editnoteState extends State<editnote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState() {
    title = TextEditingController(text: widget.docid.get('title'));
    content = TextEditingController(text: widget.docid.get('content'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        ],
        title: const Text('Edit or Delete Note'),
        // actions: [
        //   MaterialButton(
        //     onPressed: () {
        //       widget.docid.reference.update({
        //         'title': title.text,
        //         'content': content.text,
        //       }).whenComplete(() {
        //         Navigator.pushReplacement(
        //             context, MaterialPageRoute(builder: (_) => const Home()));
        //       });
        //     },
        //     child: const Text("Save"),
        //   ),
        //   MaterialButton(
        //     onPressed: () {
        //       widget.docid.reference.delete().whenComplete(() {
        //         Navigator.pushReplacement(
        //             context, MaterialPageRoute(builder: (_) => const Home()));
        //       });
        //     },
        //     child: const Text("Delete"),
        //   ),
        // ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Column(
              children: [
                TextField(
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: title,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: content,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Content',
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 5.0,
                  color: Colors.blue,
                  // height: 50,
                  height: MediaQuery.of(context).size.height * 0.08,
                  minWidth: double.infinity,
                  onPressed: () {
                    widget.docid.reference.update({
                      'title': title.text,
                      'content': content.text,
                    }).whenComplete(() {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const Home()));
                    });
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 5.0,
                  color: Colors.red,
                  // height: 50,
                  height: MediaQuery.of(context).size.height * 0.08,
                  minWidth: double.infinity,
                  onPressed: () {
                    widget.docid.reference.delete().whenComplete(() {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const Home()));
                    });
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
