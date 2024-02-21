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
        padding: const EdgeInsets.only(bottom: 20, right: 20),
        child: Container(
          height: 700,
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
                padding: const EdgeInsets.only(top: 15),
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
                child: Row(
                  children: [
                    const Icon(Icons.attach_money_rounded),
                    Text(widget.pet.petPrice.toString()),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        widget.pet.petName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    const Icon(Icons.details),
                    FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.pet.aboutPet,
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Provider.of<CartModel>(context, listen: false)
                        .addPetItem(widget.pet);
                  },
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: const Center(
                        child: Row(
                      children: [
                        Text(
                          "Add To Cart",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        Icon(Icons.shopping_cart)
                      ],
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
