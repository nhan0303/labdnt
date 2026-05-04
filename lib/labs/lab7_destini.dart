import 'package:flutter/material.dart';

class Lab7Screen extends StatefulWidget {
  const Lab7Screen({super.key});

  @override
  State<Lab7Screen> createState() => _Lab7ScreenState();
}

class _Lab7ScreenState extends State<Lab7Screen> {
  final List<Story> _stories = [
    Story(
      storyTitle:
          'Bạn đang đi bộ trong một khu rừng tối tăm và tìm thấy một ngã ba đường. Một con đường dẫn đến một ngôi làng, con đường còn lại dẫn đến một lâu đài cũ.',
      choice1: 'Đi đến ngôi làng',
      choice2: 'Đi đến lâu đài',
      nextStory1: 1,
      nextStory2: 2,
    ),
    Story(
      storyTitle:
          'Ngôi làng trông yên bình, nhưng một cụ già cảnh báo bạn về một con quái vật trong rừng. Bạn có muốn ở lại hay quay lại rừng?',
      choice1: 'Ở lại làng',
      choice2: 'Quay lại rừng',
      nextStory1: 3,
      nextStory2: 4,
    ),
    Story(
      storyTitle:
          'Lâu đài cũ đầy bí ẩn. Bạn nghe thấy tiếng động lạ từ tầng hầm. Bạn muốn khám phá tầng hầm hay rời đi?',
      choice1: 'Khám phá tầng hầm',
      choice2: 'Rời đi',
      nextStory1: 4,
      nextStory2: 5,
    ),
    Story(
      storyTitle:
          'Bạn ở lại ngôi làng và được người dân chào đón. Bạn sống hạnh phúc mãi mãi.',
      choice1: '',
      choice2: '',
      nextStory1: 0,
      nextStory2: 0,
    ),
    Story(
      storyTitle:
          'Bạn đối mặt với con quái vật trong rừng và thất bại. Câu chuyện kết thúc.',
      choice1: '',
      choice2: '',
      nextStory1: 0,
      nextStory2: 0,
    ),
    Story(
      storyTitle:
          'Bạn rời lâu đài an toàn và tiếp tục cuộc phiêu lưu của mình.',
      choice1: '',
      choice2: '',
      nextStory1: 0,
      nextStory2: 0,
    ),
  ];

  int _storyIndex = 0;

  void _nextStory(int choice) {
    setState(() {
      if (choice == 1) {
        _storyIndex = _stories[_storyIndex].nextStory1;
      } else {
        _storyIndex = _stories[_storyIndex].nextStory2;
      }
      if (_storyIndex == 0) {
        _storyIndex = 0; // Reset to start
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade900, Colors.blue.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      _stories[_storyIndex].storyTitle,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo.shade900,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (_stories[_storyIndex].choice1.isNotEmpty)
                AnimatedOpacity(
                  opacity: _stories[_storyIndex].choice1.isNotEmpty ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: ElevatedButton(
                    onPressed: () => _nextStory(1),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade600,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      _stories[_storyIndex].choice1,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 10),
              if (_stories[_storyIndex].choice2.isNotEmpty)
                AnimatedOpacity(
                  opacity: _stories[_storyIndex].choice2.isNotEmpty ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: ElevatedButton(
                    onPressed: () => _nextStory(2),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade600,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      _stories[_storyIndex].choice2,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class Story {
  String storyTitle;
  String choice1;
  String choice2;
  int nextStory1;
  int nextStory2;

  Story({
    required this.storyTitle,
    required this.choice1,
    required this.choice2,
    required this.nextStory1,
    required this.nextStory2,
  });
}
