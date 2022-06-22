import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mytracopy/produact.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String txt = '';
  final CarouselController _controller = CarouselController();
  int _current = 0;
  List<String> list = [
    'https://kwabey.com/images/banners/540/1583.jpg',
    'https://kwabey.com/images/banners/540/1586.jpg',
    'https://kwabey.com/images/offer-banners/540/1596.jpg',
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
      drawer: Drawer(),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                // height: 325.0,
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

            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Scrollbar(
                child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Image.network(
                            'https://assets.myntassets.com/f_webp,w_245,c_limit,fl_progressive,dpr_2.0/assets/images/2022/6/8/5c908d7b-172a-4070-aff8-513a4d786e671654686798169-Bank-strip-prebuzz-ICICI.jpg'),
                      );
                    }),
              ),
            ),
            // CarouselSlider(
            //   options: CarouselOptions(
            //     height: 200.0,
            //     autoPlay: true,
            //     onPageChanged: (index, reason) {
            //       setState(() {
            //         _current = index;
            //       });
            //     },
            //   ),
            //   items: list.map((item) {
            //     return Builder(
            //       builder: (BuildContext context) {
            //         return Container(
            //           width: MediaQuery.of(context).size.width,
            //           margin: EdgeInsets.symmetric(horizontal: 5.0),
            //           decoration: BoxDecoration(),
            //           child: Image(
            //             image: NetworkImage(
            //               item,
            //             ),
            //           ),
            //           // Image.asset(
            //           //   'assets/$item',
            //           //   fit: BoxFit.fill,
            //         ); // ));
            //       },
            //     );
            //   }).toList(),
            // ),

            SizedBox(
              height: 8,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 192,
                  child: Image.network(
                      'https://kwabey.com/images/offer-banners/540/1596.jpg'),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 192,
                  child: Image.network(
                      'https://kwabey.com/images/offer-banners/540/1590.jpg'),
                )
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Image.network(
                'https://kwabey.com/shared/img/kwabey/fixed/love_india_1.jpg'),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.grey[300],
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Shop The Latest',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 250,
                            margin: EdgeInsets.all(5),
                            width: 200,
                            child: GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => const Deatils()),
                                  // );
                                },
                                child: Image.network(images[index],
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'New Arrival',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  '\u{20B9} 399',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(' \u{20B9} 699',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.red)),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Image.network(
                'https://kwabey.com/shared/img/kwabey/fixed/information_bar_1.jpg'),

            SizedBox(
              height: 5,
            ),

            Image.network(
                'https://kwabey.com/shared/img/kwabey/fixed/footer_ss_kwabey_3.jpg'),
          ],
        ),
      )),
    );
  }
}
