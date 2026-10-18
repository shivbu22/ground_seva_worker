import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/localization.dart';
import '../../../core/theme.dart';

class EarningsTab extends StatelessWidget {
  const EarningsTab({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<AppLocalization>(context); // Observe for rebuilds on language change

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── BALANCE HERO CARD ───
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: AppTheme.heroGradient,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [BoxShadow(color: AppTheme.primary.withAlpha(40), blurRadius: 30, offset: const Offset(0, 10))],
            ),
            child: Column(
              children: [
                Text('Total Balance / कुल शेष',
                    style: GoogleFonts.plusJakartaSans(fontSize: 14, color: Colors.white.withAlpha(200))),
                const SizedBox(height: 8),
                Text('₹12,450', style: GoogleFonts.plusJakartaSans(
                    fontSize: 48, fontWeight: FontWeight.w800, color: Colors.white)),
                const SizedBox(height: 20),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(30),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.white.withAlpha(30)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.account_balance, color: Colors.white, size: 20),
                          const SizedBox(width: 8),
                          Text('Withdraw to UPI / UPI निकासी',
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ─── TODAY'S BREAKDOWN ───
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
            child: Text("Today's Breakdown / आज का विवरण",
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.onSurface)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildBreakdownCard('Base Pay', '₹200', Icons.work_outline, AppTheme.primary),
                const SizedBox(width: 10),
                _buildBreakdownCard('Waste Bonus', '₹150', Icons.recycling, AppTheme.earningGold),
                const SizedBox(width: 10),
                _buildBreakdownCard('Login', '₹100', Icons.login, AppTheme.secondary),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ─── WEEKLY CHART ───
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Text('Weekly Earnings / साप्ताहिक कमाई',
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.onSurface)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(20),
            decoration: AppTheme.glassCard(opacity: 0.1, radius: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildBar('Mon', 0.5, false),
                _buildBar('Tue', 0.7, false),
                _buildBar('Wed', 0.85, false),
                _buildBar('Thu', 0.6, false),
                _buildBar('Fri', 0.9, false),
                _buildBar('Sat', 1.0, true),
                _buildBar('Sun', 0.3, false),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ─── TRANSACTIONS ───
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Text('Recent Transactions / हाल के लेन-देन',
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.onSurface)),
          ),
          _buildTransaction('Waste Bonus - Grade B', '+₹30', Icons.recycling, AppTheme.primary, true),
          _buildTransaction('Street Sweep Completed', '+₹200', Icons.cleaning_services, AppTheme.secondary, true),
          _buildTransaction('UPI Withdrawal', '-₹5,000', Icons.account_balance, AppTheme.earningGold, false),
          _buildTransaction('Login Bonus', '+₹100', Icons.login, AppTheme.primary, true),
          _buildTransaction('Overtime Pay', '+₹300', Icons.timer, AppTheme.infoBlue, true),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildBreakdownCard(String label, String amount, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: color.withAlpha(30)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withAlpha(20),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(height: 10),
            Text(amount, style: GoogleFonts.plusJakartaSans(
                fontSize: 20, fontWeight: FontWeight.w800, color: color)),
            const SizedBox(height: 4),
            Text(label, style: GoogleFonts.plusJakartaSans(
                fontSize: 11, fontWeight: FontWeight.w600, color: AppTheme.onSurfaceVariant),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(String day, double ratio, bool isToday) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 100 * ratio,
          decoration: BoxDecoration(
            gradient: isToday ? AppTheme.primaryGradient : null,
            color: isToday ? null : AppTheme.primaryContainer.withAlpha(60),
            borderRadius: BorderRadius.circular(8),
            boxShadow: isToday ? [BoxShadow(color: AppTheme.primary.withAlpha(40), blurRadius: 10)] : null,
          ),
        ),
        const SizedBox(height: 8),
        Text(day, style: GoogleFonts.plusJakartaSans(
            fontSize: 11, fontWeight: isToday ? FontWeight.w700 : FontWeight.w500,
            color: isToday ? AppTheme.primary : AppTheme.outline)),
      ],
    );
  }

  Widget _buildTransaction(String title, String amount, IconData icon, Color color, bool isCredit) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.glassCard(opacity: 0.08, radius: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withAlpha(20),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(title, style: GoogleFonts.plusJakartaSans(
                fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.onSurface)),
          ),
          Text(amount, style: GoogleFonts.plusJakartaSans(
              fontSize: 16, fontWeight: FontWeight.w700,
              color: isCredit ? AppTheme.primary : AppTheme.earningGold)),
        ],
      ),
    );
  }
}
