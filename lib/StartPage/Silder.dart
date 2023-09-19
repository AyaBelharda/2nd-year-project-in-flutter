import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/player_box.dart';

class SilderMusic extends StatefulWidget {
  const SilderMusic({super.key, required double value, Key? key1}) ;
  @override
  State<SilderMusic> createState() => _SilderMusicState();
}

class _SilderMusicState extends State<SilderMusic> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    _loadAudio();
  }
  @override
  void dispose() {
    _audioPlayer.release();
    _audioPlayer.dispose();
    super.dispose();
  }
  void _loadAudio() async {
    await _audioPlayer.play(AssetSource('https://example.com/audio.mp3'));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      width: 200,
      decoration: BoxDecoration(
        boxShadow:  [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 0,
            blurRadius: 0,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
        border: Border.all(
          color: Colors.white, //                   <--- border color
          width: 3.0,
        ),
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 15,
            rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 10),
            inactiveTrackColor: Colors.lightBlueAccent,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 0.0,
            ),
            overlayShape: const RoundSliderOverlayShape(
              overlayRadius: 0.0,
            ),
          ),
          child: Slider(
            value: globalVolumeMusicSettings,
            onChanged: (double value) {
              setState(() {
              });
            },
            activeColor: const Color.fromRGBO(255, 210, 23, 5),
            max: 10,
            min: 0,
          ),
        ),
      ),
    );
  }
}
