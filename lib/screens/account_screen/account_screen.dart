import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nectar_ui_ux/screens/registration_screen/registration_screen.dart';
class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {


  final List<String> tileName = [
    "Orders",
    "My Details",
    "Delivery Address",
    "Payment Methods",
    "Promo Code",
    "Notifications",
    "Help",
    "About",
  ];

  final List<String> leadingIcons = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0WzQuxj1AAyF5lBNW2eoxTa6Hf2E5A5mozg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEwV5mMRzRiFn5Hb9ElbQ0kgy0-0LH3UNOK2OSvxjBNhDLAtS3zLOTIaJzKjNXbNxOuSE&usqp=CAU",
    "https://media.istockphoto.com/vectors/map-pin-vector-glyph-icon-vector-id1193451471?k=20&m=1193451471&s=612x612&w=0&h=ve7JRaMvw6L1HBiDOTVwfbhHALPPH-nCMCgG0Z_z5NY=",
    "https://icons-for-free.com/iconfiles/png/512/money+payment+icon-1320165997481413640.png",
    "https://cdn.iconscout.com/icon/free/png-256/apply-coupon-code-1851652-1569377.png",
    "https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-bell-512.png",
    "https://cdn0.iconfinder.com/data/icons/cosmo-symbols/40/help_1-512.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/About_icon_%28The_Noun_Project%29.svg/1024px-About_icon_%28The_Noun_Project%29.svg.png",
  ];

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("User Name", style: TextStyle(color: Colors.black),),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit,color: Colors.green,size: 20,))
              ],
            ),
            Text("User email id", style: TextStyle(color: Colors.grey, fontSize: 12),),
          ],
        ),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueGrey,
              backgroundImage: NetworkImage("https://i.pinimg.com/originals/d5/b0/4c/d5b04cc3dcd8c17702549ebc5f1acf1a.png"),
            ),
          ],
        ),
        toolbarHeight: 100,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              itemBuilder: (BuildContext, index){
                return InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: Container(
                      height: 20,
                        width: 20,
                        child: Image.network(leadingIcons[index],fit: BoxFit.contain,)),
                    title: Text(tileName[index]),
                    trailing: Icon(Icons.arrow_forward_ios_outlined)),
                );
              },
              separatorBuilder: (BuildContext,index)
              {
                return Divider(height: 1);
              },
              itemCount: tileName.length,
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Container(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.black.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                    onPressed: () async {
                      await _auth.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegistrationScreen(),
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.logout,color: Colors.green,),
                        Text("Log Out", style: TextStyle(color: Colors.green),),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
