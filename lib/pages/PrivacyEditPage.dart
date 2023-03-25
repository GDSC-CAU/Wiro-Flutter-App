import 'package:flutter/material.dart';

class PrivacyEditPage extends StatelessWidget {
  const PrivacyEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const PrivacyEditBack(),
              PrivacyEditInput()
            ]
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
  PrivacyEditInput({super.key});

  final inputBloodController = TextEditingController();
  final inputDiseaseController = TextEditingController();
  final inputIDController = TextEditingController();
  final inputMedicineController = TextEditingController();
  final inputNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
        ],
      )
    );
  }
}