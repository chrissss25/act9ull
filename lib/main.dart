import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentButton = 0;
  List<String> buttonList01 = [
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone15pro-digitalmat-gallery-3-202309?wid=728&hei=666&fmt=png-alpha&.v=1693081542150",
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone15pro-digitalmat-gallery-2-202309?wid=728&hei=666&fmt=png-alpha&.v=1693081541434",
  ];
  List<String> buttonList02 = [
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipadpro11-digitalmat-gallery-1-202404?wid=728&hei=666&fmt=png-alpha&.v=1713308651643",
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipadpro11-digitalmat-gallery-2-202404_GEO_MX?wid=728&hei=666&fmt=png-alpha&.v=1714194585653",
  ];
  List<String> buttonList03 = [
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp-14-digitalmat-gallery-1-202310?wid=728&hei=666&fmt=png-alpha&.v=1696971522628",
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mba13-m2-digitalmat-gallery-1-202402?wid=728&hei=666&fmt=png-alpha&.v=1707263976493",
  ];
  List<String> mainList = [];

  @override
  void initState() {
    super.initState();
    mainList = buttonList01;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffededed),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: const Color(0xff7D99A9),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 40.0, bottom: 30.0),
                child: Text(
                  "Descubre ya \nlo nuevo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mainList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return RotatedBox(
                        quarterTurns: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentButton = 2;
                                    mainList = buttonList03;
                                  });
                                },
                                child: Text("Mac",
                                    style: TextStyle(
                                      color: currentButton == 2
                                          ? Color(0xff165487)
                                          : Colors.black,
                                    )),
                              ),
                              SizedBox(
                                width: 100.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentButton = 1;
                                    mainList = buttonList02;
                                  });
                                },
                                child: Text("iPad",
                                    style: TextStyle(
                                      color: currentButton == 1
                                          ? Color(0xff165487)
                                          : Colors.black,
                                    )),
                              ),
                              SizedBox(
                                width: 100.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentButton = 0;
                                    mainList = buttonList01;
                                  });
                                },
                                child: Text(
                                  "iPhone",
                                  style: TextStyle(
                                    color: currentButton == 0
                                        ? Color(0xff165487)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(20.0),
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.network(
                                    mainList[index - 1],
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child:
                                Text("Apple", style: TextStyle(fontSize: 26)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 26.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Color(0xff165487),
                                ),
                                Text("Col. Bosques del Sol",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey))
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
