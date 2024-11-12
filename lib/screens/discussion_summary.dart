import 'package:flutter/material.dart';
import 'package:discussion_app/styles.dart';

class DiscussionSummary extends StatelessWidget {
  final String title;
  final String summary;
  final String user;
  final String date;

  const DiscussionSummary({
    super.key,
    required this.title,
    required this.summary,
    required this.user,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        backgroundColor: backgroundColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                // Summary
                Text(
                  summary,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                // User and Date Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // User Name
                    Text(
                      user,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent,
                      ),
                    ),
                    // Date
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.016,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DiscussionSummaryScreen extends StatelessWidget {
  final List<Map<String, String>> summaries = List.generate(
    5,
    (index) => {
      'title': '토론 주제 $index',
      'summary': '이것은 토론 주제 $index의 요약입니다. 요약 내용은 간결하고 핵심적인 정보를 담고 있어야 합니다.',
      'user': '작성자 $index',
      'date': '2024-11-04',
    },
  );

  DiscussionSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '토론 요약',
          style: TextStyle(
            color: Colors.black87,
            fontSize: MediaQuery.of(context).size.height * 0.025,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: ListView.builder(
        itemCount: summaries.length,
        itemBuilder: (context, index) {
          return DiscussionSummary(
            title: summaries[index]['title']!,
            summary: summaries[index]['summary']!,
            user: summaries[index]['user']!,
            date: summaries[index]['date']!,
          );
        },
      ),
    );
  }
}
