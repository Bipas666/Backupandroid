import 'dart:io';
import 'package:blogapp/Model/profileModel.dart';
import 'package:blogapp/NetworkHandler.dart';
import 'package:blogapp/Pages/HomePage.dart';
import 'package:blogapp/Profile/MainProfile.dart';
import 'package:blogapp/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class updateProfile extends StatefulWidget {
  updateProfile({Key key}) : super(key: key);

  @override
  _updateProfileState createState() => _updateProfileState();
}

class _updateProfileState extends State<updateProfile> {
  final networkHandler = NetworkHandler();
  bool circular = false;
  PickedFile _imageFile;
  ProfileModel profileModel = ProfileModel();
  final _globalkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  
  void fetchData() async {
    var response = await networkHandler.get("/profile/getData1");
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      
    });
  }


  TextEditingController _name = TextEditingController();
  
  TextEditingController _profession = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _about = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: <Widget>[
            imageProfile(),
            SizedBox(
              height: 20,
            ),
            nameTextField(),
            SizedBox(
              height: 20,
            ),
            professionTextField(),
            SizedBox(
              height: 20,
            ),
            dobField(),
            SizedBox(
              height: 20,
            ),
            titleTextField(),
            SizedBox(
              height: 20,
            ),
            aboutTextField(),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  circular = true;
                });
                if (_globalkey.currentState.validate()) {
                  Map<String, String> data = {
                    "name": _name.text,
                    "profession": _profession.text,
                    "DOB": _dob.text,
                    "titleline": _title.text,
                    "about": _about.text,
                  };
                  var response =
                      await networkHandler.patch("/profile/update", data);
                  if (response.statusCode == 200 ||
                      response.statusCode == 201) {
                      Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false);
                  }
                }
              },
              child: Center(
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color:  Color.fromARGB(255, 20, 174, 245),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: circular
                        ? CircularProgressIndicator()
                        : Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? NetworkHandler().getImage(profileModel.username)
              : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color:  Color.fromARGB(255, 20, 174, 245),
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget nameTextField() {
    return TextFormField(
      controller: _name..text=profileModel.name,
      validator: (value) {
        if (value.isEmpty) return "Name can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
         color:  Color.fromARGB(255, 20, 174, 245),
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
         color:  Color.fromARGB(255, 20, 174, 245),
        ),
        labelText: "Full Name",
        helperText: "Name can't be empty",
        hintText: "Fullname",
      ),
    );
  }

  Widget professionTextField() {
    return TextFormField(
      // controller: TextEditingController()..text = profileModel.profession,
      controller: _profession..text=profileModel.profession,
      validator: (value) {
        if (value.isEmpty) return "Occupation can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color:  Color.fromARGB(255, 20, 174, 245),
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.work,
          color:  Color.fromARGB(255, 20, 174, 245),
        ),
        labelText: "Occupation",
        helperText: "Occupation can't be empty",
        hintText: "Occupation",
      ),
    );
  }

  Widget dobField() {
    return TextFormField(
      // controller: TextEditingController()..text = profileModel.DOB,'
      controller: _dob..text=profileModel.DOB,
      validator: (value) {
        if (value.isEmpty) return "Date of birth can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color:  Color.fromARGB(255, 20, 174, 245),
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.date_range,
          color:  Color.fromARGB(255, 20, 174, 245),
        ),
        labelText: "Date Of Birth",
        helperText: "Provide DOB on dd/mm/yyyy",
        hintText: "01/01/2020",
      ),
    );
  }

  Widget titleTextField() {
    return TextFormField(
      controller: _title..text=profileModel.titleline,
      validator: (value) {
        if (value.isEmpty) return "Address can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color:  Color.fromARGB(255, 20, 174, 245),
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.place,
          color:  Color.fromARGB(255, 20, 174, 245),
        ),
        labelText: "Address",
        helperText: "Address can't be empty",
        hintText: "Address",
      ),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
      // controller: TextEditingController()..text=profileModel.about,
      controller: _about..text=profileModel.about,
      validator: (value) {
        if (value.isEmpty) return "About can't be empty";

        return null;
      },
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color:  Color.fromARGB(255, 20, 174, 245),
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        labelText: "About",
        helperText: "Write about the best hotel you ever stay.",
        hintText: "Write about the best hotel you ever stay.",
      ),
    );
  }
}
