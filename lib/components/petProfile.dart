import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pet_store/components/cartPage.dart';
import 'package:pet_store/components/store_class.dart';
import 'package:provider/provider.dart';

class MyPetProfile extends StatefulWidget {
  const MyPetProfile({required this.pet, super.key});
  final Pet pet;
  @override
  State<MyPetProfile> createState() => _MyPetProfileState();
}

class _MyPetProfileState extends State<MyPetProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Padding(
          padding: EdgeInsets.only(left: 55),
          child: Text(
            "Pet Profile",
            style: TextStyle(fontSize: 35),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyCart()),
                );
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 20, left: 10),
        child: Container(
          height: 600,
          width: 380,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.yellow,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1),
                ),
              ]),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(widget.pet.imagePath),
                        fit: BoxFit.cover),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    widget.pet.petName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      width: 320,
                      child: AutoSizeText(
                        widget.pet.aboutPet,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.attach_money_rounded,
                      color: Colors.green,
                    ),
                    Text(
                      widget.pet.petPrice.toString(),
                      style: TextStyle(color: Colors.green, fontSize: 30),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false)
                        .addPetItem(widget.pet);
                  },
                  child: const Text("Add To Cart"))
            ],
          ),
        ),
      ),
    );
  }
}
