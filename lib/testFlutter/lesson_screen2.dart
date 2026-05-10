import 'dart:math';
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
      home: ColorToggleScreen(),
    );
  }
}

class ColorToggleScreen extends StatefulWidget {
  @override
  _ColorToggleScreenState createState() => _ColorToggleScreenState();
}

class _ColorToggleScreenState extends State<ColorToggleScreen> {
  // 1: tao mang chua danh sach cac mau
  final List<Color> _colorList = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.white,
    Colors.purple,
    Colors.pink,
    Colors.orange,
    Colors.grey,
  ];

  int _counter = 0;
  Color _backgroundColor = Colors.white;

  void _handleButtonPress() {
    setState(() {
      _counter++; //tang bien dem len 1

      if (_counter % 2 == 0) {
        _backgroundColor = _colorList[Random().nextInt(_colorList.length)];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Gan mau nen cho Scaffold
      backgroundColor: _backgroundColor,
      appBar: AppBar(title: const Text('Color App'), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bien dem: $_counter',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 20),
              //3. nut bam ElevatedButton nam giua man hinh
              ElevatedButton(
                onPressed: _handleButtonPress,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'Nhan de tang bien dem',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _counter % 2 == 0
                    ? "Số chẵn: Đã đổi màu!"
                    : "Số lẻ: Giữ nguyên màu.",
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
