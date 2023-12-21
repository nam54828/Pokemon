class VideoModel {
  final String urlVideo;
  final String nameVideo;
  VideoModel(this.urlVideo, this.nameVideo);
}

final List<VideoModel> listVideo = <VideoModel>[
  VideoModel('https://youtu.be/xbsT5l4hdfA?si=_8gy4HjOWr8OxjRu', 'Satoshi Gekkouga VS Mega Jukain'),
  VideoModel('https://youtu.be/LTlCCssTd7s?si=Eq5WbIykAdfSuZat', 'Pikachu VS Mega Espeon'),
  VideoModel('https://youtu.be/Q7CTc73Uqgk?si=iW97GxiQ7cGRi44n', 'Ash & Goh Battle Mewtwo'),
  VideoModel('https://youtu.be/UbL2Z918uYM?si=U5p1-YTdctxuFCbg', 'Ash VS Gladion'),
];