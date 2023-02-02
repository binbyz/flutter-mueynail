import 'package:mueynail/constants/value.dart';

enum BookingStep {
  apply('예약 신청', '$valueBrand에서 예약확인 중입니다.'),
  applyChecked('예약 확인', '예약금 입금 후에 예약이 확정됩니다.'),
  depositConfirmed('예약 확정', '예약이 확정 되었습니다.'),
  end('시술 완료', '후기를 남겨 포인트 챙겨가세요 :)');

  const BookingStep(this.label, this.description);

  final String label;
  final String description;
}