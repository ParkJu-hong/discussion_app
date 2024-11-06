import 'package:flutter/material.dart';
import 'package:discussion_app/styles.dart';

String lorem =
    "중앙선거관리위원회는 대통령이 임명하는 3인, 국회에서 선출하는 3인과 대법원장이 지명하는 3인의 위원으로 구성한다. 위원장은 위원중에서 호선한다.\n\n"
    "모든 국민은 직업선택의 자유를 가진다. 대통령후보자가 1인일 때에는 그 득표수가 선거권자 총수의 3분의 1 이상이 아니면 대통령으로 당선될 수 없다.";

class DiscussionDetailOpinion extends StatefulWidget {
  const DiscussionDetailOpinion({super.key});

  @override
  State<DiscussionDetailOpinion> createState() =>
      _DiscussionDetailOpinionState();
}

class _DiscussionDetailOpinionState extends State<DiscussionDetailOpinion> {
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
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: OpinionCard(
                  content: lorem,
                  recommendationCount: 3,
                  referenceCount: 3,
                  userName: '박주홍',
                  createDate: '2032.01.15',
                  paperLink: 'www.naver.com',
                ),
              ),
              Container(
                child: Center(
                  child: CommentCards(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class OpinionCard extends StatelessWidget {
  final String content;
  final int recommendationCount;
  final int referenceCount;
  final String userName;
  final String createDate;
  final String paperLink;

  const OpinionCard({
    super.key,
    required this.content,
    required this.recommendationCount,
    required this.referenceCount,
    required this.userName,
    required this.createDate,
    required this.paperLink,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        GestureDetector(
          onTap: () {
            // Handle card click action
            if (paperLink.isNotEmpty) {
              // Open link
            }
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.92,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color:
                    Colors.white, // Light background color to mimic Toss style
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Content
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  // Recommendation and Reference Count Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Recommendation Count
                      Row(
                        children: [
                          Icon(
                            Icons.thumb_up,
                            size: MediaQuery.of(context).size.height * 0.02,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          Text(
                            '$recommendationCount',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.016,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      // Reference Count
                      Row(
                        children: [
                          Icon(
                            Icons.link,
                            size: MediaQuery.of(context).size.height * 0.02,
                            color: Colors.grey[600],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          Text(
                            '$referenceCount',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.016,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  // User and Date Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // User Name
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.016,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                      ),
                      // Create Date
                      Text(
                        createDate,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.014,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  // Paper Link
                  GestureDetector(
                    onTap: () {
                      // Handle link click action
                      if (paperLink.isNotEmpty) {
                        // Open the link
                      }
                    },
                    child: Text(
                      paperLink,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.016,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CommentCards extends StatelessWidget {
  CommentCards({super.key});

  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> commentCards = List.generate(
    20,
    (index) {
      return {
        'username': '박주홍 $index',
        'comment': '이게 맞아? $index',
      };
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  content: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height:
                        MediaQuery.of(context).size.height * 0.8, // 크기를 명확히 지정
                    child: Column(
                      children: [
                        // Title
                        Text(
                          '댓글',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Expanded(
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: commentCards.length,
                            itemBuilder: (context, index) {
                              return CommentCard(
                                username: commentCards[index]['username']!,
                                comment: commentCards[index]['comment']!,
                              );
                            },
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[
                                200], // Background color for the text field
                            hintText: 'Write a comment...', // Placeholder text
                            hintStyle: TextStyle(
                                color: Colors.grey[600]), // Hint text style
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(30), // Rounded corners
                              borderSide: BorderSide.none, // No visible border
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, // Padding for the vertical content
                              horizontal:
                                  20, // Padding for the horizontal content
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.send,
                                  color: Colors.blueAccent), // Send button icon
                              onPressed: () {
                                // Handle add comment action
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.92,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Content goes here
                  Text("Comment Card")
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CommentCard extends StatelessWidget {
  final String username;
  final String comment;

  const CommentCard({
    super.key,
    required this.username,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
        horizontal: MediaQuery.of(context).size.width * 0.04,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.018,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.015,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
