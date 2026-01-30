import 'package:flutter_tts/flutter_tts.dart';

class TtsHelper {
  final FlutterTts _tts = FlutterTts();
  bool _hasSpoken = false;

  Future<void> init() async {
    await _tts.setLanguage("en-US");
    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.0);
    await _tts.setVolume(0.8);
  }

  Future<void> speakOnce(String text) async {
    if (_hasSpoken) return;
    _hasSpoken = true;
    await _tts.speak(text);
  }

  Future<void> stop() async {
    _hasSpoken = false;
    await _tts.stop();
  }

  void dispose() {
    _tts.stop();
  }
}
