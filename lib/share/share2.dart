import 'package:dwaweenx/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class share2 extends StatelessWidget {
  share2({super.key, required this.kasyeda});

  String kasyeda;

  void _shareContent() {
    Share.share(kasyeda);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 6,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 7,
                      margin: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Center(
                        child: Image.asset('assets/img/share-img$index.jpg'),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                kasyeda,
                style: const TextStyle(
                  color: Constants.primary,
                  fontFamily: 'Cairo',
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _shareContent,
                icon: const Icon(Icons.share),
                label: const Text('شارك الاصدقاء'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
