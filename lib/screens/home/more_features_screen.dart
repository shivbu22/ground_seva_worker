import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/localization.dart';
import '../../core/theme.dart';
import '../../core/feature_registry.dart';
import '../features/feature_pages.dart';

class MoreFeaturesScreen extends StatelessWidget {
  const MoreFeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = Provider.of<AppLocalization>(context);
    final categories = FeatureRegistry.categories;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Text('All Features / सभी सुविधाएं',
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 22, fontWeight: FontWeight.w800, color: AppTheme.onSurface)),
          ),
          ...categories.entries.map((entry) => _buildCategory(context, entry.key, entry.value, loc)),
        ],
      ),
    );
  }

  Widget _buildCategory(BuildContext ctx, String category, List<FeatureItem> features, AppLocalization loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: Row(
            children: [
              Container(width: 4, height: 20,
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.circular(2),
                )),
              const SizedBox(width: 10),
              Text(category, style: GoogleFonts.plusJakartaSans(
                  fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.primary)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 4, crossAxisSpacing: 4, childAspectRatio: 0.78,
            ),
            itemCount: features.length,
            itemBuilder: (context, i) {
              final f = features[i];
              return InkWell(
                onTap: () {
                  final page = FeaturePages.getPage(f.key, loc);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => page));
                },
                borderRadius: BorderRadius.circular(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: f.color.withAlpha(20),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: f.color.withAlpha(30)),
                      ),
                      child: Icon(f.icon, color: f.color, size: 24),
                    ),
                    const SizedBox(height: 8),
                    Text(loc.tr(f.key),
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 11, fontWeight: FontWeight.w600, color: AppTheme.onSurfaceVariant),
                        textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
