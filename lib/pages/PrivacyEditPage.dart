import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;

class PrivacyEditPage extends StatelessWidget {
  const PrivacyEditPage({super.key, required this.userToken});

  final String userToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const PrivacyEditBack(),
                PrivacyEditInput(userToken: userToken)
              ]
            )
          )
        )
      )
    );
  }
}

class PrivacyEditBack extends StatelessWidget {
  const PrivacyEditBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text("뒤로 가기",
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),
          )
        )
      ],
    );
  }
}

class PrivacyEditInput extends StatelessWidget {
  PrivacyEditInput({super.key, required this.userToken});

  final String userToken;

  final inputBloodController = TextEditingController();
  final inputDiseaseController = TextEditingController();
  final inputIDController = TextEditingController();
  final inputMedicineController = TextEditingController();
  final inputNameController = TextEditingController();

  void sendData(BuildContext context) async {
    final response = await http.get(
        Uri.parse(FlutterConfig.get("API_URL") + "/users/getUserInfo"),
        headers: {
          'Authorization': 'Bearer $userToken'
        }
    );

    var responseData = jsonDecode(response.body)["result"];
    print(responseData.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: const Color(0xFFF5F5F5),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("성함",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextField(
                    controller: inputNameController,
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  )
                ]
              ),
            )
          )
        ),
        Card(
          color: const Color(0xFFF5F5F5),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("주민등록번호",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextField(
                    controller: inputIDController,
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  )
                ]
              ),
            )
          )
        ),
        Card(
          color: const Color(0xFFF5F5F5),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("혈액형",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextField(
                    controller: inputBloodController,
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  )
                ]
              ),
            )
          )
        ),
        Card(
          color: const Color(0xFFF5F5F5),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("지병",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextField(
                    controller: inputDiseaseController,
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  )
                ]
              ),
            )
          )
        ),
        Card(
          color: const Color(0xFFF5F5F5),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("복용중인 약",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextField(
                    controller: inputMedicineController,
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  )
                ]
              ),
            )
          )
        ),
        Card(
          color: const Color(0xFF001E99),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Center(
              child: TextButton(
                onPressed: (){
                  sendData(context);
                  Navigator.pop(context);
                },
                child: const Text("완료",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    height: 1
                  ),
                )
              )
            )
          )
        ),
      ],
    );
  }
}