import 'package:akilli_borsa/Controller/selectable_drop_down_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();

  List<String> items ;
  Function(String) onItemClick;
  DropDown({required this.items , required this.onItemClick});
}

class _DropDownState extends State<DropDown> {
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

class MultiSelectableDropDown extends StatefulWidget {
  final List<String> items;
  final Function(List<String>) onItemsSelected;

  MultiSelectableDropDown({required this.items, required this.onItemsSelected });

  @override
  _MultiSelectableDropDownState createState() => _MultiSelectableDropDownState();
}
class _MultiSelectableDropDownState extends State<MultiSelectableDropDown> {
  List<String> selectedItems = [];
  SelectableDropDownController selectableDropDownController = Get.find();



  void _showMultiSelectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(

            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Araç seçiniz', style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final value = widget.items[index];
                      final isSelected = selectedItems.contains(value);
                      return InkWell(
                        onTap: () {

                            if (isSelected) {
                              selectableDropDownController.selectItem(value);
                              selectedItems.remove(value);
                            } else {
                              selectableDropDownController.selectItem(value);
                              selectedItems.add(value);
                            }

                          Get.back();
                          _showMultiSelectDialog();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              isSelected
                                  ? Icon(Icons.check_box, color: Colors.blueAccent)
                                  : Icon(Icons.check_box_outline_blank, color: Colors.blueAccent),
                              SizedBox(width: 10),
                              Text(
                                value,
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Done'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 45,
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
      child: GestureDetector(
        onTap: _showMultiSelectDialog,
        child:  const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Araçlarım",
            ),
            Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}



