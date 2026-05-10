import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Gọi class MyApp thay vì viết trực tiếp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geeksforgeeks'),
        backgroundColor: Colors.greenAccent[400],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu',
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Center(
            child: Column(
              children: <Widget>[
                // Widget cố định chiều cao
                Container(
                  color: Colors.blue,
                  height: 100,
                  width: 200,
                  child: const Center(
                    child: Text(
                      'First widget',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Widget chiếm 1 phần không gian còn lại
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.redAccent,
                    width: 200,
                    child: const Center(
                      child: Text(
                        'Second widget (chiem 1 phan voi flex)',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Widget chiếm 3 phần không gian còn lại
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          color: Colors.amber,
                          width: 200,
                          child: const Center(
                            child: Text(
                              'Third widget (chiem 3 phan voi flexx)',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        color: Colors.black,
                        width: 200,

                        child: const Center(
                          child: Text(
                            'Third widget (chiem 3 phan voi flexx)',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      Flexible(
                        child: Container(
                          color: Colors.blue,
                          width: 200,
                          child: const Center(
                            child: Text(
                              'Third widget (chiem 3 phan voi flexx)',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                // Widget cố định chiều cao
                Container(
                  color: Colors.orange,
                  height: 100,
                  width: 200,
                  child: const Center(
                    child: Text(
                      'Fourth widget',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                SizedBox(
                  width: 200,
                  height: 200,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(5.0),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Colors.black.withAlpha(0),
                              Colors.black12,
                              Colors.black45,
                            ],
                          ),
                        ),
                        child: const Text(
                          'Foreground Text',
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                ),
                buildStack(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStack() {
    return Stack(
      clipBehavior: Clip.none, //Không cắt — con tràn ra ngoài vẫn hiển thị
      children: <Widget>[
        Container(width: 200, height: 100, color: Colors.red),
        Positioned(
          left: 20,
          right: 110,
          top: 30,
          bottom: 20,
          child: Container(color: Colors.green),
        ),
        Positioned(
          left: 110,
          right: 20,
          top: -30,
          bottom: 20,
          child: Container(color: Colors.yellow),
        ),
      ],
    );
  }
}
