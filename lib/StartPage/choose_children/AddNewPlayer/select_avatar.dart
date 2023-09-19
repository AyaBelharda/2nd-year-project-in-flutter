import 'package:flutter/material.dart';

class ChooseAvatar extends StatefulWidget {
  const ChooseAvatar({
    Key? key,
    required this.updateAvatar
  }) : super(key: key);
  final Function(String) updateAvatar ;
  @override
  State<ChooseAvatar> createState() => _ChooseAvatarState();
}

class _ChooseAvatarState extends State<ChooseAvatar> {
  final List<String> avatarList =
      List.generate(10, (index) => 'assets/profiles/$index.png');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg-image2.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            width: 0.6 * MediaQuery.of(context).size.width,
            height: 0.4 * MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 0.4 * MediaQuery.of(context).size.width,
                  height: 0.07 * MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 221, 80, 1),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.black54)),
                  child: const Center(
                    child: Text(
                      'choose your avatar',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Digital',
                          fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...avatarList.map((e) => InkWell(
                        onTap: (){
                          setState(() {
                            widget.updateAvatar(e);
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 0.2* MediaQuery.of(context).size.height,
                            width: 0.2 * MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(e)),
                            )),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
