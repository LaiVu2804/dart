class testWidget {
  int width;
  int height;
  String? sLabel;

  testWidget(this.sLabel, {required this.height, required this.width});
  testWidget.constructor2({this.sLabel, required this.height, required this.width});

  @override
  String toString() {
    return 'testWidget{width: $width, height: $height, sLabel: $sLabel}';
  }


}

void main(){
  testWidget test = testWidget("toyota",height: 100, width: 200);
  testWidget test1 = testWidget.constructor2(sLabel: "santafe",height: 100, width: 200);
  print(test);
  print(test1);
}