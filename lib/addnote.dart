import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';

// ignore: camel_case_types, must_be_immutable
class addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  addnote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {},
          ),
        ],
        title: const Text('Add Note'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                  // expands: true,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Content',
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                // MaterialButton(
                //   shape: const RoundedRectangleBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(20.0))),
                //   elevation: 5.0,
                //   onPressed: () {
                //     ref.add({
                //       'title': title.text,
                //       'content': content.text,
                //     }).whenComplete(() {
                //       Navigator.pushReplacement(context,
                //           MaterialPageRoute(builder: (_) => const Home()));
                //     });
                //   },
                //   child: const Text(
                //     "Save",
                //     style: TextStyle(
                //       color: Color.fromARGB(255, 64, 83, 255),
                //       fontSize: 30,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                MaterialButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 5.0,
                  // height: 50,
                  height: MediaQuery.of(context).size.height * 0.08,
                  minWidth: double.infinity,
                  onPressed: () {
                    ref.add({
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
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
