import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentTab = 0;

  void changeTab(int index) {
    setState(() {
      currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F4F8),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D2F7E),
        title: Text(
          currentTab == 0
              ? 'Home'
              : currentTab == 1
                  ? 'Attendance'
                  : 'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: currentTab == 0
          ? HomeTab()
          : currentTab == 1
              ? AttendanceTab()
              : ProfileTab(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: changeTab,
        selectedItemColor: Color(0xFF2D2F7E),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Attendance'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int tasksDone = 2;
  int totalTasks = 6;

  void markTaskDone() {
    setState(() {
      if (tasksDone < totalTasks) {
        tasksDone++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6),
          Text(
            'Welcome back, Vikas 👋',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'B.Tech CSE — Semester 4',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),

          SizedBox(height: 22),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF2D2F7E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tasks Completed',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                SizedBox(height: 8),
                Text(
                  '$tasksDone / $totalTasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 14),
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: tasksDone / totalTasks,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: markTaskDone,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF2D2F7E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Mark One Done',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 26),

          Text(
            'Quick Stats',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: InfoBox(
                  title: 'CGPA',
                  value: '8.6',
                  color: Color(0xFFE8F0FE),
                  valueColor: Color(0xFF2D2F7E),
                ),
              ),
              SizedBox(width: 14),
              Expanded(
                child: InfoBox(
                  title: 'Attendance',
                  value: '83%',
                  color: Color(0xFFE8F5E9),
                  valueColor: Colors.green,
                ),
              ),
            ],
          ),

          SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: InfoBox(
                  title: 'Assignments',
                  value: '3 left',
                  color: Color(0xFFFFF3E0),
                  valueColor: Colors.orange,
                ),
              ),
              SizedBox(width: 14),
              Expanded(
                child: InfoBox(
                  title: 'Rank',
                  value: '#12',
                  color: Color(0xFFFCE4EC),
                  valueColor: Colors.pink,
                ),
              ),
            ],
          ),

          SizedBox(height: 26),

          Text(
            "Today's Classes",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 14),

          ClassRow(subject: 'Data Structures', time: '9:00 AM', room: '2F02'),
          SizedBox(height: 10),
          ClassRow(subject: 'Computer Networks', time: '11:30 AM', room: '2FBB2'),
          SizedBox(height: 10),
          ClassRow(subject: 'OS Lab', time: '2:00 PM', room: 'Lab-2'),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final Color valueColor;

  InfoBox({
    required this.title,
    required this.value,
    required this.color,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class ClassRow extends StatelessWidget {
  final String subject;
  final String time;
  final String room;

  ClassRow({required this.subject, required this.time, required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 44,
            decoration: BoxDecoration(
              color: Color(0xFF2D2F7E),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 3),
              Text(
                '$time  •  $room',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AttendanceTab extends StatefulWidget {
  @override
  _AttendanceTabState createState() => _AttendanceTabState();
}

class _AttendanceTabState extends State<AttendanceTab> {
  int present = 34;
  int absent = 6;

  void addPresent() {
    setState(() {
      present++;
    });
  }

  void addAbsent() {
    setState(() {
      absent++;
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = present + absent;
    int percentage = ((present / total) * 100).round();
    bool isSafe = percentage >= 75;

    return SingleChildScrollView(
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6),

          Center(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: isSafe ? Color(0xFF2E7D32) : Color(0xFFC62828),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Text(
                    '$percentage%',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    isSafe ? 'You are safe ✅' : 'Attendance low ⚠️',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '$present classes attended out of $total',
                    style: TextStyle(fontSize: 13, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$present',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text('Present', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 14),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$absent',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text('Absent', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: addPresent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    '+ Present',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 14),
              Expanded(
                child: ElevatedButton(
                  onPressed: addAbsent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    '+ Absent',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 28),

          Text(
            'Subject-wise Attendance',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 14),

          SubjectAttRow(subject: 'Data Structures', percent: 90),
          SizedBox(height: 10),
          SubjectAttRow(subject: 'Computer Networks', percent: 78),
          SizedBox(height: 10),
          SubjectAttRow(subject: 'OS Lab', percent: 65),
          SizedBox(height: 10),
          SubjectAttRow(subject: 'DBMS', percent: 82),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class SubjectAttRow extends StatelessWidget {
  final String subject;
  final int percent;

  SubjectAttRow({required this.subject, required this.percent});

  @override
  Widget build(BuildContext context) {
    Color barColor = percent >= 75 ? Colors.green : Colors.red;

    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subject, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                '$percent%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: barColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percent / 100,
              child: Container(
                decoration: BoxDecoration(
                  color: barColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          SizedBox(height: 16),
          CircleAvatar(
            radius: 48,
            backgroundColor: Color(0xFF2D2F7E),
            child: Text(
              'VT',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 14),
          Text(
            'Vikas Tiwari',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'Roll No: 2024cs214',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          SizedBox(height: 28),
          ProfileField(label: 'Branch', value: 'Computer Science & Engineering'),
          SizedBox(height: 12),
          ProfileField(label: 'Semester', value: '4th Semester'),
          SizedBox(height: 12),
          ProfileField(label: 'CGPA', value: '8.6 / 10'),
          SizedBox(height: 12),
          ProfileField(label: 'Email', value: 'vikas22@college.edu'),
          SizedBox(height: 12),
          ProfileField(label: 'Phone', value: '+91 7307532065'),
          SizedBox(height: 12),
          ProfileField(label: 'Batch', value: '2024 - 2028'),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final String value;

  ProfileField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}