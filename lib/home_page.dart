<<<<<<< HEAD
import 'package:darklight/drawer_app.dart';
import 'package:flutter/material.dart';
=======
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_storage1/database_helper.dart';
import 'package:local_storage1/drawer_app.dart';
import 'package:local_storage1/user.dart';
>>>>>>> 1ce48d2 (shared pref)

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('hello'),
      ),
=======
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  String? _pathImage;
  List<User>? _userList;
  User? userEdit;

  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  Future<void> _saveUser() async {
    if (nameController.text.isEmpty ||
        genderController.text.isEmpty ||
        _pathImage == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please fill all fields')));
      return;
    }

    final user = User(
      name: nameController.text.trim(),
      gender: genderController.text.trim(),
      image: _pathImage!,
    );
    try {
      DatabaseHelper.instance.insert(user.toMap());
      _fetchUser();
      _clearForm();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('success')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error save : ${e.toString()}')));
    }
  }

  Future<void> _fetchUser() async {
    try {
      final user = await DatabaseHelper.instance.getAllRow();
      setState(() {
        _userList = user.map((e) => User.fromMap(e)).toList();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetch : ${e.toString()}')));
    }
  }

  Future<void> _editUser(User user) async {
    setState(() {
      nameController.text = user.name;
      genderController.text = user.gender;
      _pathImage = user.image;
      userEdit = user;
    });
  }

  void _clearForm() {
    nameController.clear();
    genderController.clear();
    setState(() {
      _pathImage = null;
      userEdit = null;
    });
  }

  Future<void> _chooseImage(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    try {
      final file = await picker.pickImage(source: source);
      if (file != null) {
        setState(() {
          _pathImage = file.path;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error image : ${e}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerApp(),
        appBar: AppBar(title: const Text('Home Page'), actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              _chooseImage(ImageSource.camera);
            },
          ),
          IconButton(
            icon: const Icon(Icons.photo),
            onPressed: () {
              _chooseImage(ImageSource.gallery);
            },
          ),
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2, color: Colors.grey)),
                    child: Center(
                      child: _pathImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                File(_pathImage!),
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Text('no Image'),
                    ),
                  )
                ],
              ),
              fieldBox(nameController, 'Enter Name'),
              fieldBox(genderController, 'Enter Gender'),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: _saveUser,
                      child: Text(userEdit == null ? 'Save' : 'Update')),
                  if (userEdit != null)
                    ElevatedButton(
                        onPressed: () {
                          _clearForm();
                        },
                        child: Text('cancel'))
                ],
              ),
              const Divider(),
              Container(
                height: 400,
                child: _userList != null
                    ? ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: _userList?.length,
                        itemBuilder: (context, index) {
                          final user = _userList![index];
                          final image = user.image;
                          return ListTile(
                            onTap: () => _editUser(user),
                            title: Text('Name : ${user.name}'),
                            subtitle: Text('Gender : ${user.gender}'),
                            trailing: Image.file(File(image)),
                          );
                        })
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              )
            ],
          ),
        ));
  }

  Widget fieldBox(TextEditingController controller, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            label: Text(text),
            border: const OutlineInputBorder(),
            //  hintText: text,
          )),
>>>>>>> 1ce48d2 (shared pref)
    );
  }
}
