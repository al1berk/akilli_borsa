import 'package:flutter/material.dart';

class SpinnerExample extends StatefulWidget {
  @override
  _SpinnerExampleState createState() => _SpinnerExampleState();

  List<String> items ;
  Function(String) onItemClick;
  SpinnerExample({required this.items , required this.onItemClick});
}

class _SpinnerExampleState extends State<SpinnerExample> {
  String? selectedItem;
  int index = 0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedItem = widget.items[0];
  }






  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
     // boyutunu ayarla
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF088395), width: 2),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFEBF4F6).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButton<String>(

        value: selectedItem,
        hint: Text(
          selectedItem!,
          style: TextStyle(color: Colors.black54),
        ),
        isExpanded: true,
        underline: SizedBox(), // Alt çizgi kaldırıldı
        onChanged: (String? newValue) {
          setState(() {
            selectedItem = newValue;
            index = widget.items.indexOf(newValue!);
            widget.onItemClick(index.toString());
          });
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.blueAccent),
            ),
          );
        }).toList(),
        dropdownColor: Colors.white,
        icon: Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
      ),
    );
  }
}