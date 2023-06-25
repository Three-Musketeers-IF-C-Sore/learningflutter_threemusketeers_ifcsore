import 'package:flutter/material.dart';

class FormContact extends StatefulWidget {
  const FormContact({super.key});

  @override
  State<FormContact> createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  List errorMessage = [];

  bool isError = false;

  @override
  Widget build(BuildContext context) {
    // final mail = Provider.of<MailProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("New Contact"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
              ),
              TextField(
                controller: phone,
                decoration: const InputDecoration(
                  hintText: "Phone Number",
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(     
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          )
        ),      
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          setState(() {
            errorMessage = [];
            isError = false;
          });
          if(name.text.isEmpty) {
            setState(() {
              errorMessage.add("Name is required");
              isError = true;
            });
          }
          if(phone.text.isEmpty) {
            setState(() {
              errorMessage.add("Phone is required");
              isError = true;
            });
          }
          if(isError) {
            ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                content: ListView.separated(
                  shrinkWrap: true,
                  itemCount: errorMessage.length,
                  separatorBuilder: (context, index) {
                    return const Padding(padding: EdgeInsets.only(bottom: 5));
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                      title: Text(errorMessage[index]),
                      textColor: Colors.red,
                      leading: const Icon(Icons.warning_amber, color: Colors.red,),
                    );
                  }
                ), 
                backgroundColor: const Color.fromARGB(245, 245, 245, 245),
                actions: [
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                    }, 
                    child: const Text('Close'),
                  ),
                ])
            );
          }
        }, 
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Save')
        )
      ),
    );
  }
}