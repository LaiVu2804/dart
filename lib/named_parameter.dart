//Tu khoa required , rang buoc --> no bat phai nhap du lieu(dung trong ngoac nhon)
void printName(
  String firstName,
  String lastName, {
  required String? middleName,
}) {
  print('$firstName $middleName $lastName');
}

//optional parameter
int sumUpToFive(int a, [int? b = 2, int c = 3, int d = 4, int e = 5]) {
  return (a + (b ?? 10) + c + d + e);
}

void main() {
  printName("Lai", "Vu", middleName: "Hoang");
  int sum = sumUpToFive(1,null,10,10,10); //Truyen gia tri vao day => bi ghi de
  print(sum);
}
