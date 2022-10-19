import 'package:flutter/material.dart';
import 'package:witz/resources/auth_methods.dart';
import 'package:witz/screens/history_meeting_screen.dart';
import 'package:witz/screens/meeting_screen.dart';
import 'package:witz/utils/color.dart';
import 'package:witz/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _page = 0;
  onPageChanged(int page)
  {
    setState(() {
      _page = page;   
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text('Контакты'),
    CustomButton(text: 'Выйти с аккаунта', onPressed: () => AuthMethods().signOut()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Начать видеоконференцию'),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex:  _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.comment_bank,), label: 'Начать видеоконференцию',),

          BottomNavigationBarItem(icon: Icon(Icons.lock_clock), label: 'Прошедшие конференции',),
          
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Контакты',),

          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Настройки',),

        ],
      ),
    );
  }
}
