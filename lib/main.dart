import 'package:discussion_app/screens/auth_selection_screen.dart';
import 'package:discussion_app/screens/discussion_detail.dart';
import 'package:discussion_app/screens/discussion_detail_opinion.dart';
import 'package:discussion_app/screens/discussion_summary.dart';
import 'package:discussion_app/screens/discussion_timeline.dart';
import 'package:discussion_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:discussion_app/styles.dart';
import 'package:flutter/services.dart';

List<Map<String, dynamic>> timelineEvents = [
  {
    'id': 'event1',
    'event_type': 'opinion_added',
    'description': 'A new opinion was added.',
    'created_at': '2024-11-04 15:00',
    'user_id': 'user1',
    'is_agree': true,
    'comments': [
      {'content': 'This is a comment on event1.'},
      {'content': 'Another comment on event1.'},
    ],
    'sub_opinions': [
      {
        'id': 'sub1',
        'event_type': 'opinion_added',
        'description': 'A new sub opinion was added.',
        'created_at': '2024-11-04 15:10',
        'user_id': 'user2',
        'is_agree': false,
        'comments': [
          {'content': 'This is a comment on sub1.'},
        ],
        'sub_opinions': [
          {
            'id': 'subsub1',
            'event_type': 'opinion_added',
            'description': 'A new sub-sub opinion was added.',
            'created_at': '2024-11-04 15:20',
            'user_id': 'user3',
            'is_agree': true,
            'comments': [
              {'content': 'This is a comment on subsub1.'},
            ],
            'sub_opinions': [],
          }
        ],
      }
    ],
  },
  {
    'id': 'event2',
    'event_type': 'opinion_added',
    'description': 'Another opinion was added.',
    'created_at': '2024-11-05 10:00',
    'user_id': 'user2',
    'is_agree': false,
    'comments': [
      {'content': 'Comment on event2.'},
      {'content': 'Another comment on event2.'},
    ],
    'sub_opinions': [],
  },
  {
    'id': 'event3',
    'event_type': 'opinion_added',
    'description': 'Opinion three was added.',
    'created_at': '2024-11-05 14:00',
    'user_id': 'user3',
    'is_agree': true,
    'comments': [
      {'content': 'This is a comment on event3.'},
    ],
    'sub_opinions': [
      {
        'id': 'sub2',
        'event_type': 'opinion_added',
        'description': 'Another sub opinion was added.',
        'created_at': '2024-11-05 14:10',
        'user_id': 'user4',
        'is_agree': true,
        'comments': [
          {'content': 'Comment on sub2.'},
        ],
        'sub_opinions': [],
      }
    ],
  },
  {
    'id': 'event4',
    'event_type': 'opinion_added',
    'description': 'Opinion four was added.',
    'created_at': '2024-11-06 11:00',
    'user_id': 'user4',
    'is_agree': false,
    'comments': [
      {'content': 'Comment on event4.'},
    ],
    'sub_opinions': [
      {
        'id': 'sub3',
        'event_type': 'opinion_added',
        'description': 'Sub opinion for event4 was added.',
        'created_at': '2024-11-06 11:15',
        'user_id': 'user5',
        'is_agree': false,
        'comments': [
          {'content': 'This is a comment on sub3.'},
        ],
        'sub_opinions': [],
      }
    ],
  },
  {
    'id': 'event5',
    'event_type': 'opinion_added',
    'description': 'Opinion five was added.',
    'created_at': '2024-11-06 16:00',
    'user_id': 'user5',
    'is_agree': true,
    'comments': [
      {'content': 'Comment on event5.'},
    ],
    'sub_opinions': [],
  }
];

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 앱 초기화 보장
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 75, 17, 175),
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'discussion_app',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: WidgetStateProperty.all(buttonColor),
            foregroundColor: WidgetStateProperty.all(Colors.black),
            side: WidgetStateProperty.all(
              const BorderSide(
                color: borderColor,
                style: BorderStyle.solid,
              ),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // 모서리를 둥글게 설정 (12px radius)
              ),
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home: DiscussionTimeline(
        timelineEvents: timelineEvents,
        currentUserId: 'user1',
      ), //const AuthSelectionScreen(),
    );
  }
}
