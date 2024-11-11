import 'package:flutter/material.dart';
import 'package:discussion_app/styles.dart';

class WriteOpinion extends StatefulWidget {
  final bool
      isDiscussionOpinion; // true if it's a discussion opinion, false if responding to another opinion
  final bool isReferencingAnotherOpinion;

  const WriteOpinion({
    super.key,
    required this.isDiscussionOpinion,
    this.isReferencingAnotherOpinion = false,
  });

  @override
  State<WriteOpinion> createState() => _WriteOpinionState();
}

class _WriteOpinionState extends State<WriteOpinion> {
  bool? _isAgree; // null = not selected, true = agree, false = disagree
  final TextEditingController _opinionController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              '의견 작성',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            // Reference to another opinion (if applicable)
            if (widget.isReferencingAnotherOpinion)
              Text(
                '다른 의견을 참조합니다.',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                  color: Colors.grey[600],
                ),
              ),
            if (widget.isReferencingAnotherOpinion) const SizedBox(height: 20),
            // Agree/Disagree buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isAgree = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isAgree == true
                          ? Colors.blueAccent
                          : Colors.grey[200],
                      foregroundColor:
                          _isAgree == true ? Colors.white : Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('찬성'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isAgree = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isAgree == false
                          ? Colors.blueAccent
                          : Colors.grey[200],
                      foregroundColor:
                          _isAgree == false ? Colors.white : Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('반대'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Opinion input field
            TextField(
              controller: _opinionController,
              maxLines: 5,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: '의견을 입력해주세요...',
                hintStyle: TextStyle(color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(20),
              ),
            ),
            const SizedBox(height: 20),
            // Reference link input field
            TextField(
              controller: _linkController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: '참조 링크를 입력해주세요 (선택 사항)',
                hintStyle: TextStyle(color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(20),
              ),
            ),
            const SizedBox(height: 20),
            // Submit button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle submission of opinion
                  if (_opinionController.text.isNotEmpty) {
                    // Submit logic here
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  '제출',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
