import 'package:flutter/material.dart';
class AddNewItem extends StatelessWidget {
  const AddNewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.abc,
          color: Colors.white,
        ),
        title: const Text("ADD NEW ITEM"),
        actions: [IconButton(onPressed: () {}, icon:const  Icon(Icons.restore))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Enter new item name",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter new item Prize",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Enter new item Description",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "ingridents", border: OutlineInputBorder()),
              ),
            ),
            Container(
              height: 100,
              width: 200,
              color: Colors.blueGrey,
              child: Center(
                child: IconButton(
                    onPressed: () {
                   
                    },
                    icon: const Icon(Icons.photo,color: Colors.white,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                  height: 50,
                  minWidth: double.infinity,
                  color: Colors.orange.shade800,
                  onPressed: () {},
                  child: const Text(
                    "ADD NEW ITEM",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
