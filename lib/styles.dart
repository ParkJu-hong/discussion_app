import 'package:flutter/material.dart';

// Primary Colors
const Color primaryColor = Color(0xFF0055FF); // 주 파란색
const Color buttonColor = Color(0xFFE8F1FF); // 밝은 파란색

// Grayscale Colors
const Color backgroundColor = Color(0xFFF2F4F6); // 연한 회색
const Color mediumGray = Color(0xFFA6A6A6); // 중간 회색 (비활성)
const Color importantText = Color(0xFF222222); // 진한 회색 (텍스트)

const Color secondaryTextColor = Color(0xFF666666); // 보조 텍스트
const Color disabledTextColor = mediumGray; // 비활성 텍스트 색상
const Color borderColor = Color(0xFFE0E0E0);         // 경계 색상

/*
  primaryColor: 주요 버튼 (ElevatedButton), 강조된 상호작용 요소의 배경.
  lightBlue: 앱의 배경 또는 카드 배경으로 사용하여 요소 간 차이를 두는 데 적합.
  lightGray: 배경 또는 컴포넌트 내부 패딩, 비활성 카드의 배경.
  mediumGray: 입력 필드의 플레이스홀더, 비활성화된 버튼 텍스트.
  darkGray: 주요 텍스트, 타이틀, 중요한 정보를 전달할 때 사용.
  secondaryTextColor: 부가적인 설명 텍스트.
  disabledTextColor: 비활성 상태의 텍스트.
  borderColor: 입력 필드, 카드 경계 등 컴포넌트의 테두리.
*/

/*
  카드 컴포넌트와 입력 필드의 테두리 설정

  Container(
  decoration: BoxDecoration(
    color: lightGray,  // 카드 배경색
    borderRadius: BorderRadius.circular(16),  // 컨테이너 모서리 둥글게 설정
    border: Border.all(
      color: borderColor,
      width: 1,
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text('Card Content'),
  ),
);

*/

/*
  애니메이션

  Fade In / Fade Out: 컴포넌트가 부드럽게 나타나거나 사라지도록 설정할 수 있습니다.

  AnimatedOpacity(
  opacity: 1.0,  // 나타날 때 1.0, 사라질 때 0.0
  duration: Duration(milliseconds: 300),
  curve: Curves.easeInOut,  // 부드러운 전환 효과
  child: Text('Fade In/Out Example'),
  );

  Slide Animation: 컴포넌트가 특정 방향에서 슬라이드되어 나타나는 효과를 구현합니다.

  SlideTransition(
    position: Tween<Offset>(
      begin: Offset(0, 1),  // 하단에서 시작
      end: Offset(0, 0),    // 위치로 슬라이드
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,  // 부드러운 가속 효과
      ),
    ),
    child: Container(
      color: primaryColor,
      child: Text('Slide In Example'),
    ),
  );

  버튼/카드 상호작용 애니메이션 (Press Effect)
  Press Effect: 버튼을 누를 때 살짝 작아지며 (scale) 피드백을 제공합니다.

  GestureDetector(
    onTapDown: (_) => setState(() => scale = 0.95),  // 버튼 누를 때 줄어듦
    onTapUp: (_) => setState(() => scale = 1.0),     // 버튼에서 손을 뗄 때 원래 크기
    child: AnimatedScale(
      scale: scale,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeOut,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Text(
          'Press Effect Button',
          style: TextStyle(color: buttonTextColor),
        ),
      ),
    ),
  );


  리스트 아이템 등장 (Staggered Animation)
  Staggered Animation: 리스트 아이템이 순차적으로 등장하게 하는 효과입니다.

  ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return TweenAnimationBuilder(
        duration: Duration(milliseconds: 300 + (index * 50)),  // 순차적으로 등장
        tween: Tween<double>(begin: 0, end: 1),
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 50 * (1 - value)),
              child: child,
            ),
          );
        },
        child: ListTile(
          title: Text(items[index]),
        ),
      );
    },
  );


*/

/*
  dart file's name

  회원가입 및 로그인 선택 화면: auth_selection_screen.dart
  회원가입 화면: signup_screen.dart
  홈 화면: home_screen.dart
  토론 상세화면: discussion_detail_screen.dart
  투표 화면: vote_screen.dart
  타임라인 및 토론 흐름 정리: timeline_overview_screen.dart
  토론 요약화면: discussion_summary_screen.dart
  참여 성과 및 보상 화면: participation_rewards_screen.dart
  AI 토론 화면: ai_discussion_screen.dart
  내 정보: profile_screen.dart
  환경설정: settings_screen.dart
*/
