import 'package:dwaweenx/Screens/Knanish/KasayedDetails/AudioPlayer/audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Audiobar extends StatefulWidget {
  const Audiobar({super.key});

  @override
  State<Audiobar> createState() => _AudiobarState();
}

class _AudiobarState extends State<Audiobar> {
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 125,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 27, 161, 134),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 50,
                  child: SvgPicture.asset('assets/img/ic_mnshed.svg'),
                ),
                const SizedBox(
                  height: 40,
                  width: 300,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Voice name',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 25,
                  width: 350,
                  child: SvgPicture.asset('assets/img/load.svg'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 55,
                  width: 55,
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset('assets/img/ic_downlod.svg'),
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset('assets/img/ic_pspeed.svg'),
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset('assets/img/ic_p.svg'),
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const audioplayerx(),
                        ),
                      );
                    },
                    icon: SvgPicture.asset('assets/img/ic_play.svg'),
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset('assets/img/ic_next.svg'),
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset('assets/img/ic_nspeed.svg'),
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 55,
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset('assets/img/ic_repeat.svg'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
}
