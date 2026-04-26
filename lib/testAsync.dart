Future<void> main() async {

  print("Lay du lieu...");

  var kq = await taoOrder();

  print(kq);
}

taoOrder() async {

  var noidungOrder = await laythongtinOrderTuServer();

  return noidungOrder;
}

Future<String> laythongtinOrderTuServer() {

  Future<String> sNoiDungOrder = Future.delayed(
    Duration(seconds: 3),
    () => '1 nuoc chanh xa',
  );

  return sNoiDungOrder;
  //Lai vu learns the dart
}
