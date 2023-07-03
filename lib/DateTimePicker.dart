import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  late TextEditingController _controller;

  double? _height;
  double? _width;

  String? _setTime, _setDate;

  String? _hour, _minute, _time;

  String? dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2015),
      lastDate: DateTime(2101)
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        if (_hour!.length == 1) {
          _hour = "0" + _hour!;
        }
        _minute = selectedTime.minute.toString();
        if (_minute!.length == 1) {
          _minute = "0" + _minute!;
        }
        _time = _hour! + ':' + _minute!;
        _timeController.text = _time!;
      });
    }
  }

  List activities = [];

  addItem() {
    List newactivities = activities;
    setState(() {
      newactivities.add(
        {
          "date": _dateController.text,
          "time": _timeController.text,
          "name": _controller.text,
        },
      );
      activities = newactivities;
      _controller.text = '';
    });
  }

  @override
  void initState() {

    super.initState();
    _controller = TextEditingController();
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    _timeController.text = DateFormat('HH:mm').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Application'),
      ),
      body: Container(
        width: _width,
        height: _height,
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    width: _width! / 1.7,
                    height: _height! / 9,
                    margin: const EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _dateController,
                      onSaved: (String? val) {
                        _setDate = val;
                      },
                      decoration: const InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.only(top: 0.0)),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: _width! / 1.7,
                    height: _height! / 9,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                      onSaved: (String? val) {
                        _setTime = val;
                      },
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _timeController,
                      decoration: const InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.all(5)),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child:             Column(
              children: <Widget>[
                TextField(
                   decoration: const InputDecoration(
                    hintText: 'Description',
                  contentPadding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: $black,
                      width: 1,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: $primary500,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: $primary500,
                      width: 1,
                    ),
                  ),
                ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                
          controller: _controller,
          onSubmitted: (String value) async {
          },
        ),
              ],
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: addItem, 
                child: const Text('Add'),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            Expanded(
              child: ListView(
                children: activities.map((activity){
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                    alignment: Alignment.center,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () => {}, 
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(Colors.black),
                              backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(217, 217, 217, 1)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                )
                              )
                            ),
                            child:  Text(
                              activity['date'] + " " + activity['time'],
                              selectionColor: Colors.white,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(6)),
                          Text(activity['name'])
                        ],
                      )
                    )
                  );
                }).toList(),
              )
            )
          ],
        ),
      ),
    );
  }
}


