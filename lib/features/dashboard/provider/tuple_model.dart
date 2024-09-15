class CustomTuple3 {
  final double item1;
  final double item2;
  final double item3;

  CustomTuple3(this.item1, this.item2, this.item3);

  @override
  String toString() {
    return "temp : $item1 battery : $item2 signal : $item3";
  }
}

class CustomQuadruple4 {
  final String item1;
  final double item2;
  final double item3;
  final double item4;

  CustomQuadruple4(this.item1, this.item2, this.item3, this.item4);

  @override
  String toString() {
    return "name : $item1 temp : $item2 battery : $item3 signal : $item4";
  }
}
