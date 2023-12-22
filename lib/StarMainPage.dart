import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
                    children: [
                      Icon(
                        Icons.mail_outline,
                        color: Colors.black,
                        size: 30,
                      ),
                      Text(
                        '''What's' new''',
                        style: TextStyle(fontSize: 15),
                      ),
                      Icon(
                        Icons.airplane_ticket_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      Text(
                        '''Coupon''',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                  Image.asset('assets/img/01_01_2023_winter_e-frequency.png'),
                  Container(
                    child: Image.asset('assets/img/03_01_chrismas_event.png'),
                    color: Colors.black12,
                  ),
                  Container(
                    constraints: BoxConstraints.tightFor(width: 200, height: 420),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/img/04_01_cardnews.png',
                              ),
                            ],
                          ),
                        ),
                        Image.asset('assets/img/04_02_cardnews.png'),
                        Image.asset('assets/img/04_03_cardnews.png'),
                      ],
                    ),
                  ),
                  Image.asset('assets/img/04_04_cardnews.png'),
                ]))
          ],
        ),
      ),

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
  double get maxExtent => 210.0;
  @override
  double get minExtent => 210.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
