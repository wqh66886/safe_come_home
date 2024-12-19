import 'package:flutter/material.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '404',
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '页面未找到',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/'); // 返回首页
              },
              child: const Text('返回首页'),
            ),
          ],
        ),
      ),
    );
  }
}
