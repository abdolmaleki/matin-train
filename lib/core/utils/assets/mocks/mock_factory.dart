import 'package:team_project/core/utils/assets/mocks/enum.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/absence.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/address.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/attention.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/customer.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/customer_report.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/customer_service.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/equipment.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/event.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/event_type.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/grace.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/holiday_wish.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/keikkala_shift.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/language_skill.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/license.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/limitation.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/medicine.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/mock_transportation_list.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/punishment.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/quiz.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/relative.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/report.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/reward.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/role_permission.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/shift.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/staff.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/staff_punishments.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/staff_rewards.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/ticket.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/todo.dart';
import 'package:team_project/core/utils/assets/mocks/mock_types/warning.dart';

abstract class MockData {
  factory MockData(MockType mockType) {
    switch (mockType) {
      case MockType.staffsList:
        return MockStaffList();
      case MockType.staff:
        return MockStaff();
      case MockType.customerList:
        return MockCustomerList();
      case MockType.customer:
        return MockCustomer();
      case MockType.address:
        return MockAddress();
      case MockType.addressList:
        return MockAddressList();
      case MockType.absenceList:
        return MockAbsenceList();
      case MockType.toDoList:
        return MockTodoList();
      case MockType.relativeList:
        return MockRelativeList();
      case MockType.medicineList:
        return MockMedicineList();
      case MockType.customerServiceList:
        return MockCustomerServiceList();
      case MockType.customerReportList:
        return MockCustomerReportList();
      case MockType.limitationList:
        return MockLimitationList();
      case MockType.transportationList:
        return MockTransportationList();
      case MockType.equipmentList:
        return MockEquipmentList();
      case MockType.languageSkillList:
        return MockLanguageSkillList();
      case MockType.licenseList:
        return MockLicenseList();
      case MockType.rewardList:
        return MockRewardList();
      case MockType.punishmentList:
        return MockPunishmentList();
      case MockType.reportTypeList:
        return MockReportTypeList();
      case MockType.reportCategoryList:
        return MockReportCategoryList();
      case MockType.reportList:
        return MockReportList();
      case MockType.rolePermissionList:
        return MockRolePermissionList();
      case MockType.permissionList:
        return MockPermissionList();
      case MockType.cycleVisits:
        return MockCycleVisit();
      case MockType.graceList:
        return MockGraceList();
      case MockType.warningList:
        return MockWarningList();
      case MockType.attentionList:
        return MockAttentionList();
      case MockType.eventList:
        return MockEventList();
      case MockType.eventTypeList:
        return MockEventTypeList();
      case MockType.holiday:
        return MockHolidayList();
      case MockType.holidayWishList:
        return MockHolidayWishList();
      case MockType.staffRewardList:
        return MockStaffRewardsList();
      case MockType.quizList:
        return MockQuizList();
      case MockType.ticketList:
        return MockTicketList();
      case MockType.staffPunishmentList:
        return MockStaffPunishmentsList();
      case MockType.keikkalaShiftList:
        return MockKeikkalaShiftList();
    }
  }

  dynamic getMockObject();

  dynamic getMockJson();
}
