import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  late PageController _pageController;

  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: demo_data.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) => onboardContent(
                      lottiefiles: demo_data[index].lottiefiles,
                      title: demo_data[index].title,
                      description: demo_data[index].description,
                    ),
                  ),
                ),
                Row(
                  children: [
                    ...List.generate(
                      demo_data.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: dotIndicator(
                          isActive: index == _pageIndex,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.ease);
                        },
                        child: Lottie.asset('assets/animations/something.json'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class dotIndicator extends StatelessWidget {
  const dotIndicator({super.key, this.isActive = false});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? primarycolor : primarycolor.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class onboard {
  final String lottiefiles, title, description;

  onboard(
      {required this.lottiefiles,
      required this.title,
      required this.description});
}

final List<onboard> demo_data = [
  onboard(
    lottiefiles: 'assets/animations/cred_white.json',
    title: 'Welcome to Cred',
    description: 'This is what you made me.',
  ),
  onboard(
    lottiefiles: 'assets/animations/credit_card.json',
    title: 'All your Credit Carts in one place',
    description:
        'Cred is a place where all your credit cards can be managed without too much of a hassale.',
  ),
  onboard(
    lottiefiles: 'assets/animations/cash_management.json',
    title: 'Optimize your cash flows',
    description:
        'Cred gives you the ability to manage your credit card bills and your cash flows so that you can save wherever possible.',
  ),
];

class onboardContent extends StatelessWidget {
  const onboardContent({
    super.key,
    required this.lottiefiles,
    required this.title,
    required this.description,
  });
  final String lottiefiles, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Lottie.asset(
          lottiefiles,
          height: 300,
          frameRate: FrameRate.max,
        ),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Cirka',
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Overpass',
            color: Colors.white,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

const primarycolor = Colors.white;
