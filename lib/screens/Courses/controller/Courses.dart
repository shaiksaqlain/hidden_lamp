import 'package:flutter/material.dart';

import '../../../utils/MATUtils/MATUtils.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List colors = [
    const Color.fromARGB(255, 215, 182, 17),
    const Color.fromARGB(255, 236, 75, 57),
    const Color.fromARGB(255, 58, 143, 213),
    const Color.fromARGB(255, 16, 178, 94),
    const Color.fromARGB(255, 211, 56, 239),
    const Color.fromARGB(255, 41, 147, 234),
    const Color.fromARGB(255, 4, 37, 16),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: MATUtils().customText('Courses', 22, Colors.black),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Chip(
                    backgroundColor: Colors.green,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text('A'),
                    ),
                    label: Text('All', style: TextStyle(color: Colors.white)),
                  ),
                  Chip(
                    backgroundColor: Colors.white,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Text('O', style: TextStyle(color: Colors.black)),
                    ),
                    label: Text('Onging'),
                  ),
                  Chip(
                    backgroundColor: Colors.white,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('C', style: TextStyle(color: Colors.white)),
                    ),
                    label: Text('Completed'),
                  )
                ],
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        index == 0
                            ? Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                padding: const EdgeInsets.all(8),
                                height:
                                    MediaQuery.of(context).size.height / 6.3,
                                decoration: BoxDecoration(
                                  color: colors[index + 3],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.2,
                                          child: MATUtils().customText(
                                              'Whether you have a minute or an hour, you\'re sure to find a great quiz to test your brain.',
                                              14,
                                              Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 25, vertical: 10),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                          child: const Text("Take Quiz"),
                                        )
                                      ],
                                    ),
                                    Center(
                                      child: Image.asset(
                                        'assets/l${index + 3}.png',
                                        fit: BoxFit.fitWidth,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                10,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          padding: const EdgeInsets.all(8),
                          height: MediaQuery.of(context).size.height / 6.3,
                          decoration: BoxDecoration(
                            color: colors[index],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      'assets/l${index + 3}.png',
                                      fit: BoxFit.fitWidth,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MATUtils().customText(
                                      "Artificial Intelligence",
                                      15,
                                      Colors.white),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  MATUtils().customText(
                                      "Artificial Intelligence is powerful\nTechnology",
                                      11,
                                      Colors.white),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  MATUtils().customText(
                                      "Completed: $index/10", 15, Colors.white),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
