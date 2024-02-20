import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

List<String> startData = [
  "assets/images/startCat.png",
  "assets/images/startCat2.png"
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PetShop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var indexVal = 0;

    void _incrementIndex(val) {
      setState(() {
        indexVal = val;
      });
    }

    LinkedScrollControllerGroup scrollController =
        LinkedScrollControllerGroup();

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
          Text(
            "You're One-Stop Pet Shop\n\t\t\t\t\t\t\t\t\t Experience! $indexVal",
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
              onPressed: () {},
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
