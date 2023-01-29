enum ArtGroupEnum {
  todayArt(1, '이달의 아트', 'today_art'),
  oneTone(2, '원톤', 'one_tone'),
  french(3, '프렌치', 'french'),
  custom(9, '커스텀', 'custom');

  const ArtGroupEnum(this.id, this.label, this.key);
  final int id;
  final String label;
  final String key;
}