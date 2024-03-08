import 'dart:convert';

import 'package:farmerapp/localization/app_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'helper/edit_item.dart';
import 'helper/edit_item2.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  TextEditingController noteTextController = TextEditingController();
  TextEditingController alternateContactController = TextEditingController();
  late List<String> stateNames;
  Map<String, List<String>> districts = {};
  late String selectedStateName;
  late String selectedDistrict;
  String name = '';
  String alternateContact = '';

  String gender = "Male";
  List<String> genderOptions = [
    'Male',
    'Female',
    'Prefer not to say',
    'Others'
  ];

  DateTime selectedDOB = DateTime.now();

  Future<void> _selectDate(
    BuildContext context,
    DateTime selectedDate,
    ValueChanged<DateTime> onDateChanged,
  ) async {
    final DateTime? picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    ));

    if (picked != selectedDate) {
      if (picked == null) {
        onDateChanged(selectedDOB);
      } else {
        onDateChanged(picked);
      }
    }
  }

  Widget _buildDropdownRow({
    required String label,
    required String value,
    required ValueChanged<String?> onChanged,
    required List<String> items,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black54),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black54),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePickerRow({
    required DateTime selectedDate,
    required ValueChanged<DateTime> onDateChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${"${selectedDate.toLocal()}".split(' ')[0].split('-')[2]}-${"${selectedDate.toLocal()}".split(' ')[0].split('-')[1]}-${"${selectedDate.toLocal()}".split(' ')[0].split('-')[0]}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Date color
            ),
          ),
          GestureDetector(
            onTap: () => _selectDate(context, selectedDate, onDateChanged),
            child: const Icon(
              Icons.calendar_today,
              size: 24,
              color: Colors.black54, // Calendar icon color
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    selectedStateName = '';
    selectedDistrict = '';
    stateNames = [];
    _loadStatesAndDistricts();
  }

  Future<void> _loadStatesAndDistricts() async {
    final String data =
        await rootBundle.loadString('assets/state_district.json');
    final Map<String, dynamic> statesData = json.decode(data);

    statesData.forEach((key, value) {
      stateNames.add(value['name']);
      districts[value['name']] = List<String>.from(value['districts']);
    });

    setState(() {
      selectedStateName = stateNames.isNotEmpty ? stateNames[0] : '';
      selectedDistrict = districts[selectedStateName]!.isNotEmpty
          ? districts[selectedStateName]![0]
          : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 60,
        title: Text(
          AppLocalization.of(context)
              .getTranslatedValue("change_account")
              .toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                print(
                    'Name: $name, Gender: $gender, DOB: $selectedDOB, Alternate Contact: $alternateContact, State: $selectedStateName, District: $selectedDistrict');
              },
              style: IconButton.styleFrom(
                // backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fixedSize: Size(30, 25),
                elevation: 3,
              ),
              icon:
                  const Icon(Ionicons.checkmark, color: Colors.black, size: 30),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditItem(
                title: AppLocalization.of(context)
                    .getTranslatedValue("name")
                    .toString(),
                widget: TextField(
                  controller: noteTextController,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 40),
              EditItem(
                title: AppLocalization.of(context)
                    .getTranslatedValue("gender")
                    .toString(),
                widget: DropdownButton<String>(
                  value: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                  items: genderOptions.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 40),
              EditItem(
                widget: _buildDatePickerRow(
                    selectedDate: selectedDOB,
                    onDateChanged: (date) {
                      setState(() {
                        selectedDOB = date;
                      });
                    }),
                title: AppLocalization.of(context)
                    .getTranslatedValue("dob")
                    .toString(),
              ),
              const SizedBox(height: 40),
              EditItem2(
                widget: TextFormField(
                  controller: alternateContactController,
                  onChanged: (value) {
                    setState(() {
                      alternateContact = value;
                    });
                  },
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    prefix: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '(+91)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    labelText: AppLocalization.of(context)
                        .getTranslatedValue("alternate_contact")
                        .toString(),
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54, // Label color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("state")
                    .toString(),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              DropdownButton<String>(
                underline: Container(),
                isExpanded: true,
                value: selectedStateName,
                onChanged: (value) {
                  setState(() {
                    selectedStateName = value!;
                    selectedDistrict = districts[value]!.isNotEmpty
                        ? districts[value]![0]
                        : '';
                  });
                },
                items: stateNames.map((option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("district")
                    .toString(),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              DropdownButton<String>(
                underline: Container(),
                isExpanded: true,
                value: selectedDistrict,
                onChanged: (value) {
                  setState(() {
                    selectedDistrict = value!;
                  });
                },
                items: districts[selectedStateName]?.map((district) {
                      return DropdownMenuItem<String>(
                        value: district,
                        child: Text(district),
                      );
                    }).toList() ??
                    [],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
