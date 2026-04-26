void nullSafety(String name, int? num) {
  if (num != null) {
    print('null safety !');
  } else {
    print("object");
  }
}

void bad(String? maybeString) {
  if (maybeString == null) {
    print("khong hop le");
  } else {
    print(maybeString.length);
  }

  List<String?> chuoi = ["TranDucVan", null, "LaiHoangVu"];
  List<String>? aNullableListOfString;

  print(chuoi);
  print(aNullableListOfString);
}

void main() {
  nullSafety("laiHoangvu", null);
  bad("laivu");
  print(bad);
}

// Toán tử bạn đang dùng:
// ?? → null-coalescing operator
// ?. → null-aware operator
void main1() {
  String? text; //biến text có thể null

  print(text ?? 'LaiHoangVu'); //Nếu text không null → dùng text
  //Nếu text null → dùng giá trị phía sau ('LaiHoangVu')

  print(text?.length ?? 0); //Neu text khac null lay length
  // neu text = null in ra 0
}
