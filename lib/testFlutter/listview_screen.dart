import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  // 1. Khai báo biến ở đây để giữ giá trị khi Rebuild
  List<String> entries = <String>['A', 'B', 'C'];
  List<int> colorCodes = <int>[600, 400, 200];
  int countAddItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List View Screen')),
      body: SafeArea(
        child: Column(
          children: [
            listViewScreen1(),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      countAddItem++;
                      // Thêm vào danh sách của class
                      entries.add("Mới $countAddItem");
                      colorCodes.add(100);
                    });
                  },
                  child: Text('Add phan tu'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (entries.isNotEmpty) {
                        entries.removeLast();
                        colorCodes.removeLast();
                      }
                    });
                  },
                  child: Text('Remove phan tu'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Screen'),
            ),
          ],
        ),
      ),
    );
  }

  Widget listViewScreen1() {
    return Container(
      height: 300,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Item ${entries[index]}')));
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 2),
              color: Colors.green[colorCodes[index] % 900],
              child: Center(child: Text('Entry ${entries[index]}')),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
