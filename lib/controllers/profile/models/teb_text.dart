import 'package:equatable/equatable.dart';

class TabText extends Equatable {
  final String lable;
  final int position;
  final TabType type;
  const TabText({
    required this.lable,
    required this.position,
    required this.type,
  });

  @override
  List<Object?> get props => [lable, position];
}

enum TabType { photos, reels, videos, tags }
