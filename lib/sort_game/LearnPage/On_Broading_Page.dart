import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LearnPage> createState() => _LearnPageState();
}

Widget buildWidget(
    String imageName, Color containerColor, String content, String pageName) {
  return Container(
    color: containerColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          width: 30,
        ),
        Container(
          width: 100,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                imageName,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pageName,
                style: const TextStyle(
                    color: Color.fromRGBO(255, 215, 0, 0.8),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Flexible(
                child: Text(
                  content,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

class _LearnPageState extends State<LearnPage> {
  final _controller = PageController();
  bool lastPageCheck = false;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              if (index == 5) {
                lastPageCheck = true;
              } else {
                lastPageCheck = false;
              }
            });
          },
          children: [
            buildWidget(
                "assets/images/bluecan.png",
                Colors.lightBlueAccent,
                "Les poubelles bleues sont spéciales parce qu elles sont utilisées pour recycler le papier et le carton. \n Les papiers recyclables sont des choses comme les journaux, les magazines, les cahiers, les enveloppes en papier, et même les boîtes en carton !",
                "Les poubelles bleues"),
            buildWidget(
                'assets/images/greencan.png',
                Colors.lightGreenAccent,
                "Les bacs de recyclage verts sont utilisés pour recycler le verre, les bouteilles, les pots, les canettes de nourriture et de boisson, et les bouteilles en plastique !",
                "Les poubelles vertes"),
            buildWidget('assets/images/redcan.png', Colors.redAccent,
                "this is a test", "pageName"),
            buildWidget('assets/images/yellowcan.png', Colors.yellowAccent,
                "this is a test", "pageName"),
            buildWidget('assets/images/orangecan.png', Colors.orangeAccent.shade700,
                "this is a test", "pageName"),
            buildWidget('assets/images/graycan.png', Colors.tealAccent,
                "this is a test", "pageName"),
          ],
        ),
      ),
      bottomSheet: lastPageCheck
          ? TextButton(
              onPressed: () {
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Colors.tealAccent,
                minimumSize: const Size.fromHeight(80),
              ),
              child: TextButton(
                  onPressed: () { Navigator.pop(context);},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    alignment: Alignment.center,
                  ),
                  child: const Text(
                    '🐸 GO BACK !!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
            )
          : Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => _controller.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOutSine),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.cyanAccent,
                      )),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 6,
                      effect: ColorTransitionEffect(
                          spacing: 11,
                          dotColor: Colors.lightGreenAccent,
                          activeDotColor: Colors.teal.shade700),
                      onDotClicked: (index) => _controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                      onPressed: () => _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOutSine),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.cyanAccent,
                      ))
                ],
              ),
            ),
    );
  }
}
