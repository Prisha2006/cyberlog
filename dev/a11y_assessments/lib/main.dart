# Session 1#
  import 'package:flutter/material.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("If Lost, Contact"),
        ),
        body: const Center(
          child: Text(
            "Name: Prisha\nPhone: +91 99999 99999",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}


#Session 2#

  import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EvenOddChecker(),
    );
  }
}

class EvenOddChecker extends StatefulWidget {
  @override
  State<EvenOddChecker> createState() => _EvenOddCheckerState();
}

class _EvenOddCheckerState extends State<EvenOddChecker> {

  TextEditingController numberController = TextEditingController();


  String resultMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Even / Odd Checker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter a Number:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter any number",
              ),
            ),

            const SizedBox(height: 20),

            // Button
            ElevatedButton(
              onPressed: () {
                String input = numberController.text;
                int? number = int.tryParse(input);

                if (number == null) {
                  setState(() {
                    resultMessage = "Please enter a valid number!";
                  });
                  return;
                }

                // Conditional Logic
                if (number % 2 == 0) {
                  resultMessage = "The number $number is Even.";
                } else {
                  resultMessage = "The number $number is Odd.";
                }

                setState(() {}); // Update UI
              },
              child: const Text("Check Number"),
            ),

            const SizedBox(height: 25),

            // Output Text
            Text(
              resultMessage,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

#session 3#
  import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  

void main() {
  runApp(const MyApp());
}

class Log {
  String action;
  DateTime timestamp;
  String status;

  Log(this.action, this.timestamp, this.status);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Log> logs = [
      Log("User Logged In", DateTime.now(), "Success"),
      Log("Viewed Dashboard", DateTime.now().subtract(Duration(minutes: 5)), "Success"),
      Log("Failed Login Attempt", DateTime.now().subtract(Duration(hours: 1)), "Failed"),
      Log("Password Changed", DateTime.now().subtract(Duration(days: 1)), "Success"),
    ];

    final formatter = DateFormat("dd-MM-yyyy HH:mm");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("CyberLog"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: logs.map((log) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  "${log.action} — ${formatter.format(log.timestamp)}",
                  style: const TextStyle(fontSize: 18),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

#Session 4#
  import 'package:flutter/material.dart';

void main() {
  runApp(const CyberLogApp());
}

class CyberLogApp extends StatelessWidget {
  const CyberLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CyberLog Home'),
      ),

      body: Column(
        children: [

          // First Card
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            color: Colors.blue.shade100,
            child: const Text(
              'Log Activity',
              style: TextStyle(fontSize: 18),
            ),
          ),

          // Second Card
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            color: Colors.green.shade100,
            child: const Text(
              'View Logs',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

#session  5#
  import 'package:flutter/material.dart';

void main() {
  runApp(const CyberLogApp());
}

class CyberLogApp extends StatelessWidget {
  const CyberLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CyberLog Home'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Two-column GridView
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [


            dashboardCard('Daily Log', Colors.blue.shade200),
            dashboardCard('Cyber Tips', Colors.green.shade200),
            dashboardCard('Device Security', Colors.orange.shade200),
            dashboardCard('Notes', Colors.purple.shade200),
          ],
        ),
      ),
    );
  }

  Widget dashboardCard(String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

#Session 6#
  import 'package:flutter/material.dart';

void main() {
  runApp(const CyberLogApp());
}

class CyberLogApp extends StatelessWidget {
  const CyberLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CyberLogHome(),
    );
  }
}

class CyberLogHome extends StatefulWidget {
  const CyberLogHome({super.key});

  @override
  State<CyberLogHome> createState() => _CyberLogHomeState();
}

class _CyberLogHomeState extends State<CyberLogHome> {

  int currentIndex = 0;

  final List<Widget> screens = const [
    Center(child: Text('Home Screen')),
    Center(child: Text('Logs Screen')),
    Center(child: Text('Settings Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CyberLog'),
      ),

      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Logs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}


#Session 7#
  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LogProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class LogProvider extends ChangeNotifier {
  final List<String> _logs = [];

  List<String> get logs => _logs;

  void addLog(String log) {
    _logs.add(log);
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logProvider = context.watch<LogProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CyberLog'),
      ),
      body: logProvider.logs.isEmpty
          ? const Center(
              child: Text(
                'No Logs Yet',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: logProvider.logs.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.security),
                    title: Text(logProvider.logs[index]),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<LogProvider>()
              .addLog('Security check at ${DateTime.now()}');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


#session 8#
  import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const CyberLogApp());
}

class CyberLogApp extends StatelessWidget {
  const CyberLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String cyberTip = 'Loading cyber tip...';

  @override
  void initState() {
    super.initState();
    fetchCyberTip();
  }

  Future<void> fetchCyberTip() async {
    final response =
    await http.get(Uri.parse('https://api.adviceslip.com/advice'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        cyberTip = data['slip']['advice'];
      });
    } else {
      setState(() {
        cyberTip = 'Unable to fetch cyber tip';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CyberLog Dashboard'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // Cyber Tip Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Cyber Tip of the Day',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Tip Text
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                cyberTip,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
