import 'package:get/get.dart';
import 'package:rill_repository/Utils/app_routes.dart';
import 'package:rill_repository/ui/authentication/app_pin_screen.dart';
import 'package:rill_repository/ui/dashboard/view/notification_screen.dart';
import 'package:rill_repository/ui/dashboard/view/profile_screen.dart';
import 'package:rill_repository/ui/home_screen/view/homescreen.dart';
import 'package:rill_repository/ui/investment/bind/investment_form_binding.dart';
import 'package:rill_repository/ui/investment/view/club_details_screenRpc.dart';
import 'package:rill_repository/ui/investment/view/rfc/rfc_installment_payment_multiple.dart';
import 'package:rill_repository/ui/investment/view/investment_plan_screen.dart';
import 'package:rill_repository/ui/investment/view/invoice_screen.dart';
import 'package:rill_repository/ui/investment/view/updatekyc_screen.dart';
import 'package:rill_repository/ui/kyc_form/bind/kyc_form_binding.dart';
import 'package:rill_repository/ui/kyc_form/view/kyc_details_form.dart';
import 'package:rill_repository/ui/kyc_form/view/personal_details_screen.dart';
import 'package:rill_repository/ui/login_screen/bind/login_bind.dart';
import 'package:rill_repository/ui/onboarding_screen.dart/bind/onboard_binding.dart';
import 'package:rill_repository/ui/onboarding_screen.dart/view/onboarding_view.dart';
import 'package:rill_repository/ui/otp_screen/bind/otp_verification_controller.dart';
import 'package:rill_repository/ui/otp_screen/view/otp_verification.dart';
import 'package:rill_repository/ui/previlege_card/view/online_payment_screen.dart';
import 'package:rill_repository/ui/previlege_card/view/payment_method_screen.dart';
import 'package:rill_repository/ui/previlege_card/view/payment_success_screen.dart';
import 'package:rill_repository/ui/signup_screen/bind/signup_controller.dart';
import 'package:rill_repository/ui/signup_screen/view/signup_screen.dart';
import 'package:rill_repository/ui/splash_screen/bind/splash_binding.dart';
import 'package:rill_repository/ui/splash_screen/view/splash_view.dart';
import '../ui/authentication/auth_binding.dart';
import '../ui/home_screen/bind/homescreen_binding.dart';
import '../ui/investment/view/club_details_screen.dart';
import '../ui/investment/view/founders_club_form.dart';
import '../ui/investment/view/rpc/payment_mode_screen_rpc.dart';
import '../ui/investment/view/rfc/rfc_installment_payment_one_time.dart';

import '../ui/investment/view/rfc/payment_mode_screen_rfc.dart';
import '../ui/investment/view/rpc/rpc_installment_payment_multiple.dart';
import '../ui/investment/view/rpc/rpc_installment_payment_one_time.dart';
import '../ui/investment/view/view_investment.dart';
import '../ui/login_screen/view/login_view.dart';
import '../ui/previlege_card/bind/privilege_card_binding.dart';
import '../ui/previlege_card/view/personal_details_screen.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashView(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.authentication,
        page: () => const Authentication(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.onboarding,
        page: () => const OnboardingView(),
        binding: OnboardBinding()),
    GetPage(
        name: Routes.login,
        page: () => const LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.otpverify,
        page: () => const OtpVerificationScreen(),
        binding: OtpVerificationBinding()),
    // GetPage(
    //     name: Routes.emailverify,
    //     page: () => EmailVerificationScreen(),
    //     binding: OtpVerificationBinding()),
    GetPage(
        name: Routes.signup,
        page: () => const SignupScreen(),
        binding: SignupBinding()),
    GetPage(
        name: Routes.homescreen,
        page: () => const HomeScreen(),
        binding: HomeScreenBinding()),
    GetPage(
        name: Routes.profilescreen,
        page: () => const ProfileScreen(),
        binding: HomeScreenBinding()),
    GetPage(
        name: Routes.notificationscreen,
        page: () =>  NotificationScreen(),
        binding: HomeScreenBinding()),
    GetPage(
        name: Routes.kycscreen1,
        page: () => const PersonalDetailsScreen(),
        binding: KycFormBinding()),
    GetPage(
        name: Routes.kycscreen2,
        page: () => const KycDetailsForm(),
        binding: KycFormBinding()),
    GetPage(
        name: Routes.personaldetails,
        page: () => const DetailsScreen(),
        binding: PrivilegeCardBinding()),
    GetPage(
        name: Routes.paymentmethod,
        page: () => const PaymentMethodScreen(),
        binding: PrivilegeCardBinding()),
    GetPage(
        name: Routes.onlinepayment,
        page: () => const OnlinePaymentScreen(),
        binding: PrivilegeCardBinding()),
    GetPage(
        name: Routes.paymentsuccess,
        page: () => const PaymentSuccessScreen(),
        binding: PrivilegeCardBinding()),
    GetPage(
      name: Routes.foundersclub,
      page: () => const FoundersClubScreen(),
      binding: InvestmentFormBinding(),
    ),
    GetPage(
        name: Routes.updatekyc,
        page: () => const UpdateKycScreen(),
        binding: InvestmentFormBinding()),
    GetPage(
        name: Routes.investmentplan,
        page: () => const InvestmentPlanScreen(),
        binding: InvestmentFormBinding()),
    GetPage(
        name: Routes.paymentmodeRfc,
        page: () => const PaymentModeScreenRfc(),
        binding: InvestmentFormBinding()),
    GetPage(
        name: Routes.paymentmodeRpc,
        page: () => const PaymentModeScreenRpc(),
        binding: InvestmentFormBinding()),
    GetPage(
        name: Routes.viewinvestment,
        page: () => const ViewInvestmentScreen(),
        binding: InvestmentFormBinding()),
    GetPage(
        name: Routes.clubdetails,
        page: () => ClubDetailsScreen(),
        binding: InvestmentFormBinding()),
    GetPage(
        name: Routes.clubdetailsRpc,
        page: () => const ClubDetailsScreenRpc(),
        binding: InvestmentFormBinding()),
    GetPage(
        name: Routes.invoicescreen,
        page: () => const InvoiceScreen(),
        binding: InvestmentFormBinding()),
    GetPage(
        name: Routes.torfcOneTime,
        page: () => const RfcOneTime(),
        binding: InvestmentFormBinding()),
    GetPage(
        name: Routes.torpcOneTime,
        page: () => const RpcOneTime(),
        binding: InvestmentFormBinding()),
    GetPage(
        name: Routes.torfcInstallments,
        page: () => const RfcInstalments(),
        binding: InvestmentFormBinding()),
    GetPage(
        name: Routes.torpcInstallments,
        page: () => const RpcInstalments(),
        binding: InvestmentFormBinding()),
  ];
}
