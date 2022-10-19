import 'dart:math';

import 'package:flutter/material.dart';
import 'package:witz/resources/jitsi_meet_methods.dart';
import 'package:witz/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({ Key? key }) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000)+10000000).toString();
    _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }
  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             HomeMeetingButton(onPressed: createNewMeeting, text: 'Создать', icon: Icons.videocam),
             HomeMeetingButton(onPressed: () => joinMeeting(context), text: 'Присоедениться', icon: Icons.add_box_rounded),
             HomeMeetingButton(onPressed: () {}, text: 'Запланировать', icon: Icons.calendar_today,),
             HomeMeetingButton(onPressed: () {}, text: 'Показать', icon: Icons.arrow_upward_rounded,),
          ],
        ),
        const Expanded(
        child: Center(
          child: Text(
            'Создать/присоедениться к коференции в клик',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      ],
    );
  }
}