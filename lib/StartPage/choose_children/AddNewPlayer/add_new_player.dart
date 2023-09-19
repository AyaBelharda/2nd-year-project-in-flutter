



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/StartPage/choose_children/AddNewPlayer/select_avatar.dart';
import 'package:sorttrash/button.dart';
import 'package:sorttrash/player_box.dart';

import '../../../defis/key_container.dart';


class AddPlayer extends StatefulWidget {

  const AddPlayer({Key? key})
      : super(key: key);

  @override
  State<AddPlayer> createState() => _AddPlayer();
}

class _AddPlayer extends State<AddPlayer> {
  final User? user = FirebaseAuth.instance.currentUser;
  String profileImage = 'assets/profiles/0.png';
  void updateAvatarImageName(String string){
    profileImage = string;
  }
  int childAge = 0;
  String childName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg-image2.png'),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 0.8*MediaQuery.of(context).size.height,
                    width: 0.5*MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                  ),
                ),

                Center(
                  child: Container(
                    height: 0.7*MediaQuery.of(context).size.height,
                    width: 0.4*MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          spreadRadius: 0,
                          blurRadius: 0,
                          offset: Offset(0, 7), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        Container(
                          width: 0.26*MediaQuery.of(context).size.width,
                          height:0.07*MediaQuery.of(context).size.height ,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255,221,80, 1),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 1, color: Colors.black54)
                          ),
                          child: const Center(child: Text('Ajouter Enfant', style: TextStyle(color: Colors.white, fontFamily: 'Digital', fontSize: 18),),),
                        ),
                        const SizedBox(height: 20,),
                        SizedBox(
                          width: 0.25*MediaQuery.of(context).size.width,
                          height: 0.18*MediaQuery.of(context).size.height,
                          child: TextFormField(
                            maxLength: 15,
                            decoration:InputDecoration(
                              prefixIcon: const Icon(
                                Icons.sort_by_alpha,
                                color: Colors.black,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'UserName',
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Digital',
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Colors.black87,
                                  width: 2,
                                ),
                              ),
                            ),
                            onChanged: (value) => childName = value,
                          ),
                        ),
                        const SizedBox(height: 5,),
                        SizedBox(
                          width: 0.25*MediaQuery.of(context).size.width,
                          height: 0.18*MediaQuery.of(context).size.height,
                          child: TextFormField(
                            validator: (value) => value == null ||
                                value.length > 2 ||
                                value.isEmpty
                                ? 'Enter 2- char password'
                                : null,
                            maxLength: 2,
                            decoration:InputDecoration(
                              prefixIcon: const Icon(
                                Icons.numbers,
                                color: Colors.black,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Age',
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Digital',
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  color: Colors.black87,
                                  width: 2,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              if (int.tryParse(value) != null) {
                                childAge = int.tryParse(value)!;
                              } else {
                                childAge = 0;
                              }
                            },
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseAvatar(updateAvatar: updateAvatarImageName,)));
                          },
                          child: Container(
                            width: 0.24*MediaQuery.of(context).size.width,
                            height:0.09*MediaQuery.of(context).size.height ,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(child: Text("Choisir Avatar",  style: TextStyle(color: Colors.black, fontFamily: 'Digital'),)),
                          ),
                        ),
                      ],

                    ),
                  ),
                ),

                Positioned(left : 0.66*MediaQuery.of(context).size.width,child: const RoundButton(myIcon: Icons.exit_to_app, href: '/', couleur: Color.fromRGBO(255,221,80, 1), shadowColor: Colors.transparent,)),
                Positioned(
                    left: 0.43*MediaQuery.of(context).size.width,
                    top: 0.63888*MediaQuery.of(context).size.height,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: sm1,
                            side: const BorderSide(width: 3, color: Colors.white),
                            shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            padding:
                            EdgeInsets.only(left: 0.0388*MediaQuery.of(context).size.width, right: 0.0388*MediaQuery.of(context).size.width, top: 0.0222*MediaQuery.of(context).size.height, bottom: 0.02777*MediaQuery.of(context).size.height)),
                        onPressed: (){

                         setState(() {
                           try{
                             if (currentProfileIndex == 1){
                               offlineProgress.addElementProgress(
                                   childName, childAge, profileImage);
                               print(offlineProgress.returnPlayers().length);
                               offlineGlobalPlayers =
                                   offlineProgress.returnPlayers();
                               parentBox.putAt(0, offlineProgress.returnParent());
                               //       Navigator.pushNamed(context, '/ChildSelector');
                             }else{
                               if (user != null){
                                 onlineProgress.addElementProgress(
                                     childName, childAge, profileImage);
                                 onlineParentBox.put(
                                     onlineProgress.getUID(),
                                     onlineProgress
                                         .returnParent());
                                 playersOnline = onlineProgress
                                     .returnPlayers();
                                 onlineProgress
                                     .returnParent()
                                     .updateData(
                                     onlineProgress.getUID());
                               }
                             }
                           }on Exception catch (e) {
                             print(e);
                           }
                           Navigator.pushNamed(context, '/ChildSelector');
                         });
                        }, child: const Text('Done')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


