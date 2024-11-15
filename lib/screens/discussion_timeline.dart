import 'package:flutter/material.dart';
import 'package:discussion_app/styles.dart';

class DiscussionTimeline extends StatefulWidget {
  final List<Map<String, dynamic>> timelineEvents;
  final String currentUserId;

  const DiscussionTimeline({
    super.key,
    required this.timelineEvents,
    required this.currentUserId,
  });

  @override
  _DiscussionTimelineState createState() => _DiscussionTimelineState();
}

class _DiscussionTimelineState extends State<DiscussionTimeline> {
  Set<String> expandedEvents = {};

  @override
  void initState() {
    print("=========================================================");
    List<Map<String, dynamic>> temp = widget.timelineEvents;
    print("this.widget.timelineEvents test : $temp");
    super.initState();
  }

  void toggleExpanded(String eventId) {
    setState(() {
      if (expandedEvents.contains(eventId)) {
        expandedEvents.remove(eventId);
      } else {
        expandedEvents.add(eventId);
      }
    });
  }

  void navigateToSubOpinionsPage(List<Map<String, dynamic>> event) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DiscussionTimeline(
          timelineEvents:
              event ?? [], // List<Map<String, dynamic>>.from([event] ?? []),
          currentUserId: widget.currentUserId,
        ),
      ),
    );
  }

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
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: widget.timelineEvents.length,
          itemBuilder: (context, index) {
            final event = widget.timelineEvents[index];
            final bool isCurrentUserEvent =
                event['user_id'] == widget.currentUserId;
            final bool isExpanded = expandedEvents.contains(event['id']);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 10,
                          height: MediaQuery.of(context).size.height * 0.1,
                          color: isCurrentUserEvent
                              ? Colors.blueAccent
                              : Colors.grey[400],
                        ),
                        if (index != widget.timelineEvents.length - 1)
                          Container(
                            width: 2,
                            height: MediaQuery.of(context).size.height * 0.05,
                            color: Colors.grey[400],
                          ),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => toggleExpanded(event['id']),
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.02),
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.05),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: event['event_type'] == 'opinion_added'
                                  ? ((event['is_agree'] ?? false)
                                      ? Colors.green
                                      : Colors.red)
                                  : (isCurrentUserEvent
                                      ? Colors.blueAccent
                                      : Colors.transparent),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Event type
                              Text(
                                event['event_type'] ?? '알 수 없는 이벤트',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.022,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              // Event description
                              Text(
                                event['description'] ?? '이벤트 설명이 없습니다.',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  color: Colors.grey[700],
                                  height: 1.4,
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              // Event timestamp
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  event['created_at'] ?? '시간 정보 없음',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.016,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ),
                              if (isExpanded) ...[
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Text(
                                  event['sub_opinions'].length != 0
                                      ? '의견 및 댓글:'
                                      : '댓글',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                if (event['sub_opinions'].length != 0)
                                  GestureDetector(
                                    onTap: () {
                                      print("event['sub_opinions']");
                                      print(event['sub_opinions']);
                                      navigateToSubOpinionsPage(
                                          event['sub_opinions']);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.width *
                                              0.04),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '의견이 ${event['sub_opinions']?.length ?? 0}개 있습니다.',
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.018,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                ...List<Map<String, dynamic>>.from(
                                        event['comments'] ?? [])
                                    .map<Widget>((comment) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    child: Text(
                                      '- ${comment['content'] ?? '댓글 내용이 없습니다.'}',
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.016,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  );
                                }),
                              ]
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
