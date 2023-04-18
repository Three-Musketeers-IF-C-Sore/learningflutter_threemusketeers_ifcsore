import 'package:flutter/material.dart';
import 'mikroskil_page.dart';
import 'package:learningflutter_threemusketeers_ifcsore/setting_page.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';

class Box extends StatefulWidget {
  @override
  _BoxState createState() => _BoxState();
}

List<String> list1 = ['Informatika', 'Bisnis'];
List<String> list2 = [
  'S2 Teknologi Informasi',
  'S1 Teknis Informatika',
  'S1 Sistem Informasi',
  'S1 Teknologi Informasi'
];
List<String> list3 = ['S1 Manajemen', 'S1 Akuntansi'];

class _BoxState extends State<Box> {
  String? dropdownValueOne = list1.first;
  String? dropdownValueTwo = list2.first;
  String? dropdownValueThree = list3.first;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        child: Column(
          children: [
            Row(children: [
              const Expanded(
                flex: 8,
                child: Text('Fakultas'),
              ),
              Expanded(
                flex: 4,
                child: DropdownButton<String>(
                  value: dropdownValueOne,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValueOne = value!;
                      dropdownValueTwo =
                          list2.first; // Reset the value of dropdownValueTwo
                    });
                  },
                  items: list1.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ]),
            const Divider(),
            Row(children: [
              const Expanded(
                flex: 8,
                child: Text('Jurusan'),
              ),
              Expanded(
                flex: 4,
                child: dropdownValueOne == 'Informatika'
                    ? DropDownButtonTwo(
                        dropdownValue: dropdownValueTwo,
                        dropDownCallBack: (String? value) {
                          setState(() {
                            dropdownValueTwo = value!;
                          });
                        },
                      )
                    : DropDownButtonThree(
                        dropdownValue: dropdownValueThree,
                        dropDownCallBack: (String? value) {
                          setState(() {
                            dropdownValueThree = value!;
                          });
                        },
                      ),
              ),
            ]),
            const Divider(),
            Row(
              children: [const Text('S2 Teknologi Informasi')],
            )
          ],
        ),
      ),
    );
  }
}

class DropDownButtonTwo extends StatefulWidget {
  final String? dropdownValue;
  final Function(String?) dropDownCallBack;

  const DropDownButtonTwo({
    required this.dropdownValue,
    required this.dropDownCallBack,
    Key? key,
  });

  @override
  State<DropDownButtonTwo> createState() => _DropDownButtonTwoState();
}

class _DropDownButtonTwoState extends State<DropDownButtonTwo> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      onChanged: widget.dropDownCallBack,
      items: list2.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class DropDownButtonThree extends StatefulWidget {
  final String? dropdownValue;
  final Function(String?) dropDownCallBack;

  const DropDownButtonThree({
    required this.dropdownValue,
    required this.dropDownCallBack,
    Key? key,
  });

  @override
  State<DropDownButtonThree> createState() => _DropDownButtonThreeState();
}

class _DropDownButtonThreeState extends State<DropDownButtonThree> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      onChanged: widget.dropDownCallBack,
      items: list3.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
