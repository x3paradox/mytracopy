import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fradio_nullsafety/fradio_nullsafety.dart';

class Deatils extends StatefulWidget {
  const Deatils({super.key});

  @override
  State<Deatils> createState() => _DeatilsState();
}

class _DeatilsState extends State<Deatils> {
  int groupValue_4 = 0;
  final List<String> sizeValue = ['S', 'M', 'L', 'XL'];

  late final List<String> sizes;
  late final String selectedSize;
  late final void Function(String) onSizeSelected;

  String txt = '';
  final CarouselController _controller = CarouselController();
  int _current = 0;
  List<String> list = [
    'https://tryplore.com/uploads/catalog/products/main_image/DSCF6706.JPG',
    'https://tryplore.com/uploads/catalog/products/main_image/DSCF6707.JPG',
  ];
  List<String> images = [
    'https://kwabey.com/images/moon-knight-black-tshirt/360/1700.jpg',
    'https://kwabey.com/images/mood-of-the-day-white-tshirt/360/1695.jpg',
    'https://kwabey.com/images/never-quit-white-half-sleeves-tshirt-for-men/360/267.jpg',
    'https://kwabey.com/images/mood-of-the-day-white-tshirt/360/1695.jpg',
    'https://kwabey.com/images/never-quit-white-half-sleeves-tshirt-for-men/360/267.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 500.0,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: list.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(),
                        child: Image.network(
                          '$item',
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 9.0,
                      height: 9.0,
                      margin: EdgeInsets.only(
                        bottom: 0,
                        left: 4,
                        right: 4,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (_current == entry.key
                                ? Color.fromARGB(255, 7, 7, 7)
                                : Colors.blue[200]
                            // color: Color(0xFFFF4E00)
                            //     .withOpacity(_current == entry.key ? 0.9 : 0.4),
                            ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Men\'s Round Neck Half Sleeve Regular Fit Printed T-Shirt',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '\u{20B9}399',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '\u{20B9}699',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text('SELECT SIZE'),
              //       Text(
              //         'SIZE CHART >',
              //         style: TextStyle(color: Colors.green),
              //       ),
              //       Text(
              //         'FIT GUIDE >',
              //         style: TextStyle(color: Colors.green),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  'Select Size',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.5),
                  minFontSize: 17,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: sizeVariants(),
              ),
              Row(
                children: [
                  Text('   Size Chart'),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  content: Image.asset(
                                    'assets/chart2.jpeg',
                                    fit: BoxFit.cover,
                                  ),
                                ));
                      },
                      icon: Icon(Icons.rule_folder))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, right: 10, left: 10, bottom: 10),
                child: Container(
                  // width: 183,
                  // height: 56,
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  child: CupertinoButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.shoppingCart,
                            color: Colors.white,
                            size: 20,
                          ),
                          AutoSizeText(
                            "   BUY THIS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.5,
                                fontWeight: FontWeight.w400),
                            maxFontSize: 17,
                            minFontSize: 17,
                          ),
                        ],
                      ),
                      onPressed: () {}),
                ),
              ),

              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget sizeVariants() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 4 ? 0 : 10),
              child: FRadio(
                // normalColor: Colors.black,
                width: 50,
                height: 50,
                value: index + 1,
                groupValue: groupValue_4,
                onChanged: (value) {
                  setState(() {
                    groupValue_4 = value as int;
                  });
                },
                // gradient: LinearGradient(
                //   colors: [
                //     Color(0xffd4d4d4),
                //     Color(0xff9a9a9a),
                //     Color(0xff707070),
                //     Color(0xff454545),
                //   ],
                //   begin: Alignment(-0.1, -0.9),
                //   end: Alignment(1.0, 1.0),
                //   stops: [0.0, 0.2, 0.7, 1.0],
                // ),
                selectedColor: Colors.blueAccent,
                hasSpace: false,
                border: 1.5,
                child: Text(
                  "${sizeValue[index]}",
                  style: TextStyle(
                      color: Color.fromARGB(255, 9, 9, 9),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                hoverChild: Text(
                  "${sizeValue[index]}",
                  style: TextStyle(
                      color: Color.fromARGB(255, 7, 7, 7),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                selectedChild: Text("${sizeValue[index]}",
                    style: TextStyle(
                        color: Color.fromARGB(255, 5, 5, 5),
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              ),
            );
          }),
    );
  }
}
