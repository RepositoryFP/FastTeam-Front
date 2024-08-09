import 'package:fastteam_app/presentation/attendence_log/attendence_log_screen.dart';
import 'package:fastteam_app/presentation/attendence_log/binding/attendence_detail_binding.dart';
import 'package:fastteam_app/presentation/attendence_log/binding/attendence_log_binding.dart';
import 'package:fastteam_app/presentation/attendence_log/component/detail_attendence.dart';
import 'package:fastteam_app/presentation/attendence_screen/attendence_screen.dart';
import 'package:fastteam_app/presentation/attendence_screen/binding/attendence_binding.dart';
import 'package:fastteam_app/presentation/camera_screen/binding/camera_binding.dart';
import 'package:fastteam_app/presentation/camera_screen/camera_screen.dart';
import 'package:fastteam_app/presentation/inbox_screen/binding/request_binding.dart';
import 'package:fastteam_app/presentation/inbox_screen/widget/inbox_detail_screen.dart';
import 'package:fastteam_app/presentation/leave_screen/binding/Leave_binding.dart';
import 'package:fastteam_app/presentation/leave_screen/leave_screen.dart';
import 'package:fastteam_app/presentation/list_division_screen/binding/list_division_binding.dart';
import 'package:fastteam_app/presentation/list_division_screen/list_division_screen.dart';
import 'package:fastteam_app/presentation/map_screen/binding/map_binding.dart';
import 'package:fastteam_app/presentation/map_screen/map_screen.dart';
import 'package:fastteam_app/presentation/milestone_screen/binding/milestone_binding.dart';
import 'package:fastteam_app/presentation/milestone_screen/milestone_screen.dart';
import 'package:fastteam_app/presentation/overtime_screen/binding/Employee_binding.dart';
import 'package:fastteam_app/presentation/overtime_screen/overtime_screen.dart';
import 'package:fastteam_app/presentation/payroll_info_screen/binding/payroll_info_binding.dart';
import 'package:fastteam_app/presentation/payroll_info_screen/payroll_info_screen.dart';
import 'package:fastteam_app/presentation/payslip_screen/binding/payslip_binding.dart';
import 'package:fastteam_app/presentation/payslip_screen/payslip_screen.dart';
import 'package:fastteam_app/presentation/payslip_screen/widget/payslip_validation.dart';
import 'package:fastteam_app/presentation/sertificate_screen/binding/sertificate_binding.dart';
import 'package:fastteam_app/presentation/sertificate_screen/sertificate_screen.dart';
import 'package:fastteam_app/presentation/splash_screen/splash_screen.dart';
import 'package:fastteam_app/presentation/splash_screen/binding/splash_binding.dart';
import 'package:fastteam_app/presentation/log_in_screen/log_in_screen.dart';
import 'package:fastteam_app/presentation/log_in_screen/binding/log_in_binding.dart';
import 'package:fastteam_app/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:fastteam_app/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:fastteam_app/presentation/fotgot_password_screen/fotgot_password_screen.dart';
import 'package:fastteam_app/presentation/fotgot_password_screen/binding/fotgot_password_binding.dart';
import 'package:fastteam_app/presentation/verification_screen/verification_screen.dart';
import 'package:fastteam_app/presentation/verification_screen/binding/verification_binding.dart';
import 'package:fastteam_app/presentation/reset_password_screen/reset_password_screen.dart';
import 'package:fastteam_app/presentation/reset_password_screen/binding/reset_password_binding.dart';
import 'package:fastteam_app/presentation/reset_password_success_screen/reset_password_success_screen.dart';
import 'package:fastteam_app/presentation/reset_password_success_screen/binding/reset_password_success_binding.dart';
import 'package:fastteam_app/presentation/home_container_screen/home_container_screen.dart';
import 'package:fastteam_app/presentation/home_container_screen/binding/home_container_binding.dart';
import 'package:fastteam_app/presentation/popular_centers_screen/popular_centers_screen.dart';
import 'package:fastteam_app/presentation/popular_centers_screen/binding/popular_centers_binding.dart';
// import 'package:fastteam_app/presentation/recommended_for_you_screen/recommended_for_you_screen.dart';
// import 'package:fastteam_app/presentation/recommended_for_you_screen/binding/recommended_for_you_binding.dart';
import 'package:fastteam_app/presentation/top_rated_screen/top_rated_screen.dart';
import 'package:fastteam_app/presentation/top_rated_screen/binding/top_rated_binding.dart';
import 'package:fastteam_app/presentation/filter_result_screen/filter_result_screen.dart';
import 'package:fastteam_app/presentation/filter_result_screen/binding/filter_result_binding.dart';
import 'package:fastteam_app/presentation/profile_screen/profile_screen.dart';
import 'package:fastteam_app/presentation/profile_screen/binding/profile_binding.dart';
import 'package:fastteam_app/presentation/profile_details_screen/profile_details_screen.dart';
import 'package:fastteam_app/presentation/profile_details_screen/binding/profile_details_binding.dart';
import 'package:fastteam_app/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:fastteam_app/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:fastteam_app/presentation/notifications_screen/binding/notifications_binding.dart';
import 'package:fastteam_app/presentation/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:fastteam_app/presentation/privacy_policy_screen/binding/privacy_policy_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String gridScreen = '/grid_screen';

  static const String onboarding1Screen = '/onboarding_1_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String logInScreen = '/log_in_screen';

  static const String logInWithErrorScreen = '/log_in_with_error_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String fotgotPasswordScreen = '/fotgot_password_screen';

  static const String verificationScreen = '/verification_screen';

  static const String verificationCodeErrorScreen =
      '/verification_code_error_screen';

  static const String resetPasswordScreen = '/reset_password_screen';

  static const String resetPasswordTwoScreen = '/reset_password_two_screen';

  static const String resetPasswordSuccessScreen =
      '/reset_password_success_screen';

  static const String citySelcetionScreen = '/city_selcetion_screen';

  static const String homePage = '/home_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String popularCentersScreen = '/popular_centers_screen';

  static const String recommendedForYouScreen = '/recommended_for_you_screen';

  static const String topRatedScreen = '/top_rated_screen';

  static const String filterResultScreen = '/filter_result_screen';

  static const String serviceDetailScreen = '/service_detail_screen';

  static const String emptyMyVehicleOneScreen = '/empty_my_vehicle_one_screen';

  static const String addCarDetailsOneScreen = '/add_car_details_one_screen';

  static const String addCarDetailsTwoScreen = '/add_car_details_two_screen';

  static const String bookAWashScreen = '/book_a_wash_screen';

  static const String paymentMethodOneScreen = '/payment_method_one_screen';

  static const String reviewsScreen = '/reviews_screen';

  static const String customerReviewsScreen = '/customer_reviews_screen';

  static const String locationAccessPage = '/location_access_page';

  static const String locationMapScreen = '/location_map_screen';

  static const String locationWithSelectScreen = '/location_with_select_screen';

  static const String locationWithSelectOneScreen =
      '/location_with_select_one_screen';

  static const String bookingUpcomingScreen = '/booking_upcoming_screen';

  static const String bookingDetailsScreen = '/booking_details_screen';

  static const String completeBookingDetailsScreen =
      '/complete_booking_details_screen';

  static const String ourReviewsScreen = '/our_reviews_screen';

  static const String ourReviewsSuccessScreen = '/our_reviews_success_screen';

  static const String profileScreen = '/profile_screen';

  static const String profileDetailsScreen = '/profile_details_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String emptyPaymentMethodScreen = '/empty_payment_method_screen';

  static const String addPaymentMethodScreen = '/add_payment_method_screen';

  static const String addPaymentMethodActiveScreen =
      '/add_payment_method_active_screen';

  static const String paymentMethodScreen = '/payment_method_screen';

  static const String emptyMyVehicleScreen = '/empty_my_vehicle_screen';

  static const String addCarDetailsScreen = '/add_car_details_screen';

  static const String addCarDetailsThreeScreen =
      '/add_car_details_three_screen';

  static const String myVehicleScreen = '/my_vehicle_screen';

  static const String emptyNotificationsScreen = '/empty_notifications_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String privacyPolicyScreen = '/privacy_policy_screen';

  static const String logOutScreen = '/log_out_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String attendenceLog = '/attendence_log';

  static const String map = '/map';

  static const String camera = '/camera';

  static const String attendenceDetail = '/attendence_detail';

  static const String payslipValidation = '/payslip_validation';

  static const String payslip = '/payslip';

  static const String milestone = '/milestone';

  static const String inbox = '/inbox';

  static const String attendenceApproval = '/attendence_approval';

  static const String leaveApproval = '/leave_approval';

  static const String overtimeApproval = '/overtime_approval';

  static const String listDivision = '/list_division';

  static const String payrollInfo = '/payroll_info';

  static const String sertificate = '/sertificate';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: logInScreen,
      page: () => LogInScreen(),
      bindings: [
        LogInBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: fotgotPasswordScreen,
      page: () => FotgotPasswordScreen(),
      bindings: [
        FotgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: verificationScreen,
      page: () => VerificationScreen(),
      bindings: [
        VerificationBinding(),
      ],
    ),
    GetPage(
      name: resetPasswordScreen,
      page: () => ResetPasswordScreen(),
      bindings: [
        ResetPasswordBinding(),
      ],
    ),
    GetPage(
      name: resetPasswordSuccessScreen,
      page: () => ResetPasswordSuccessScreen(),
      bindings: [
        ResetPasswordSuccessBinding(),
      ],
    ),
    GetPage(
      name: homeContainerScreen,
      page: () => HomeContainerScreen(),
      bindings: [
        HomeContainerBinding(),
      ],
    ),
    GetPage(
      name: popularCentersScreen,
      page: () => PopularCentersScreen(),
      bindings: [
        PopularCentersBinding(),
      ],
    ),
    // GetPage(
    //   name: recommendedForYouScreen,
    //   page: () => RecommendedForYouScreen(),
    //   bindings: [
    //     RecommendedForYouBinding(),
    //   ],
    // ),
    GetPage(
      name: topRatedScreen,
      page: () => TopRatedScreen(),
      bindings: [
        TopRatedBinding(),
      ],
    ),
    GetPage(
      name: filterResultScreen,
      page: () => FilterResultScreen(),
      bindings: [
        FilterResultBinding(),
      ],
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
      bindings: [
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: profileDetailsScreen,
      page: () => ProfileDetailsScreen(),
      bindings: [
        ProfileDetailsBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
      bindings: [
        PrivacyPolicyBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: attendenceLog,
      page: () => AttendenceLogScreen(),
      bindings: [
        AttendenceLogBinding(),
      ],
    ),
    GetPage(
      name: map,
      page: () => MapScreen(),
      bindings: [
        MapBinding(),
      ],
    ),
    GetPage(
      name: camera,
      page: () => CameraScreen(),
      bindings: [
        CameraBinding(),
      ],
    ),
    GetPage(
      name: attendenceDetail,
      page: () => AttendenceDetailScreen(),
      bindings: [
        AttendenceDetailBinding(),
      ],
    ),
    GetPage(
      name: payslipValidation,
      page: () => PayslipValidationScreen(),
      bindings: [
        PayslipBinding(),
      ],
    ),
    GetPage(
      name: payslip,
      page: () => payslipScreen(),
      bindings: [
        PayslipBinding(),
      ],
    ),
    GetPage(
      name: milestone,
      page: () => MilestoneScreen(),
      bindings: [
        MilestoneBinding(),
      ],
    ),
    GetPage(
      name: attendenceApproval,
      page: () => AttendenceScreen(),
      bindings: [
        AttendenceBinding(),
      ],
    ),
    GetPage(
      name: leaveApproval,
      page: () => LeaveScreen(),
      bindings: [
        LeaveBinding(),
      ],
    ),
    GetPage(
      name: overtimeApproval,
      page: () => OvertimeScreen(),
      bindings: [
        OvertimeBinding(),
      ],
    ),
    GetPage(
      name: listDivision,
      page: () => ListDivisionScreen(),
      bindings: [
        ListDivisionBinding(),
      ],
    ),
    GetPage(
      name: payrollInfo,
      page: () => PayrollInfoScreen(),
      bindings: [
        PayrollInfoBinding(),
      ],
    ),
    GetPage(
      name: sertificate,
      page: () => SertificateScreen(),
      bindings: [
        SertificateBinding(),
      ],
    ),
  ];
}
