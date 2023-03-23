import 'package:bookmyshow/buzzpage/provider/buzz_provider.dart';
import 'package:bookmyshow/buzzpage/services/storage_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/addbuzz_service.dart';

class AddBuzzPage extends StatefulWidget {
  final Animation<double>? transitionAnimation;
  const AddBuzzPage({this.transitionAnimation, super.key});

  @override
  State<AddBuzzPage> createState() => _AddBuzzPageState();
}

class _AddBuzzPageState extends State<AddBuzzPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final buzzprovider = Provider.of<BuzzProvider>(context);
    final Storage storage = Storage();
    Future<String> uploadFunction(String folderName) async {
      final results = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg'],
      );
      if (results == null) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No file Selected"),
            duration: Duration(seconds: 2),
          ),
        );
        return "";
      }
      final path = results.files.single.path;
      final fileName = results.files.single.name;
      print(fileName);
      await storage
          .uploadFiles(path as String, fileName, folderName)
          .then((value) => print("File Upload Done"));
      await storage.listFiles();
      String temp = await storage.downloadURL(folderName, fileName);
      print(temp);
      return temp;
    }

    return AnimatedBuilder(
      animation: widget.transitionAnimation!,
      builder: (context, child) {
        return SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
                  .animate(
            CurvedAnimation(
                parent: widget.transitionAnimation!, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Buzz Page"),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: const Text(
                    "Buzz title",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 17),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      hintText: 'Enter Buzz Title',
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 12),
                  child: const Text(
                    "Buzz Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  child: TextField(
                    maxLines: 10,
                    controller: descriptionController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintText: 'Enter Buzz Description',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0, top: 12),
                  child: Text(
                    "Your Name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 17),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),

                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 12),
                      child: Text(
                        "Upload Main image: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        buzzprovider.mainImgUrl =
                            await uploadFunction('mainImage');
                        return;
                      },
                      icon: const Icon(Icons.upload),
                    )
                    //child: const Text("Upload File")),
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 12),
                      child: Text(
                        "Upload Cover image: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        buzzprovider.coverImgUrl =
                            await uploadFunction('coverImage');
                        return;
                      },
                      icon: const Icon(Icons.upload),
                    )
                    //child: const Text("Upload File")),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async {
              await AddBuzzService().createUser(
                  authorname: nameController.text,
                  title: titleController.text,
                  description: descriptionController.text,
                  datetime: DateTime.now(),
                  mainImgUrl: buzzprovider.mainImgUrl,
                  coverImgUrl: buzzprovider.coverImgUrl);
              nameController.clear();
              titleController.clear();
              descriptionController.clear();
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            },
            child: const Text("Submit"),
          ),
        )),
      ),
    );
  }
}
