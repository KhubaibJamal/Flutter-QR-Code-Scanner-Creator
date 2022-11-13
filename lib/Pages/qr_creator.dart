import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCreatorPage extends StatefulWidget {
  const QRCreatorPage({Key? key}) : super(key: key);

  @override
  State<QRCreatorPage> createState() => _QRCreatorPageState();
}

class _QRCreatorPageState extends State<QRCreatorPage> {
  TextEditingController dataController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "QR Generator",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .067,
                ),
                QrImage(
                  data: dataController.text,
                  size: 200,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: dataController,
                  decoration: InputDecoration(
                    hintText: "Enter data here",
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.done,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.all(19),
                //   height: MediaQuery.of(context).size.height / 3.5,
                //   color: Colors.amber,
                //   child: Card(
                //     child: TextFormField(
                //       controller: dataController,
                //       decoration: InputDecoration(
                //         hintText: "Enter Text Here to Genereate Code",
                //         hintStyle: TextStyle(
                //           color: Colors.white,
                //           fontSize: 15,
                //         ),
                //         enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(8)),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
