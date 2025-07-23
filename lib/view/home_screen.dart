import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_instagram/view/profile_screen.dart';
import 'package:ui_instagram/widget/profile_side_menu.dart';
import 'home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  late AnimationController _controller;
  final double maxSlide = 250;
  bool isMenuOpen = false;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _screens = [
      HomeBody(),
      Center(child: Text('Search')),
      Center(child: Text('Add Post')),
      Center(child: Text('Notifications')),
      ProfileScreen(onMenuTap: toggleMenu),
    ];
  }

  void toggleMenu() {
    if (isMenuOpen) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() => isMenuOpen = !isMenuOpen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Align(
            alignment: Alignment.centerRight,
            child: ProfileMenuPage(),
          ),

          GestureDetector(
            onTap: () {
              if (isMenuOpen) toggleMenu();
            },
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                double slide = maxSlide * _controller.value;
                return Transform.translate(
                  offset: Offset(-slide, 0),
                  child: AbsorbPointer(
                    absorbing: isMenuOpen,
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      appBar: _selectedIndex == 0 ? homeAppBar() : null,
                      body: _screens[_selectedIndex],
                      bottomNavigationBar: BottomNavigationBar(
                        backgroundColor: Colors.white,
                        currentIndex: _selectedIndex,
                        onTap: (index) {
                          setState(() => _selectedIndex = index);
                        },
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: Colors.black,
                        unselectedItemColor: Colors.black,
                        iconSize: 30,
                        items: [
                          BottomNavigationBarItem(
                            icon: Icon(
                              _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
                              color: Colors.black,
                            ),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.search, color: Colors.black),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              _selectedIndex == 2 ? Icons.add_box : Icons.add_box_outlined,
                              color: Colors.black,
                            ),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(
                              _selectedIndex == 3 ? Icons.favorite : Icons.favorite_border,
                              color: Colors.black,
                            ),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage("assets/img/profile.png"),
                              ),
                            ),
                            label: '',
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  PreferredSizeWidget homeAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 95),
                  child: SvgPicture.asset('assets/img/camera.svg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: SvgPicture.asset('assets/img/Logo.svg'),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/img/TV.svg'),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/img/send.svg'),
                ),
              ),
            ],
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Container(color: Colors.grey[300], height: 1),
      ),
    );
  }

}
