import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../core/theme.dart';
import '../core/localization.dart';
import '../services/supabase_service.dart';
import 'home/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _otpSent = false;
  bool _loading = false;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = Provider.of<AppLocalization>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppTheme.surfaceContainerLow, AppTheme.surface, AppTheme.surfaceContainerLowest],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.08),

                // Eco Logo with glow
                AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    return Container(
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [AppTheme.primaryContainer, AppTheme.primary],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primary.withAlpha((60 + (_pulseController.value * 40)).round()),
                            blurRadius: 40 + (_pulseController.value * 20),
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.eco, size: 56, color: AppTheme.onPrimaryContainer),
                    );
                  },
                ),
                const SizedBox(height: 24),

                // App Name
                Text('GroundSeva',
                    style: GoogleFonts.plusJakartaSans(
                        fontSize: 36, fontWeight: FontWeight.w800, color: AppTheme.primary)),
                const SizedBox(height: 4),
                Text('Worker / कर्मचारी',
                    style: GoogleFonts.plusJakartaSans(
                        fontSize: 16, fontWeight: FontWeight.w500, color: AppTheme.onSurfaceVariant)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryContainer.withAlpha(60),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text('🌿 Eco Sanitation Platform',
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.secondary)),
                ),

                SizedBox(height: size.height * 0.06),

                // Login Card - Glassmorphism
                Container(
                  padding: const EdgeInsets.all(28),
                  decoration: AppTheme.glassCard(opacity: 0.15, radius: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(loc.tr('login'),
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 24, fontWeight: FontWeight.w700, color: AppTheme.onSurface)),
                      const SizedBox(height: 4),
                      Text('Enter your mobile number / मोबाइल नंबर दर्ज करें',
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 13, color: AppTheme.onSurfaceVariant)),
                      const SizedBox(height: 28),

                      // Phone Input
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppTheme.outlineVariant.withAlpha(60)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryContainer.withAlpha(30),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                              ),
                              child: Text('+91', style: GoogleFonts.plusJakartaSans(
                                  fontSize: 17, fontWeight: FontWeight.w700, color: AppTheme.primary)),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 17, fontWeight: FontWeight.w600, color: AppTheme.onSurface),
                                decoration: InputDecoration(
                                  hintText: 'Mobile Number',
                                  border: InputBorder.none,
                                  filled: false,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                                  hintStyle: GoogleFonts.plusJakartaSans(color: AppTheme.outline),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      if (_otpSent) ...[
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppTheme.outlineVariant.withAlpha(60)),
                          ),
                          child: TextField(
                            controller: _otpController,
                            keyboardType: TextInputType.number,
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 24, fontWeight: FontWeight.w700,
                                color: AppTheme.primary, letterSpacing: 12),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: '● ● ● ● ● ●',
                              border: InputBorder.none,
                              filled: false,
                              contentPadding: const EdgeInsets.symmetric(vertical: 18),
                              hintStyle: GoogleFonts.plusJakartaSans(
                                  color: AppTheme.outline, letterSpacing: 8),
                            ),
                          ),
                        ),
                      ],

                      const SizedBox(height: 28),

                      // Action Button
                      _buildGradientButton(
                        label: _otpSent ? 'Verify OTP / ओटीपी सत्यापित करें' : 'Send OTP / ओटीपी भेजें',
                        icon: _otpSent ? Icons.verified : Icons.sms,
                        loading: _loading,
                        onTap: _otpSent ? _verifyOtp : _sendOtp,
                      ),

                      if (_otpSent) ...[
                        const SizedBox(height: 16),
                        Center(
                          child: TextButton(
                            onPressed: () => setState(() => _otpSent = false),
                            child: Text('Change Number / नंबर बदलें',
                                style: GoogleFonts.plusJakartaSans(
                                    color: AppTheme.primary, fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Language Toggle
                InkWell(
                  onTap: () => loc.toggleLanguage(),
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: AppTheme.glassCard(opacity: 0.1, radius: 100),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.translate, size: 18, color: AppTheme.primary),
                        const SizedBox(width: 8),
                        Text(loc.tr('toggle_lang'),
                            style: GoogleFonts.plusJakartaSans(
                                color: AppTheme.primary, fontWeight: FontWeight.w600, fontSize: 14)),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientButton({
    required String label,
    required IconData icon,
    required bool loading,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: loading ? null : onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: AppTheme.primary.withAlpha(50), blurRadius: 20, offset: const Offset(0, 6)),
            ],
          ),
          child: loading
              ? const Center(child: SizedBox(width: 24, height: 24,
                  child: CircularProgressIndicator(color: AppTheme.onPrimaryContainer, strokeWidth: 2.5)))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: AppTheme.onPrimaryContainer, size: 22),
                    const SizedBox(width: 10),
                    Text(label, style: GoogleFonts.plusJakartaSans(
                        fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.onPrimaryContainer)),
                  ],
                ),
        ),
      ),
    );
  }

  void _sendOtp() async {
    if (_phoneController.text.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Enter valid 10-digit number', style: GoogleFonts.plusJakartaSans()),
        backgroundColor: AppTheme.errorContainer,
      ));
      return;
    }
    setState(() => _loading = true);
    await Provider.of<SupabaseService>(context, listen: false).sendOtp(_phoneController.text);
    setState(() { _loading = false; _otpSent = true; });
  }

  void _verifyOtp() async {
    setState(() => _loading = true);
    final success = await Provider.of<SupabaseService>(context, listen: false)
        .verifyOtp(_phoneController.text, _otpController.text);
    setState(() => _loading = false);
    if (success && mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DashboardScreen()));
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invalid OTP. Try 123456', style: GoogleFonts.plusJakartaSans()),
        backgroundColor: AppTheme.errorContainer,
      ));
    }
  }
}
