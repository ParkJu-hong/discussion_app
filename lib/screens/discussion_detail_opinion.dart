import 'package:discussion_app/screens/discussion_detail.dart';
import 'package:discussion_app/screens/writeopinion.dart';
import 'package:flutter/material.dart';
import 'package:discussion_app/styles.dart';
import 'dart:math';

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
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _opinionCards = List.generate(
    20,
    (index) => {
      'date': 'Date $index',
      'user': 'user $index',
      'content': 'content $index',
      'isItAgainst': Random().nextBool(),
    },
  );
  final Map<String, bool> user = {
    'role': true,
  };

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
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: OpinionMainCard(
                  content: lorem,
                  recommendationCount: 3,
                  referenceCount: 3,
                  userName: '박주홍',
                  createDate: '2032.01.15',
                  paperLink: 'www.naver.com',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.06,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '의견',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _opinionCards.length,
                  itemBuilder: (context, index) {
                    return OpinionCard(
                        date: _opinionCards[index]['date']!,
                        user: _opinionCards[index]['user']!,
                        content: _opinionCards[index]['content']!,
                        comments: 6,
                        isItAgainst: _opinionCards[index]['isItAgainst']!);
                  },
                ),
              ),
            ],
          ),
          (user['role'] == true)
              ? Positioned(
                  left: MediaQuery.of(context).size.width * 0.04,
                  top: MediaQuery.of(context).size.height * 0.74,
                  child: GestureDetector(
                    onTap: () {
                      // 차례 스킵
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.08,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(
                          width: 1,
                          color: Colors.grey[300]!,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.015,
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // '차례 스킵' 텍스트
                          Text(
                            '차례 스킵',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.018,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03),
                          // '가능 횟수' 텍스트
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '가능 횟수: 2',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.016,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          (user['role'] == true)
              ? Positioned(
                  left: MediaQuery.of(context).size.width * 0.72,
                  top: MediaQuery.of(context).size.height * 0.75,
                  child: GestureDetector(
                    onTap: () {
                      // push가 안됨.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WriteOpinion(
                            isDiscussionOpinion: true,
                            isReferencingAnotherOpinion: false,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.07,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border.all(
                          width: 1,
                          color: Colors.grey[300]!,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.012,
                        horizontal: MediaQuery.of(context).size.width * 0.04,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '의견 작성',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.017,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class OpinionMainCard extends StatelessWidget {
  final String content;
  final int recommendationCount;
  final int referenceCount;
  final String userName;
  final String createDate;
  final String paperLink;

  OpinionMainCard({
    super.key,
    required this.content,
    required this.recommendationCount,
    required this.referenceCount,
    required this.userName,
    required this.createDate,
    required this.paperLink,
  });

  final ScrollController _scrollController = ScrollController();
  final ScrollController _previewScrollController = ScrollController();
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                            fontSize:
                                MediaQuery.of(context).size.height * 0.016,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  child: Column(
                                    children: [
                                      // Title
                                      Text(
                                        '댓글',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),

                                      // Comments List
                                      Expanded(
                                        child: ListView.builder(
                                          controller: _scrollController,
                                          itemCount: commentCards.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.005,
                                              ),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 1,
                                                margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.04,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        commentCards[index]
                                                            ['comment']!,
                                                        style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.02,
                                                          color: Colors.black54,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.01),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            commentCards[index]
                                                                ['username']!,
                                                            style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.015,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      // Comment Input Field
                                      TextField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          hintText: '댓글을 작성하세요...',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[600]),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 16,
                                            horizontal: 20,
                                          ),
                                          suffixIcon: IconButton(
                                            icon: const Icon(Icons.send,
                                                color: Colors.blueAccent),
                                            onPressed: () {
                                              // Handle add comment action
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.comment,
                                size: MediaQuery.of(context).size.height * 0.03,
                                color: Colors.black,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01),
                              Text(
                                '6',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.014,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
  final ScrollController _previewScrollController = ScrollController();
  final List<Map<String, String>> commentCards = List.generate(
    20,
    (index) {
      return {
        'username': '박주홍 $index',
        'comment': '이게 맞아? $index',
      };
    },
  );
  final List<Map<String, String>> previewComments = List.generate(
    2,
    (index) {
      return {
        'username': 'Name preview $index',
        'comment': 'Comment preview $index',
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
          onTap: () {},
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // 고정된 높이를 부여하여 ListView.builder의 스크롤이 충돌하지 않도록 합니다.
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                      controller: _previewScrollController,
                      itemCount: previewComments.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.005,
                          ),
                          child: Card(
                            color: const Color.fromARGB(255, 246, 242, 242),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 1,
                            margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.02,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.04,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    previewComments[index]['comment']!,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        previewComments[index]['username']!,
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.015,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "댓글 더보기",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
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
