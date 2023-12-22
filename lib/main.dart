import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StarMainPage(),
    );
  }
}

class StarMainPage extends StatefulWidget {
  const StarMainPage({super.key});

  @override
  State<StarMainPage> createState() => _StarMainPageState();
}

class _StarMainPageState extends State<StarMainPage> {
  int _selectedIndex = 0;
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
              toolbarHeight: 100,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(),
              floating: true,
              //위로 스크롤 했을 때, 슬리버앱바 나오는지 여부
              pinned: true,
              //아래로 스크롤 했을 때, 타이틀이 남아있는지 여부

              bottom: PreferredSize(
                preferredSize: Size.fromHeight(40),
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
                        'Coupon',
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
                constraints: BoxConstraints.tightFor(width: 100, height: 200),
                child: ListView(
                  scrollDirection: Axis.horizontal,
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
      bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              size: 30,
              Icons.home,
              color: Colors.green,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              size: 30,
              Icons.payment_outlined,
              color: Colors.green,
            ),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              size: 30,
              Icons.star_border,
              color: Colors.green,
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              size: 30,
              Icons.shop,
              color: Colors.green,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              size: 30,
              Icons.other_houses,
              color: Colors.green,
            ),
            label: 'Other',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
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
      width: MediaQuery.of(context).size.width,
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
  double get maxExtent => 150.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
