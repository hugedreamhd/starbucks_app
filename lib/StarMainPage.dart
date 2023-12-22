import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:starbucks_app/ScreenController.dart';

class StarMainPage extends StatefulWidget {
  const StarMainPage({super.key});

  @override
  State<StarMainPage> createState() => _StarMainPageState();
}

class _StarMainPageState extends State<StarMainPage> {
  bool isScrolled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            setState(() {
              isScrolled = true;
            });
          } else if (notification.direction == ScrollDirection.reverse) {
            setState(() {
              isScrolled = false;
            });
          }
          return isScrolled;
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: false,
              floating: false,
              delegate: MySliverPersistentHeaderDelegate(),
            ),

            // SliverAppBar(
            //   pinned: false,
            //   expandedHeight: 300,
            //   title: Column(//크기를 강제 고정시킨다
            //     children: [
            //       Image.asset(
            //         'assets/img/starbucks_01.png',
            //         fit: BoxFit.cover,
            //       ),
            //     ],
            //   ),
            // ),
            const SliverAppBar(
              // toolbarHeight: 100.0,
              // expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(),
              floating: false,
              //위로 스크롤 했을 때, 슬리버앱바 나오는지 여부
              pinned: true,
              //아래로 스크롤 했을 때, 타이틀이 남아있는지 여부

              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.mail_outline,
                            color: Colors.black,
                            size: 35,
                          ),
                          Text(
                            '''What's' new''',
                            style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.airplane_ticket_outlined,
                            color: Colors.black,
                            size: 35,
                          ),
                          Text(
                            '''Coupon''',
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/img/01_01_2023_winter_e-frequency.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/img/03_01_chrismas_event.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/img/04_05_cardnews.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      constraints:
                          BoxConstraints.tightFor(width: 200, height: 400),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        //horizontal 가로 x축 / vertical 세로 y축
                        children: [
                          Image.asset(
                            'assets/img/04_01_cardnews.png',
                          ),
                          Image.asset(
                            'assets/img/04_02_cardnews.png',
                          ),
                          Image.asset(
                            'assets/img/04_03_cardnews.png',
                          ),
                          Image.asset(
                            'assets/img/04_04_cardnews.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/img/04_06_cardnews.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/img/04_07_cardnews.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/img/04_08_cardnews.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/img/04_09_cardnews.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/img/04_10_cardnews.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ScreenController(), //다트 생성자 같은거
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green[800],
// shape: CircleBorder(),
        onPressed: () {},
        isExtended: isScrolled,
        icon: const Icon(Icons.motorcycle_rounded, color: Colors.white),
        label: const Text(
          'Delivers',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: 200,
      height: 300,
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/img/starbucks_01.png',
          height: 500,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  double get maxExtent => 210.0; //이미지 에셋에 담긴 크기 조절
  @override
  double get minExtent => 210.0; //이미지 에셋에 담긴 크기 조절 이 숫자를 줄이면 스크롤할때 크기가 반응해서 줄어듬

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

/*class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List imageList = [
    'assets/img/04_01_cardnews.png',
    'assets/img/04_02_cardnews.png',
    'assets/img/04_03_cardnews.png',
  ];

  Widget sliderWidget(){
    return CarouselSlider(items: imageList.map((imgLink) {
      return Builder(
          builder: (context){
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(
                  imgLink,
                ),
              ),
            );
          },
      );
    },
    ).toList(),
        options: CarouselOptions(
          height: 300,
          viewportFraction: 1.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          onPageChanged: (index, reason){
            setState(() {
              _current = index;
            });
          },
         ),
    );
  }*/
