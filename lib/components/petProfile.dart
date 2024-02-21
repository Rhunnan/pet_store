import 'package:flutter/material.dart';
import 'package:pet_store/components/store_class.dart';

class MyPetProfile extends StatefulWidget {
  const MyPetProfile({required this.pet, super.key});
  final Pet pet;
  @override
  State<MyPetProfile> createState() => _MyPetProfileState();
}

class _MyPetProfileState extends State<MyPetProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 20),
      child: Container(
        height: 200,
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
                  const Icon(
                    Icons.circle,
                    color: Colors.green,
                  ),
                  const Text("Open"),
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
                  const Icon(Icons.attach_money_rounded),
                  Text(widget.pet.petPrice.toString()),
                ],
              ),
            ),
            GestureDetector(
                onTap: () {},
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
    );
    ;
  }
}
