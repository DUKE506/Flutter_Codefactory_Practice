import 'package:drift/drift.dart';

class ScheduleTable extends Table {
  /// 식별자
  IntColumn get id => integer().autoIncrement()();

  /// 시작시간
  IntColumn get startTime => integer()();

  /// 종료시간
  IntColumn get endTime => integer()();

  /// 일정내용
  TextColumn get content => text()();

  ///날짜
  DateTimeColumn get date => dateTime().nullable()();

  /// 카테고리
  TextColumn get color => text()();

  /// 일정 생성 시간
  DateTimeColumn get createdAt => dateTime().clientDefault(
        () => DateTime.now().toUtc(),
      )();
}
