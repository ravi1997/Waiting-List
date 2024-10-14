import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpc_waiting_list/cubit/logout/logout_cubit.dart';
import 'package:rpc_waiting_list/view/login_page/login_web_page.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomePage(),
    AboutPage(),
    ContactPage(),
    SlotPage(),
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
        preferredSize: Size.fromHeight(60.0),
        child: Navbar(onItemTapped: _onItemTapped),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}

class Navbar extends StatelessWidget {
  final Function(int) onItemTapped;

  Navbar({required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black, // Set the background color to black
      title: Text(
        'Waiting List',
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            onItemTapped(0); // Home
          },
          child: Text('Home', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {
            onItemTapped(1); // About
          },
          child: Text('About', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {
            onItemTapped(2); // Contact
          },
          child: Text('Contact', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {
            onItemTapped(3); // Slots
          },
          child: Text('Slots', style: TextStyle(color: Colors.white)),
        ),
        BlocListener<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutLoaded) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPageWeb()));
            }
          },
          child: TextButton(
            onPressed: () {
              BlocProvider.of<LogoutCubit>(context).logOutReq();
            },
            child: Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Colors.blueGrey,
      child: Row(
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
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Page'));
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('About Page'));
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Contact Page'));
  }
}

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Contact Page'));
  }
}

class SlotPage extends StatefulWidget {
  @override
  _SlotPageState createState() => _SlotPageState();
}

class _SlotPageState extends State<SlotPage> {
  Map<DateTime, List<dynamic>> _events = {
    DateTime(2024, 7, 15): ['Available'],
    DateTime(2024, 7, 17): ['Available'],
    DateTime(2024, 7, 22): ['Available'],
    DateTime(2024, 7, 25): ['Available'],
    DateTime(2024, 7, 26): ['Available'],
  };

  DateTime _selectedDay = DateTime(2024, 7, 8);
  bool _isAvailable = false;
  String _availabilityText = 'Please select a date';

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _isAvailable = _events[selectedDay]?.contains('Available') ?? false;
      _availabilityText =
          _isAvailable ? 'Slot is available' : 'Slot is unavailable';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: _selectedDay,
          firstDay: DateTime.utc(2020, 10, 16),
          lastDay: DateTime.utc(DateTime.now().year + 10, 3, 14),
          // Set lastDay dynamically
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: _onDaySelected,
          eventLoader: (day) {
            return _events[day] ?? [];
          },
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, date, events) {
              if (events.isNotEmpty) {
                return Positioned(
                  right: 1,
                  bottom: 1,
                  child: _buildEventsMarker(date, events),
                );
              }
              return null;
            },
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              _availabilityText,
              style: TextStyle(
                color: _isAvailable ? Colors.green : Colors.red,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: events.contains('Available') ? Colors.green : Colors.red,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
