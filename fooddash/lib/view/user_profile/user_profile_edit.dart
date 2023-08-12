import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  // Add more controllers for other profile fields as needed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
         leading: IconButton(onPressed: (){
          Get.back();
         }, 
        icon:const  Icon(Icons.arrow_back_ios_new,size: 30,color: Colors.white)),
        title: const Text('Edit Profile',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             CircleAvatar(
              radius: 70,
              backgroundImage:const AssetImage('image/profileimg.png',),
              child: IconButton(onPressed: () {
                
              }, icon:const Icon(Icons.camera_alt)), // Replace with the user's profile picture
            ),
           const  SizedBox(height: 20),
            _buildTextField("Name", _nameController),
           const  SizedBox(height: 10),
            _buildTextField("Email", _emailController),
          const   SizedBox(height: 10),
            _buildTextField("Address", _addressController),
          const   SizedBox(height: 30),
           
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              
              color: Colors.orange.shade800,
              minWidth: double.infinity,
              height: 50,
              child:const  Text("Save Changes", style: TextStyle(fontSize: 20,color: Colors.white),),
              onPressed: (){
               
              }),
          )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border:const OutlineInputBorder(),
      ),
    );
  }
}
