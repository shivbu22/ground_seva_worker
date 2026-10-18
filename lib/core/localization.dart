import 'package:flutter/material.dart';

class AppLocalization extends ChangeNotifier {
  Locale _currentLocale = const Locale('hi');

  Locale get currentLocale => _currentLocale;
  bool get isHindi => _currentLocale.languageCode == 'hi';

  void toggleLanguage() {
    _currentLocale = isHindi ? const Locale('en') : const Locale('hi');
    notifyListeners();
  }

  String tr(String key) {
    if (isHindi) return _hindi[key] ?? _english[key] ?? key;
    return _english[key] ?? key;
  }

  static const Map<String, String> _english = {
    'app_title': 'GroundSeva',
    'greeting': 'Namaste',
    'login_welcome': 'Welcome to GroundSeva',
    'login_subtitle': 'India\'s #1 Sanitation Worker Platform',
    'phone_label': 'Enter Mobile Number',
    'send_otp': 'Send OTP',
    'verify_otp': 'Verify OTP',
    'otp_label': 'Enter 6-digit OTP',
    'toggle_lang': 'हिंदी',

    // Bottom Nav
    'nav_home': 'Home',
    'nav_jobs': 'Jobs',
    'nav_log': 'Log',
    'nav_earnings': 'Earnings',
    'nav_more': 'More',

    // Dashboard
    'today_earnings': 'Today\'s Earnings',
    'quick_actions': 'Quick Actions',

    // ─── OPERATIONS & DUTY ───
    'attendance': 'Attendance',
    'shift_roster': 'Shift Roster',
    'route_nav': 'Route Nav',
    'gps_tracking': 'GPS Tracking',
    'daily_tasks': 'Daily Tasks',
    'supervisor_chat': 'Supervisor Chat',
    'work_log': 'Work Log',
    'leave_apply': 'Leave Apply',
    'zone_map': 'Zone Map',

    // ─── FINANCE & BENEFITS ───
    'salary_slip': 'Salary Slip',
    'pf_esi': 'PF/ESI Portal',
    'wallet': 'Wallet',
    'bonus_tracker': 'Bonus Tracker',
    'loan_advance': 'Loan/Advance',
    'tax_help': 'Tax Help',
    'insurance': 'Insurance',
    'overtime_log': 'Overtime Log',

    // ─── HEALTH & SAFETY ───
    'health_tips': 'Health Tips',
    'sick_leave': 'Sick Leave',
    'safety_gear': 'Safety Gear',
    'sos_alert': 'SOS Alert',
    'mental_health': 'Mental Health',
    'vaccination': 'Vaccination',
    'training_cert': 'Training & Certs',
    'emergency_contacts': 'Emergency Contacts',

    // ─── WASTE MANAGEMENT ───
    'smart_bin': 'Smart Bin',
    'complaints': 'Complaints',
    'before_after': 'Before/After',
    'scrap_market': 'Scrap Market',
    'recycling_center': 'Recycling Center',
    'hazard_report': 'Hazard Report',
    'eco_score': 'Eco Score',
    'carbon_footprint': 'Carbon Saved',

    // ─── COMMUNITY & ID ───
    'id_card': 'ID Card',
    'forum': 'Forum',
    'peer_chat': 'Peer Chat',
    'announcements': 'Announcements',
    'leaderboard': 'Leaderboard',
    'referral': 'Referral',
    'feedback': 'Feedback',
    'family_benefits': 'Family Benefits',
    'achievements': 'Achievements',

    // ─── UTILITY & TOOLS ───
    'weather': 'Weather',
    'night_mode': 'Night Shift',
    'documents': 'Documents',
    'quiz': 'Daily Quiz',
    'helpline': 'Helpline',
    'settings': 'Settings',
    'notification_center': 'Notifications',
    'qr_scanner': 'QR Scanner',
    'area_cleaning_status': 'Cleaning Status',
    'toilet_locator': 'Toilet Locator',
    'water_station': 'Water Station',
    'rest_zone': 'Rest Zone',
    'about': 'About',

    // ─── GROWTH & CAREER ───
    'performance_review': 'Performance',
    'digital_library': 'Library',
    'skill_upgrade': 'Skill Upgrade',
    'grievance': 'Grievance',
    'geo_fence': 'Geo Fence',
    'report_issue': 'Report Issue',
    'uniform_request': 'Uniform Request',
    'vehicle_check': 'Vehicle Check',

    // Earnings
    'base_pay': 'Base Pay',
    'waste_bonus': 'Waste Bonus',
    'login_bonus': 'Login Bonus',
    'overtime_pay': 'Overtime',
    'monthly_total': 'Monthly Total',
    'withdraw_upi': 'Withdraw to UPI',
    'transaction_history': 'Transaction History',

    // Jobs
    'accept_job': 'Accept Job',
    'distance': 'Distance',
    'pay': 'Pay',
    'log_waste': 'Log Waste',
    'nearby_jobs': 'Nearby Jobs',

    // Log Waste
    'waste_type': 'Waste Type',
    'dry_waste': 'Dry',
    'wet_waste': 'Wet',
    'metal_waste': 'Metal',
    'organic_waste': 'Organic',
    'est_weight': 'Est. Weight (kg)',
    'take_photo': 'Take Photo',
    'submit': 'Submit',
    'ai_grade': 'AI Grade',
    'bonus_est': 'Est. Bonus',
  };

  static const Map<String, String> _hindi = {
    'app_title': 'ग्राउंडसेवा',
    'greeting': 'नमस्ते',
    'login_welcome': 'ग्राउंडसेवा में आपका स्वागत है',
    'login_subtitle': 'भारत का #1 सफाई कर्मचारी प्लेटफॉर्म',
    'phone_label': 'मोबाइल नंबर दर्ज करें',
    'send_otp': 'OTP भेजें',
    'verify_otp': 'OTP सत्यापित करें',
    'otp_label': '6 अंकों का OTP दर्ज करें',
    'toggle_lang': 'English',

    'nav_home': 'होम',
    'nav_jobs': 'नौकरियां',
    'nav_log': 'लॉग',
    'nav_earnings': 'कमाई',
    'nav_more': 'और',

    'today_earnings': 'आज की कमाई',
    'quick_actions': 'त्वरित कार्य',

    // ─── OPERATIONS & DUTY ───
    'attendance': 'उपस्थिति',
    'shift_roster': 'शिफ्ट रोस्टर',
    'route_nav': 'रूट नेवि.',
    'gps_tracking': 'GPS ट्रैकिंग',
    'daily_tasks': 'दैनिक कार्य',
    'supervisor_chat': 'सुपरवाइज़र चैट',
    'work_log': 'कार्य लॉग',
    'leave_apply': 'छुट्टी आवेदन',
    'zone_map': 'ज़ोन मैप',

    // ─── FINANCE & BENEFITS ───
    'salary_slip': 'वेतन पर्ची',
    'pf_esi': 'PF/ESI',
    'wallet': 'वॉलेट',
    'bonus_tracker': 'बोनस ट्रैकर',
    'loan_advance': 'ऋण/अग्रिम',
    'tax_help': 'कर सहायता',
    'insurance': 'बीमा',
    'overtime_log': 'ओवरटाइम',

    // ─── HEALTH & SAFETY ───
    'health_tips': 'स्वास्थ्य टिप्स',
    'sick_leave': 'बीमार छुट्टी',
    'safety_gear': 'सुरक्षा गियर',
    'sos_alert': 'SOS अलर्ट',
    'mental_health': 'मानसिक स्वास्थ्य',
    'vaccination': 'टीकाकरण',
    'training_cert': 'प्रशिक्षण/प्रमाणपत्र',
    'emergency_contacts': 'आपातकालीन संपर्क',

    // ─── WASTE MANAGEMENT ───
    'smart_bin': 'स्मार्ट बिन',
    'complaints': 'शिकायतें',
    'before_after': 'पहले/बाद',
    'scrap_market': 'कबाड़ी बाज़ार',
    'recycling_center': 'रीसाइक्लिंग केंद्र',
    'hazard_report': 'खतरा रिपोर्ट',
    'eco_score': 'इको स्कोर',
    'carbon_footprint': 'कार्बन बचत',

    // ─── COMMUNITY & ID ───
    'id_card': 'पहचान पत्र',
    'forum': 'फोरम',
    'peer_chat': 'सहकर्मी चैट',
    'announcements': 'घोषणाएं',
    'leaderboard': 'लीडरबोर्ड',
    'referral': 'रेफरल',
    'feedback': 'प्रतिक्रिया',
    'family_benefits': 'पारिवारिक लाभ',
    'achievements': 'उपलब्धियां',

    // ─── UTILITY & TOOLS ───
    'weather': 'मौसम',
    'night_mode': 'रात शिफ्ट',
    'documents': 'दस्तावेज़',
    'quiz': 'क्विज़',
    'helpline': 'हेल्पलाइन',
    'settings': 'सेटिंग्स',
    'notification_center': 'सूचनाएं',
    'qr_scanner': 'QR स्कैनर',
    'area_cleaning_status': 'सफाई स्थिति',
    'toilet_locator': 'शौचालय खोजें',
    'water_station': 'पानी स्टेशन',
    'rest_zone': 'आराम क्षेत्र',
    'about': 'जानकारी',

    // ─── GROWTH & CAREER ───
    'performance_review': 'प्रदर्शन',
    'digital_library': 'पुस्तकालय',
    'skill_upgrade': 'कौशल सुधार',
    'grievance': 'शिकायत',
    'geo_fence': 'जियो फेंस',
    'report_issue': 'समस्या रिपोर्ट',
    'uniform_request': 'वर्दी अनुरोध',
    'vehicle_check': 'वाहन जांच',

    // Earnings
    'base_pay': 'मूल वेतन',
    'waste_bonus': 'कचरा बोनस',
    'login_bonus': 'लॉगिन बोनस',
    'overtime_pay': 'ओवरटाइम',
    'monthly_total': 'मासिक कुल',
    'withdraw_upi': 'UPI से निकालें',
    'transaction_history': 'लेनदेन इतिहास',

    // Jobs
    'accept_job': 'स्वीकार करें',
    'distance': 'दूरी',
    'pay': 'भुगतान',
    'log_waste': 'कचरा लॉग',
    'nearby_jobs': 'नजदीकी काम',

    // Log Waste
    'waste_type': 'कचरे का प्रकार',
    'dry_waste': 'सूखा',
    'wet_waste': 'गीला',
    'metal_waste': 'धातु',
    'organic_waste': 'जैविक',
    'est_weight': 'अनुमानित वजन (kg)',
    'take_photo': 'फोटो लें',
    'submit': 'जमा करें',
    'ai_grade': 'AI ग्रेड',
    'bonus_est': 'बोनस अनुमान',
  };
}
