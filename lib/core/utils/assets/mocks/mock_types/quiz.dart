import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:hoivalani/core/config/dependency_injection/get_it.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/quiz.dart';
import 'package:hoivalani/core/utils/architecture/data/common_models/staff.dart';
import 'package:hoivalani/core/utils/architecture/domain/common_enums/staff_type.dart';
import 'package:hoivalani/core/utils/assets/mocks/enum.dart';
import 'package:hoivalani/core/utils/assets/mocks/mock_factory.dart';

class MockQuizList implements MockData {
  @override
  dynamic getMockJson() {
    return null;
  }

  @override
  List<QuizModel> getMockObject() {
    Faker faker = getIt.get<Faker>();
    List<StaffModel> staffs = MockData(MockType.staffsList).getMockObject();
    List<QuizQuestionModel> questions = List.generate(
        faker.randomGenerator.integer(4, min: 3),
        (index) => QuizQuestionModel(
            id: faker.randomGenerator.integer(100000, min: 1),
            question: faker.lorem
                .sentences(1)
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            description: faker.lorem.sentence(),
            answers: List.generate(
                4,
                (index) => QuizAnswerModel(
                      id: faker.randomGenerator.integer(100000, min: 1),
                      answer: faker.lorem.word(),
                      score: faker.randomGenerator.integer(4, min: 0),
                    ))));
    return List.generate(
        6,
        (index) => QuizModel(
            availableStaffParticipants: staffs,
            confirmPassword: "111111",
            password: "111111",
            duration: "30",
            endDate: faker.date.dateTimeBetween(
                DateTime(2023, 11, 25), DateTime(2023, 11, 30)),
            endTime: const TimeOfDay(minute: 30, hour: 10),
            startTime: const TimeOfDay(minute: 45, hour: 12),
            startDate: faker.date
                .dateTimeBetween(DateTime(2023, 11, 1), DateTime(2023, 11, 5)),
            lock: faker.randomGenerator.boolean(),
            numberOfParticipants: staffs.length,
            questionNumber: questions.length,
            questions: questions,
            quizId: faker.randomGenerator.integer(100000, min: 1),
            status: faker.randomGenerator.element(['Enable', 'Disable']),
            availableStaffParticipantsType:
                faker.randomGenerator.element(["All", "Staffs", "Customers"]),
            staffTypes: List.generate(
                faker.randomGenerator.integer(2, min: 1),
                (index) =>
                    StaffType.values[faker.randomGenerator.integer(5, min: 0)]),
            title: "Quiz ${faker.lorem.word()}",
            totalParticipants: staffs.length,
            statistics: List.generate(
                staffs.length,
                (index) => QuizParticipantStatistics(
                    startDate: faker.date.dateTimeBetween(
                        DateTime(2023, 11, 6), DateTime(2023, 11, 10)),
                    duration: "30",
                    staff: staffs[index],
                    participantsId: faker.randomGenerator.integer(100000,min: 10),
                    score: faker.randomGenerator.integer(100, min: 20),
                    totalParticipants: staffs.length,
                    answeringState: QuizAnswerState(
                        falseNumber: faker.randomGenerator.integer(5),
                        trueNumber: faker.randomGenerator.integer(5),
                        unAnswered: faker.randomGenerator.integer(5),
                        participantAnswers: List.generate(
                            questions.length,
                            (index) => faker.randomGenerator
                                .integer(questions[index].answers!.length - 1, min: 0)))))));
  }
}
