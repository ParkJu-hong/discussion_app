import 'package:flutter/material.dart';
import 'package:discussion_app/styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _infoCards = List.generate(
    20,
    (index) => {
      'date': 'Date $index',
      'imageUrl': 'https://via.placeholder.com/150',
      'info': 'Information $index',
      'status': 'Status $index',
      'title': 'Title $index',
    },
  );

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
            children: [
              // discussion status filter
              const DiscussionStatusFilter(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const DiscussionSearchFilter(),
              // discussion infos with infinite scrolling
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _infoCards.length,
                  itemBuilder: (context, index) {
                    return InfoCard(
                      date: _infoCards[index]['date']!,
                      imageUrl: _infoCards[index]['imageUrl']!,
                      info: _infoCards[index]['info']!,
                      status: _infoCards[index]['status']!,
                      title: _infoCards[index]['title']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DiscussionStatusFilter extends StatelessWidget {
  const DiscussionStatusFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.03),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.height * 0.05,
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(importantText),
            ),
            child: const Text(
              '전체',
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.05,
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(importantText),
            ),
            child: const Text(
              '시작전',
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.05,
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(importantText),
            ),
            child: const Text(
              '진행중',
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.height * 0.05,
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(importantText),
            ),
            child: const Text(
              '완료',
            ),
          ),
        ),
      ],
    );
  }
}

class DiscussionSearchFilter extends StatelessWidget {
  const DiscussionSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.03),
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(25),
          ),
          child: IconButton(
            icon: const Icon(Icons.filter_list),
            color: Colors.grey[600],
            onPressed: () {
              // Handle filter action
            },
          ),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String info;
  final String date;
  final String status;

  const InfoCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.info,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        GestureDetector(
          onTap: () {
            // Handle card click action
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      // Image Section
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Text Section
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Title
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Info
                              Text(
                                info,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Date
                              Text(
                                date,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Status Overlay on Image
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
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
