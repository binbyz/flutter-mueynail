enum Design {
  todayArt(1, '이달의 아트'),
  oneTone(2, '원톤'),
  french(3, '프렌치'),
  custom(9, '커스텀');

  const Design(this.id, this.label);
  final int id;
  final String label;
}