import 'package:co_workit/view/invoice/invoice_screen.dart';
import 'package:co_workit/view/mailing/mailing_screen.dart';
import 'package:co_workit/view/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:co_workit/view/visitors/visitor_screen.dart';
import 'package:co_workit/view/booking/booking_screen.dart';
import 'package:co_workit/view/home_screens.dart/home_screen.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final _advancedDrawerController = AdvancedDrawerController();
  int _selectedIndex = 0;

  final List<Widget> _screens = [
     InvoiceScreen(),
    BookingScreen(),
    MailingScreen(),
    VisitorScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold( 
        appBar: AppBar( 
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar( 
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_online),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.email),
              label: 'Mailing',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Visitor',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black12,
          onTap: _onItemTapped,
        ),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                 Center(
                child: GestureDetector(
                  onTap: () {
                    // Handle image update
                    // Implement your image update logic here
                  },
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/final-year-project-b1601.appspot.com/o/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa%2FCoworkit-2%201.png?alt=media&token=a3372457-11c3-484b-ab92-ba2a9842b7c0")
                  ),
                ),
              ),
                // Container(
                //   width: 128.0,
                //   height: 128.0,
                //   margin:   EdgeInsets.only(
                //     top: 24.0,
                //     bottom: 64.0,
                //   ),
                //   clipBehavior: Clip.antiAlias,
                //   decoration: BoxDecoration(
                //     color: Colors.black26,
                //     shape: BoxShape.circle,
                //   ),
                //   child: NetworkImage("https://firebasestorage.googleapis.com/v0/b/final-year-project-b1601.appspot.com/o/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa%2FCoworkit-2%201.png?alt=media&token=a3372457-11c3-484b-ab92-ba2a9842b7c0")
                // ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {
                    Get.to(()=>ProfileScreen());
                  },
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: const Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
