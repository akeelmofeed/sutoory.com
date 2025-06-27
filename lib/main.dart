import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(SutooryWebsite());
}

class SutooryWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sutoory',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            // Centered Content
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 360),
                    SvgPicture.asset(
                      'assets/Sutoory.svg',
                      width: 120,
                      height: 80,
                    ),
                    const SizedBox(height: 42),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 36,
                          vertical: 18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ), // Border radius
                        ),
                        backgroundColor:
                            Colors.grey.shade800, // Optional: background color
                      ),
                      child: const Text(
                        'ما الحكاية؟',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'ترقبوا المزيد من التفاصيل عبر حساباتنا على منصات التواصل!',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => launchURL("https://x.com/sutooryapp"),
                            child: Image.asset("assets/x.png", width: 27),
                          ),
                          SizedBox(width: 30),
                          InkWell(
                            onTap: () =>
                                launchURL("https://instagram.com/sutooryapp"),
                            child: Image.asset(
                              "assets/Instagram.png",
                              width: 27,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FooterLink extends StatelessWidget {
  final String text;
  final String url;

  const FooterLink({required this.text, required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: open url using url_launcher
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.orange.shade200,
          fontSize: 13,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

void launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    print("Could not launch $url");
  }
}
