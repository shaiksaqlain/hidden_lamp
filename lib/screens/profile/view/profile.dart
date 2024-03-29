import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hidden_lamp/screens/profile/view/editProfile.dart';
import 'package:provider/provider.dart';

import '../../../Provider/providers.dart';
import '../../../utils/MATUtils/MATUtils.dart';
import '../../../utils/SharedPreferances/sharedPreferaces.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List colors = [
    const Color.fromARGB(255, 215, 182, 17),
    const Color.fromARGB(255, 236, 75, 57),
    const Color.fromARGB(255, 58, 143, 213),
    const Color.fromARGB(255, 16, 178, 94),
    const Color.fromARGB(255, 211, 56, 239),
    const Color.fromARGB(255, 41, 147, 234),
    const Color.fromARGB(255, 4, 37, 16),
  ];
  List sizes = [
    6,
    18,
    13,
    12,
    7,
    14,
    12,
  ];
  List days = [
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT',
    'SUN',
  ];
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getData();
    });
    super.initState();
  }

  bool isLoading = true;
  Map<String, dynamic> data = {};
  getData() async {
    LogicState userProvider = Provider.of(context, listen: false);
    var userData = await sharedPreferances().getUserDetails();
    DocumentReference documentRef =
        FirebaseFirestore.instance.collection('Users').doc(userData['phone']);

    documentRef.get().then((DocumentSnapshot documentSnapshot) {
      data = documentSnapshot.data() as Map<String, dynamic>;
      setState(() {});
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: MATUtils()
                                  .customText('My Profile', 22, Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 100,
                          child: Image.asset('assets/4-03.png'),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Center(
                        child: TextButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EditProfile()));
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 25,
                            ),
                            label: MATUtils()
                                .customText("Edit Profile", 16, Colors.blue)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MATUtils().customText(
                              "Name : ${data['name']}", 18, Colors.blue),
                          const SizedBox(
                            height: 7,
                          ),
                          MATUtils().customText(
                              "Class : ${data['className']}", 18, Colors.blue),
                          const SizedBox(
                            height: 7,
                          ),
                          MATUtils().customText(
                              "Section : ${data['section']}", 18, Colors.blue),
                          const SizedBox(
                            height: 7,
                          ),
                          MATUtils().customText(
                              "School : ${data['school']}", 18, Colors.blue),
                          const SizedBox(
                            height: 7,
                          ),
                          MATUtils().customText(
                              "Phone Number : ${data['phoneNumber']}",
                              18,
                              Colors.blue),
                        ],
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width / 1.8,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 3, color: Colors.blue),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MATUtils().customText(
                                    "Monthly Report", 14, Colors.blue),
                                const Icon(
                                  Icons.download,
                                  color: Colors.blue,
                                )
                              ]),
                        ),
                      ),
                      // Center(
                      //     child: MATUtils()
                      //         .customText("Activity Time", 18, Colors.blue)),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      // Center(
                      //   child: MATUtils().customText(
                      //       "Average time you spent per day learning in this app",
                      //       15,
                      //       Colors.blue),
                      // ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     for (var i = 0; i < 7; i++)
                      //       Expanded(
                      //         child: Container(
                      //           margin: const EdgeInsets.symmetric(
                      //               horizontal: 3, vertical: 20),
                      //           width: MediaQuery.of(context).size.width / 9,
                      //           height: MediaQuery.of(context).size.height /
                      //               sizes[i],
                      //           decoration: BoxDecoration(
                      //             color: colors[i],
                      //             borderRadius: const BorderRadius.all(
                      //                 Radius.circular(10)),
                      //           ),
                      //           child: Center(
                      //               child: Text(
                      //             days[i],
                      //             style: const TextStyle(color: Colors.white),
                      //           )),
                      //         ),
                      //       ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
