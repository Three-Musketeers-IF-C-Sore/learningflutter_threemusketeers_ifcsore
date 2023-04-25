import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/providers/setting_provider.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';
import 'package:provider/provider.dart';

class Box extends StatefulWidget {
  @override
  _BoxState createState() => _BoxState();
}

List<String> list1 = ['Informatika', 'Bisnis'];
List<String> list2 = [
  'S2 Teknologi Informasi',
  'S1 Teknik Informatika',
  'S1 Sistem Informasi',
  'S1 Teknologi Informasi'
];
List<String> list3 = ['S1 Manajemen', 'S1 Akuntansi'];

String _getMappedValue1(String? value) {
  switch (value) {
    case 'S2 Teknologi Informasi':
      return 'Kumpulan kajian atau ranah topik yang merencanakan, menganalisis, merancang, menentukan, memilih dan menerapkan teknologi informasi yang paling sesuai untuk mengoptimalkan layanan bisnis bagi organisasi, instansi dan perusahaan melalui inovasi tanpa henti.';
    case 'S1 Teknik Informatika':
      return 'Kumpulan ilmu dan teknik di bidang komputer yang diterapkan untuk menghasilkan solusi perangkat lunak yang sesuai terhadap permasalahan bisnis dan ilmiah.';
    case 'S1 Sistem Informasi':
      return 'Technology-Enabled Business Development: Kombinasi dari "aspek teknis" dan "aspek manajerial" untuk menerjemahkan "kebutuhan bisnis" menjadi "kebutuhan teknis" teknologi informasi.';
    case 'S1 Teknologi Informasi':
      return 'Mempersiapkan mahasiswa agar memiliki keahlian dan keterampilan di bidang teknologi digital untuk mendukung pengembangan bisnis';
    default:
      return ''; // Return an empty string for unknown values or null values
  }
}

String _getMappedValue2(String? value) {
  switch (value) {
    case 'S1 Manajemen':
      return 'Menghasilkan lulusan berkualitas yang memiliki ilmu pengetahuan dan keterampilan Manajemen, serta menguasai teknologi informasi dalam pengelolaan bisnis yang relevan dengan kebutuhan masyarakat.';
    case 'S1 Akuntansi':
      return 'Menghasilkan SDM profesional dan unggul di bidang akuntansi berbasis teknologi informasi dalam berbagai bidang profesi akuntansi.';
    default:
      return ''; // Return an empty string for unknown values or null values
  }
}

class _BoxState extends State<Box> {
  String? dropdownValueOne = list1.first;
  String? dropdownValueTwo = list2.first;
  String? dropdownValueThree = list3.first;

  final ThemeData _dark =
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.white);
  final ThemeData _light =
      ThemeData(brightness: Brightness.light, primaryColor: Colors.black);

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<SettingProvider>(context);
    ThemeData currentTheme =
        setting.isDarkMode && !setting.isReadMode ? _dark : _light;
    Color isReadModebackgroundColor = setting.isReadMode
        ? Color.fromRGBO(244, 198, 156, 100)
        : currentTheme.scaffoldBackgroundColor;

    Color isDarkModebackgroundColor = setting.isDarkMode
        ? Color.fromRGBO(22, 1, 60, 100)
        : currentTheme.scaffoldBackgroundColor;

    Color isReadModeColor = setting.isReadMode ? Colors.black : Colors.white;

    Color cardColor = setting.isReadMode
        ? isReadModebackgroundColor
        : setting.isDarkMode
            ? isDarkModebackgroundColor
            : $primary500;

    return Center(
      child: Card(
        color: cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: cardColor,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    'Fakultas',
                    style: TextStyle(
                      color: isReadModeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: DropdownButton<String>(
                    dropdownColor: cardColor,
                    value: dropdownValueOne,
                    icon: Icon(
                      Icons.arrow_downward,
                      color: isReadModeColor,
                    ),
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
                        child: Text(
                          value,
                          style: TextStyle(
                            color: isReadModeColor,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ]),
              const Divider(),
              Row(children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    'Jurusan',
                    style: TextStyle(
                      color: isReadModeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
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
              Align(
                alignment: Alignment.center,
                child: Text(
                  dropdownValueOne == 'Informatika'
                      ? '$dropdownValueTwo'
                      : '$dropdownValueThree',
                  style: $heading6Bold.copyWith(color: isReadModeColor),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                        dropdownValueOne == 'Informatika'
                            ? _getMappedValue1(dropdownValueTwo)
                            : _getMappedValue2(
                                dropdownValueThree), // Display the selected value in dropdownValueFour for 'Informatika' option, otherwise display an empty string
                        style: $body1Regular.copyWith(
                            color:
                                isReadModeColor) // Customize the font size as needed
                        ),
                  ),
                ],
              ),
            ],
          ),
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
    Color? color,
  });

  @override
  State<DropDownButtonTwo> createState() => _DropDownButtonTwoState();
}

class _DropDownButtonTwoState extends State<DropDownButtonTwo> {
  final ThemeData _dark =
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.white);
  final ThemeData _light =
      ThemeData(brightness: Brightness.light, primaryColor: Colors.black);

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<SettingProvider>(context);

    ThemeData currentTheme =
        setting.isDarkMode && !setting.isReadMode ? _dark : _light;
    Color isReadModebackgroundColor = setting.isReadMode
        ? Color.fromRGBO(244, 198, 156, 100)
        : currentTheme.scaffoldBackgroundColor;

    Color isDarkModebackgroundColor = setting.isDarkMode
        ? Color.fromRGBO(22, 1, 60, 100)
        : currentTheme.scaffoldBackgroundColor;
    Color isReadModeColor = setting.isReadMode ? Colors.black : Colors.white;
    Color cardColor = setting.isReadMode
        ? isReadModebackgroundColor
        : setting.isDarkMode
            ? isDarkModebackgroundColor
            : $primary500;

    return DropdownButton<String>(
      value: widget.dropdownValue,
      dropdownColor: cardColor,
      icon: Icon(Icons.arrow_downward, color: isReadModeColor),
      elevation: 16,
      onChanged: widget.dropDownCallBack,
      items: list2.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              color: isReadModeColor,
            ),
          ),
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
    Color? color,
  });

  @override
  State<DropDownButtonThree> createState() => _DropDownButtonThreeState();
}

class _DropDownButtonThreeState extends State<DropDownButtonThree> {
  final ThemeData _dark =
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.white);
  final ThemeData _light =
      ThemeData(brightness: Brightness.light, primaryColor: Colors.black);

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<SettingProvider>(context);

    ThemeData currentTheme =
        setting.isDarkMode && !setting.isReadMode ? _dark : _light;
    Color isReadModebackgroundColor = setting.isReadMode
        ? Color.fromRGBO(244, 198, 156, 100)
        : currentTheme.scaffoldBackgroundColor;

    Color isDarkModebackgroundColor = setting.isDarkMode
        ? Color.fromRGBO(22, 1, 60, 100)
        : currentTheme.scaffoldBackgroundColor;
    Color isReadModeColor = setting.isReadMode ? Colors.black : Colors.white;
    Color cardColor = setting.isReadMode
        ? isReadModebackgroundColor
        : setting.isDarkMode
            ? isDarkModebackgroundColor
            : $primary500;

    return DropdownButton<String>(
      value: widget.dropdownValue,
      dropdownColor: cardColor,
      icon: Icon(Icons.arrow_downward, color: isReadModeColor),
      elevation: 16,
      onChanged: widget.dropDownCallBack,
      style: TextStyle(color: isReadModeColor),
      items: list3.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              color: isReadModeColor, // Set the desired text color
            ),
          ),
        );
      }).toList(),
    );
  }
}

class DropDownButtonFour extends StatefulWidget {
  final String? dropdownValue;
  final Function(String?) dropDownCallBack;

  const DropDownButtonFour({
    required this.dropdownValue,
    required this.dropDownCallBack,
    Key? key,
  });

  @override
  State<DropDownButtonFour> createState() => _DropDownButtonFourState();
}

class _DropDownButtonFourState extends State<DropDownButtonFour> {
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

class DropDownButtonFive extends StatefulWidget {
  final String? dropdownValue;
  final Function(String?) dropDownCallBack;

  const DropDownButtonFive({
    required this.dropdownValue,
    required this.dropDownCallBack,
    Key? key,
  });

  @override
  State<DropDownButtonFive> createState() => _DropDownButtonFiveState();
}

class _DropDownButtonFiveState extends State<DropDownButtonFive> {
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
