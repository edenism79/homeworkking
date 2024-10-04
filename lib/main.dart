import 'package:flutter/material.dart';
import 'package:homeworkking2/alarmscreen.dart';
import 'package:homeworkking2/albumscreen.dart';
import 'package:homeworkking2/attendancescreen.dart';
import 'package:homeworkking2/endtrialscreen.dart';
import 'package:homeworkking2/homeagreementscreen.dart';
import 'package:homeworkking2/medicinerequestscreen.dart';
import 'package:homeworkking2/menuscreen.dart';
import 'package:homeworkking2/noticescreen.dart';
import 'package:homeworkking2/registerscreen.dart';
import 'package:homeworkking2/schedulescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '생각하는 황소 - 수학학원',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('생각하는 황소 - 수학학원'),
      ),
      body: Column(
        children: [
          // 상단 이미지
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/top_banner.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 선생님 정보 및 메뉴
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/icons/teacher_image.png'),
            ),
            title: Text('남상이 교사'),
            subtitle: Text('1타임 (2~4시)'),
          ),
          // 메뉴 버튼들
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            children: [
              _buildMenuItem(
                  context, '알림장', 'assets/icons/alarm.png', AlarmScreen()),
              _buildMenuItem(
                  context, '공지사항', 'assets/icons/notice.png', NoticeScreen()),
              _buildMenuItem(
                  context, '앨범', 'assets/icons/album.png', AlbumScreen()),
              _buildMenuItem(context, '일정표', 'assets/icons/calendar.png',
                  ScheduleScreen()),
              _buildMenuItem(
                  context, '식단표', 'assets/icons/menu.png', MenuScreen()),
              _buildMenuItem(context, '투약의뢰서', 'assets/icons/medicine.png',
                  MedicineRequestScreen()),
              _buildMenuItem(context, '귀가동의서', 'assets/icons/home.png',
                  HomeAgreementScreen()),
              _buildMenuItem(context, '출석부', 'assets/icons/attendance.png',
                  AttendanceScreen()),
            ],
          ),
          // 체험종료, 회원가입 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EndTrialScreen()));
                },
                child: Text('체험종료'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
                child: Text('회원가입'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String title, String iconPath, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Column(
        children: [
          Image.asset(iconPath, width: 50, height: 50),
          Text(title),
        ],
      ),
    );
  }
}
