import 'package:flutter/material.dart';
import 'package:getxcart/constants/color_constants.dart';
import 'package:getxcart/services/firestore_db.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.18),
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/user_profile.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.18),
                                offset: Offset(0, 0),
                                blurRadius: 4,
                                spreadRadius: 4,
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: Provider.of<FirestoreDB>(context, listen: false)
                      .getCurrentUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return displayUserInformation(context, snapshot);
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor),
                      ),
                      onPressed: () {},
                      child: Text('Logout'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor),
                      ),
                      onPressed: () {},
                      child: Text('Change Account'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget displayUserInformation(context, snapshot) {
    final user = snapshot.data;
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Email: ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade500,
                ),
              ),
              Text(
                "${user.email ?? 'Anonymous'}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            ],
          ),
          //   SizedBox(
          //     height: 10,
          //   ),
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Name: ",
          //         style: TextStyle(
          //           fontSize: 18,
          //           color: Colors.grey.shade500,
          //         ),
          //       ),
          //       Text(
          //         "${user.email ?? 'Anonymous'}",
          //         style: TextStyle(
          //             fontSize: 18,
          //             fontWeight: FontWeight.bold,
          //             color: kPrimaryColor),
          //       ),
          //     ],
          //   ),
        ],
      ),
    );
  }
}
