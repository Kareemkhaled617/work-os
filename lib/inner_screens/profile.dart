import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../constant/constant.dart';
import '../widgets/drawer_widget.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var titleTextStyle = const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              // SizedBox(height: 20,),
              Card(
                margin: const EdgeInsets.all(30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Name',
                          style:titleTextStyle, 
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Job Since joined date (2021-....)',
                          style: TextStyle(
                            color: Constants.darkBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Contact Info',
                        style: titleTextStyle,
                        
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      socialInfo(label: 'Email:', content: 'Email@gmail.com'),
                      const SizedBox(
                        height: 10,
                      ),
                      socialInfo(label: 'Phone number:', content: '+847895498'),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          socialButtons(
                              color: Colors.green,
                              icon: Icons.message_outlined,
                              fct: () {
                                _openWhatsAppChat();
                              }),
                          socialButtons(
                              color: Colors.red,
                              icon: Icons.mail_outline_outlined,
                              fct: () {
                                _mailTo();
                              }),
                          socialButtons(
                              color: Colors.purple,
                              icon: Icons.call_outlined,
                              fct: () {
                                _callPhoneNumber();
                              }),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: MaterialButton(
                            onPressed: () {},
                            color: Colors.pink.shade700,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                                side: BorderSide.none),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 14),
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.26,
                      height: size.width * 0.26,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 5,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              image: NetworkImage(
                                'https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png',
                              ),
                              fit: BoxFit.fill)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget socialInfo({required String label, required String content}) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            content,
            style: TextStyle(
              color: Constants.darkBlue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ],
    );
  }

  Widget socialButtons(
      {required Color color, required IconData icon, required Function fct}) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 25,
      child: CircleAvatar(
        radius: 23,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: Icon(
            icon,
            color: color,
          ),
          onPressed: () {
            fct();
          },
        ),
      ),
    );
  }


  void _openWhatsAppChat() async {
    String phoneNumber = '254454';
    var whatsappUrl = 'https://wa.me/$phoneNumber?text=HelloThere';
    if (await launchUrlString(whatsappUrl)) {
      await launchUrl(Uri.parse(whatsappUrl));
    } else {
      throw 'Error occured coulnd\'t open link';
    }
  }



  void _mailTo() async {
    String email = 'hadi@gmail.com';
    var url = 'mailto:$email';
    if (await launchUrlString(url)) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Error occured coulnd\'t open link';
    }
  }

  void _callPhoneNumber() async {
    String phoneNumber = '5973125';
    var phoneUrl = 'tel://$phoneNumber';
    if (await launchUrlString(phoneUrl)) {
      launchUrl(Uri.parse(phoneUrl));
    } else {
      throw "Error occured coulnd\'t open link";
    }
  }
}
