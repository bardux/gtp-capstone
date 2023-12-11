import 'package:flutter/material.dart';
import 'package:storyteller/models/splash_data.dart';
import 'package:storyteller/screens/home_screen.dart';
import 'package:storyteller/screens/splash/components/content.dart';
import 'package:storyteller/screens/splash/components/dot.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<SplashData> splashData = [
    SplashData(
      text: 'Stories that spark imagination',
      image: 'assets/img/splash1.jpg',
    ),
    SplashData(
      text: 'Engaging narratives',
      image: 'assets/img/splash2.jpg',
    ),
    SplashData(
      text: 'Fostering imagination',
      image: 'assets/img/splash3.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Storyteller',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value) => setState(() => currentPage = value),
                itemCount: splashData.length,
                itemBuilder: (context, index) => Content(
                  text: splashData[index].text,
                  image: splashData[index].image,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        splashData.length,
                        (index) => Dot(
                          isActive: currentPage == index,
                        ),
                      )
                    ],
                  ),
                  const Spacer(flex: 2),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const HomeScreen();
                      }));
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
