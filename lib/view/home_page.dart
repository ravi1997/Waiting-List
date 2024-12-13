
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpc_waiting_list/cubit/logout/logout_cubit.dart';
import 'package:rpc_waiting_list/helper/user.dart';
import 'package:rpc_waiting_list/view/home_page/about_page.dart';
import 'package:rpc_waiting_list/view/home_page/child_page.dart';
import 'package:rpc_waiting_list/view/home_page/parent_page.dart';
import 'package:rpc_waiting_list/view/home_page/slot_page.dart';
import 'package:rpc_waiting_list/view/login_page/login_web_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const AboutPage(),
    const ParentPage(),
    const SlotPage(),
    const ChildPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Navbar(onItemTapped: _onItemTapped),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

class Navbar extends StatelessWidget {
  final Function(int) onItemTapped;

  const Navbar({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    LocalUser userLocal = LocalUser();
    int? cadre;
    userLocal.getUser().then((value) {
      cadre = value?.cadreId;
    },);
    return AppBar(
      backgroundColor: Colors.black, // Set the background color to black
      title: const Text(
        'Waiting List',
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            onItemTapped(0); // Home
          },
          child: const Text('Home', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {
            onItemTapped(1); // About
          },
          child: const Text('About', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {
            if (cadre != 2) {
              onItemTapped(2); // Contact
            } else {
              onItemTapped(4); // Contact
            }
          },
          child: Text((cadre != 2) ? 'Parent User' : 'Child Users',
              style: const TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {
            onItemTapped(3); // Slots
          },
          child: const Text('Slots', style: TextStyle(color: Colors.white)),
        ),
        BlocListener<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutLoaded) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginPageWeb()));
            }
          },
          child: TextButton(
            onPressed: () {
              BlocProvider.of<LogoutCubit>(context).logOutReq();
            },
            child: const Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.blueGrey,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('© 2024 My Web App', style: TextStyle(color: Colors.white)),
          Text('Privacy Policy', style: TextStyle(color: Colors.white)),
          Text('Terms of Service', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Page'));
  }
}
