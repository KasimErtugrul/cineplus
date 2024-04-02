class ApiSettings {
  static String baseUrl = 'https://api.themoviedb.org/3/';
  static String baseToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYmY1MzVhYTc0ZTRiMzZlOTYwMTE3MjhmYTVmNmYwMSIsInN1YiI6IjY0ZjEwYzkzY2FhNTA4MDEwYWU2Yzc4NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xrB53QgO4DQNlxIl1QKIHpdXXP9Jr_6wLssDPp87l8w';
  static String apiKey =
      'c033030a6a2c8c21f4db8286fddae551'; // dbf535aa74e4b36e96011728fa5f6f01 - benim orijinal
  static String imagePath185(String path) =>
      'https://image.tmdb.org/t/p/w185$path';

  static String imagePathOriginal(String path) =>
      'https://image.tmdb.org/t/p/original$path';

  static String imagePath500(String path) =>
      'https://image.tmdb.org/t/p/w500$path';

      static String voteAverageConverter(double value) {
    return ((value * 10).round() / 10).toString();
  }

   static String dakikaDonusumu(int dakika) {
    int saat = dakika ~/ 60;
    int dakikaKalan = dakika % 60;
    String sonuc = ' ${saat}s';
    if (dakikaKalan > 0) {
      sonuc += ' ${dakikaKalan}dk ';
    }
    return sonuc;
  }

  static String formatDateString(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    String formattedDate = "${dateTime.year}";
    return formattedDate;
  }
}
