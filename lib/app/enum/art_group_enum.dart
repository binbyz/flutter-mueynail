enum ArtGroupEnum {
  todayArt(1, '이달의 아트'),
  oneTone(2, '원톤'),
  french(3, '프렌치'),
  custom(9, '커스텀');

  const ArtGroupEnum(this.id, this.label);
  final int id;
  final String label;
}