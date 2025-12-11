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




