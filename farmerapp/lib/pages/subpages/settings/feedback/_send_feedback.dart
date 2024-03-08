import 'dart:convert';
import 'dart:io';

import 'package:farmerapp/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  late List<String> stateNames;
  Map<String, List<String>> districts = {};
  late String selectedStateName;
  late String selectedDistrict;
  String locality = '';
  String pincode = '';
  String feedback = '';

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
              .getTranslatedValue("send_feedback")
              .toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: DropdownButton<String>(
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
            ),
            const SizedBox(height: 16.0),
            Flexible(
              child: DropdownButton<String>(
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
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalization.of(context)
                    .getTranslatedValue("locality")
                    .toString(),
                hintText: AppLocalization.of(context)
                    .getTranslatedValue("e_locality")
                    .toString(),
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
              onChanged: (value) {
                setState(() {
                  locality = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalization.of(context)
                    .getTranslatedValue("pincode")
                    .toString(),
                hintText: AppLocalization.of(context)
                    .getTranslatedValue("e_pincode")
                    .toString(),
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              maxLines: 1,
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
              ],
              onChanged: (value) {
                setState(() {
                  pincode = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalization.of(context)
                    .getTranslatedValue("e_feedback")
                    .toString(),
                hintText: AppLocalization.of(context)
                    .getTranslatedValue("e_feedback")
                    .toString(),
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              onChanged: (value) {
                setState(() {
                  feedback = value;
                });
              },
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                showSubmittedPopup(context);
                print(AppLocalization.of(context)
                    .getTranslatedValue("e_feedback")
                    .toString());
                print(
                    'State: $selectedStateName, District: $selectedDistrict, Locality: $locality, Pin-Code: $pincode, Feedback: $feedback');
              },
              child: Text(
                AppLocalization.of(context)
                    .getTranslatedValue("submit")
                    .toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSubmittedPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Thank you for sending a feedback."),
          content: const Text(
              "We will try to resolve the issue as soon as possible and make our app better."),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
