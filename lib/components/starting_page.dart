import 'package:flutter/material.dart';
import 'package:pet_store/components/homepage.dart';
import 'package:pet_store/components/landingPage.dart';
import 'package:pet_store/main.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key, required this.title});

  final String title;

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    LinkedScrollControllerGroup scrollController =
        LinkedScrollControllerGroup();

    return Scaffold(
        body: SlidingUpPanel(
      body: Column(
        children: [
          SizedBox(
              height: 540,
              width: 402,
              child: ListView.builder(
                controller: scrollController.addAndGet(),
                scrollDirection: Axis.horizontal,
                itemCount: startData.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 500,
                    width: 402,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(startData[index]),
                            fit: BoxFit.cover)),
                  );
                },
              )),
          const SizedBox(
            height: 372,
            width: 402,
          )
        ],
      ),
      //properties of the sliding panel
      minHeight: 372, //deafult height or height when close
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      isDraggable: false,
      panel: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 40),
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              height: 30,
              width: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                controller: scrollController.addAndGet(),
                children: [
                  Container(
                    width: 402,
                    height: 30,
                    decoration: const BoxDecoration(color: Colors.white),
                  ),
                  Container(
                    width: 402,
                    height: 30,
                    decoration: const BoxDecoration(color: Colors.yellow),
                  )
                ],
              ),
            ),
          ),
          const Text(
            "You're One-Stop Pet Shop\n\t\t\t\t\t\t\t\t\t Experience!",
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 27),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 15),
            child: Text(
              "Connect with 5-star pet caregivers near \nyou who offer boarding, walking, house \n\t\t\t\t\t\t\t\t\t\t\t\t\t\tsitting or day care.",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.5),
            ),
          ),
          Container(
            height: 50,
            width: 350,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const landingPage()),
                );
              },
              style: TextButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
