import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double maxwidth = MediaQuery.of(context).size.width;
    double maxheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(34, 42, 55, 1),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                        height: maxheight * 0.55,
                        width: maxwidth,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/clear.jpg",
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: maxwidth * 0.1,
                        vertical: maxheight * 0.35,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "32'C",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 20,
                                  offset: Offset.fromDirection(0, 2),
                                )
                              ],
                              fontSize: 50,
                            ),
                          ),
                          Text(
                            "clear",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  offset: Offset.fromDirection(0, 2),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: maxwidth,
                  height: maxheight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
