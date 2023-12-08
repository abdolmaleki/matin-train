import 'package:flutter/material.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/staff.dart';
import 'package:hoivalani/core/utils/architecture/domain/common_enums/staff_type.dart';

class QuizModel {
  String? title;
  int? numberOfParticipants;
  int? questionNumber;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  DateTime? startDate;
  DateTime? endDate;
  int? quizId;
  String? status;
  String? duration;
  int? totalParticipants;
  bool? lock;
  String? password;
  String? confirmPassword;
  String? availableStaffParticipantsType;
  List<StaffModel>? availableStaffParticipants;
  List<StaffType>? staffTypes;
  List<QuizParticipantStatistics>? statistics;
  final List<QuizQuestionModel> questions;
  bool isFinishedByUser;

  QuizModel(
      {this.title,
      this.numberOfParticipants,
      this.questionNumber,
      this.startTime,
      this.endTime,
      this.startDate,
      this.endDate,
      this.quizId,
      this.status,
      this.duration,
      this.totalParticipants,
      this.lock,
      this.password,
      this.confirmPassword,
      this.availableStaffParticipants,
      this.availableStaffParticipantsType,
      this.staffTypes,
      this.questions = const [],
      this.isFinishedByUser = false,
      this.statistics});

  QuizModel copyWith({
    String? title,
    int? numberOfParticipants,
    int? questionNumber,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    DateTime? startDate,
    DateTime? endDate,
    int? quizId,
    String? status,
    String? duration,
    int? totalParticipants,
    bool? lock,
    String? password,
    String? confirmPassword,
    String? availableStaffParticipantsType,
    List<StaffModel>? availableStaffParticipants,
    List<StaffType>? staffTypes,
    List<QuizParticipantStatistics>? statistics,
    List<QuizQuestionModel>? questions,
  }) {
    return QuizModel(
      title: title ?? this.title,
      numberOfParticipants: numberOfParticipants ?? this.numberOfParticipants,
      questionNumber: questionNumber ?? this.questionNumber,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      quizId: quizId ?? this.quizId,
      status: status ?? this.status,
      duration: duration ?? this.duration,
      totalParticipants: totalParticipants ?? this.totalParticipants,
      lock: lock ?? this.lock,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      availableStaffParticipantsType:
          availableStaffParticipantsType ?? this.availableStaffParticipantsType,
      availableStaffParticipants:
          availableStaffParticipants ?? this.availableStaffParticipants,
      staffTypes: staffTypes ?? this.staffTypes,
      statistics: statistics ?? this.statistics,
      questions: questions ?? this.questions,
    );
  }
}

class QuizParticipantStatistics {
  StaffModel? staff;
  DateTime? startDate;
  String? duration;
  int? participantsId;
  int? score;
  int? totalParticipants;
  QuizAnswerState? answeringState;

  QuizParticipantStatistics(
      {this.staff,
      this.startDate,
      this.duration,
      this.participantsId,
      this.score,
      this.totalParticipants,
      this.answeringState});
}

class QuizAnswerState {
  int? trueNumber;
  int? falseNumber;
  int? unAnswered;
  List<int>? participantAnswers;

  QuizAnswerState(
      {this.trueNumber,
      this.falseNumber,
      this.unAnswered,
      this.participantAnswers});
}

class QuizQuestionModel {
  int? id;
  String? question;
  List<QuizAnswerModel>? answers;
  String? description;

  QuizQuestionModel({this.question, this.answers, this.description, this.id});
}

class QuizAnswerModel {
  int? id;
  String? answer;
  int? score;

  QuizAnswerModel({this.answer, this.score, this.id});
}
