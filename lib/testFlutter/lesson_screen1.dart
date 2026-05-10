import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrimeCheckScreen(),
    );
  }
}

class PrimeCheckScreen extends StatefulWidget {
  @override
  _PrimeCheckScreenState createState() => _PrimeCheckScreenState();
}

class _PrimeCheckScreenState extends State<PrimeCheckScreen> {
  final TextEditingController _controller = TextEditingController();

  //Bien luu tru ket qua hien thi
  String _result = "";

  // Hàm kiểm tra số nguyên tố
  bool isPrime(int n) {
    if (n < 2) return false;
    if (n == 2 || n == 3) return true;
    if (n % 2 == 0 || n % 3 == 0) return false;

    // Kiểm tra các số có dạng 6k +/- 1 để tối ưu hiệu năng
    for (int i = 5; i <= sqrt(n); i += 6) {
      if (n % i == 0 || n % (i + 2) == 0) return false;
    }
    return true;
  }

  void _checkNumber() {
    setState(() {
      String input = _controller.text;
      if (input.isEmpty) {
        _result = "vui long nhap mot so ";
        return;
      }

      int? number = int.tryParse(input);
      if (number == null) {
        _result = "gia tri nhap khong hop le";
      } else {
        if (isPrime(number)) {
          _result = "So $number vua nhap la so nguyen to";
        } else {
          _result = "So $number vua nhap ko phai la so nguyen to";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('kiem tra so nguyen to'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhap 1 so bat ky ',
                  hintText: 'vi du: 7 , 9 , 11 , ...',
                ),
              ),
              const SizedBox(height: 100),

              //nut kiem tra
              ElevatedButton(
                onPressed: _checkNumber,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 20,
                  ),
                ),
                child: const Text(
                  "Kiem tra",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),

              //Result
              Text(
                _result,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _result.contains("la so nguyen to")
                      ? Colors.green
                      : Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
