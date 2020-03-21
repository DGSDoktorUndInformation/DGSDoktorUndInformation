import 'Frage.dart';

class CorvidSelbsttestFragen {
  List<Frage> getAll() {
    return [
      new Frage("Wie alt?", "https://cdn.jwplayer.com/videos/2fWIXvhA-cqrEIsCv.mp4", ["jünger 40", "40-50", "51-60", "71-80", "über 80"]),
      new Frage("Wo wohnen Sie?", "https://cdn.jwplayer.com/videos/nZ4locA5-xgdDoosc.mp4",["alleine", "nicht alleine"]),
      new Frage("Arbeiten Sie in?", "https://cdn.jwplayer.com/videos/078S1GqA-xgdDoosc.mp4", ["Medizin", "Schule", "Kita", "Universität", "Heim", "Woanders"]),
      new Frage("Rauchen Sie?", "https://cdn.jwplayer.com/videos/2ToRgzSk-cqrEIsCv.mp4", ["Ja", "Nein"]),
      new Frage("Waren Sie im Ausland?", "https://cdn.jwplayer.com/videos/RyJa4HLG-cqrEIsCv.mp4", ["Ja", "Nein"]),
    ];
  }
}
