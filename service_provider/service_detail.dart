import 'package:at_your_service/services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'dart:io';

class ServiceDetail extends StatefulWidget {
  const ServiceDetail({super.key});

  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  final ImagePicker _picker = ImagePicker();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController chargescontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  String? id;
  File? selectedImage;

  Future<void> getImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  String? value;
  final List<String> Service = ['Laundry', 'Cleaning', 'Painting', 'Repairing'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 227, 244),
      body: Container(
        margin: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Service Detail",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30.0),
                      selectedImage != null
                          ? Center(
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black45, width: 2.0),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.file(
                                  selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: getImage,
                              child: Center(
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black45, width: 2.0),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(Icons.camera_alt_outlined, size: 30.0),
                                ),
                              ),
                            ),
                      const SizedBox(height: 40.0),
                      const Text(
                        "Service Provider Name",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 22.0),
                      ),
                      const SizedBox(height: 10.0),
                      _buildInputField(namecontroller, "Enter Name"),
                      const SizedBox(height: 40.0),
                      const Text(
                        "Hourly charge",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 22.0),
                      ),
                      const SizedBox(height: 10.0),
                      _buildInputField(chargescontroller, "Enter Hourly charge"),
                      const SizedBox(height: 30.0),
                      const Text(
                        "Select Category",
                        style: TextStyle(color: Colors.blue, fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      _buildDropdown(),
                      const SizedBox(height: 40.0),
                      const Text(
                        "How you want to provide this service?",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 22.0),
                      ),
                      const SizedBox(height: 10.0),
                      _buildInputField(desccontroller, "Write a short description...", maxLines: 6),
                      const SizedBox(height: 30.0),
                      GestureDetector(
                        onTap: () async {
                          if (selectedImage != null &&
                              namecontroller.text.isNotEmpty &&
                              chargescontroller.text.isNotEmpty &&
                              desccontroller.text.isNotEmpty) {
                            String addId = randomAlphaNumeric(10);
                            Reference firebaseStorageRef =
                                FirebaseStorage.instance.ref().child("blogImage").child(addId);

                            UploadTask task = firebaseStorageRef.putFile(selectedImage!);
                            TaskSnapshot snapshot = await task;
                            String downloadUrl = await snapshot.ref.getDownloadURL();

                            Map<String, dynamic> addInfo = {
                              "Image": downloadUrl,
                              "Category": value,
                              "Hourly": chargescontroller.text,
                              "Name": namecontroller.text,
                              "Desc": desccontroller.text,
                            };

                            await DatabaseMethods().addServiceProvider(addInfo, addId).then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(
                                    "Details Uploaded successfully!!!",
                                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            });
                          }
                        },
                        child: Center(
                          child: Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 197, 227, 244),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hintText, {int maxLines = 1}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: Service.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
          onChanged: (newValue) => setState(() => value = newValue),
          dropdownColor: Colors.white,
          hint: const Text("Select Category"),
          value: value,
        ),
      ),
    );
  }
}
