enum ArtGroupEnum {
  todayArt(1, '이달의 아트', 'today_art'),
  oneToneArt(2, '원톤 아트', 'onetone_art'),
  frenchArt(3, '프렌치 아트', 'french_art'),
  brandArt(4, '브랜드 아트', 'brand_art'),
  seasonOffArt(5, '시즌오프 아트', 'seasonoff_art'),
  customArt(9, '커스텀 아트', 'custom_art');

  const ArtGroupEnum(this.id, this.label, this.key);

  final int id;
  final String label;
  final String key;
}