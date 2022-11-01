import 'package:equatable/equatable.dart';

class EmojiStatus extends Equatable {
  const EmojiStatus({required this.status});

  factory EmojiStatus.fromJson(Map<String, dynamic> json) {
    return EmojiStatus(
      status: json['status'] as List<Status>,
    );
  }

  final List<Status> status;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status.map((e) => e.toJson()).toList();
    return data;
  }

  EmojiStatus copyWith({List<Status>? status}) {
    return EmojiStatus(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];

  @override
  bool get stringify => true;
}

class Status extends Equatable {
  const Status({
    required this.emoji,
    required this.createdAt,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      emoji: json['emoji'] as String,
      createdAt: json['createdAt'] as DateTime,
    );
  }

  final String emoji;
  final DateTime createdAt;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['emoji'] = emoji;
    //data['createdAt'] = createdAt;
    data['createdAt'] = createdAt.toIso8601String();
    return data;
    //return {
    //  'emoji': emoji,
    //  'createdAt': createdAt,
    //};
  }

  Status copyWith({String? emoji, DateTime? createdAt}) {
    return Status(
      emoji: emoji ?? this.emoji,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [emoji, createdAt];

  @override
  bool get stringify => true;
}
