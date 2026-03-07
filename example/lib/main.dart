import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wonzy_core_utils/wonzy_core_utils.dart';

void main() {
  runApp(const CoreUtilsExampleApp());
}

class CoreUtilsExampleApp extends StatelessWidget {
  const CoreUtilsExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'core_utils Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── Wonzy.appBar — yeni namespace API ──
      appBar: Wonzy.appBar(
        title: 'core_utils Demo',
        centerTitle: true,
        actions: [
          // ── Wonzy.button.icon ──
          Wonzy.button.icon(
            iconData: Icons.info_outline,
            onPressed: () {
              // ── Wonzy.bottomSheet.show ──
              Wonzy.bottomSheet.show(
                context,
                title: 'Hakkında',
                child: const Text(
                  'Bu uygulama wonzy_core_utils paketinin extension ve widget\'larını gösterir.',
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: [
          // ── Context Extensions ──
          _SectionTitle('Context Extensions'),
          Text(
            'Ekran: ${context.width.toStringAsFixed(0)} × ${context.height.toStringAsFixed(0)}',
          ).paddingAll(8),
          'Birincil renk'.text.bold
              .bodyLarge(context)
              .color(context.primaryColor),

          16.h, // SizedBox(height: 16) — num extension
          // ── String Extensions ──
          _SectionTitle('String Extensions'),
          Text(
            "'merhaba dunya'.capitalize() → ${'merhaba dunya'.capitalize()}",
          ).paddingAll(4),
          Text(
            "'merhaba dunya'.toTitleCase() → ${'merhaba dunya'.toTitleCase()}",
          ).paddingAll(4),
          Text(
            "'abc123'.isAlphanumeric → ${'abc123'.isAlphanumeric}",
          ).paddingAll(4),

          16.h,

          // ── Text Builder ──
          _SectionTitle('Text Builder'),
          'Zincirlenebilir Metin API'.text.bold
              .titleMedium(context)
              .color(Colors.indigo),

          24.h,

          // ── Widget Extensions ──
          _SectionTitle('Widget Extensions'),
          const Text('Yuvarlak Kutu')
              .roundedBox(
                radius: 12,
                backgroundColor: Colors.indigo.shade50,
                innerPadding: 16.all,
              )
              .paddingAll(8),

          16.h,

          // ── Wonzy.textField — yeni namespace API ──
          _SectionTitle('Wonzy.textField'),
          FormBuilder(
            child: Wonzy.textField(
              name: 'email',
              type: CustomFieldType.email,
              label: 'E-posta',
              required: true,
            ).paddingSymmetric(h: 0),
          ).paddingSymmetric(h: 0),

          16.h,

          FormBuilder(
            child: Wonzy.textField(
              name: 'password',
              type: CustomFieldType.password,
              label: 'Şifre',
              required: true,
            ),
          ),

          32.h,

          // ── Wonzy.button.standard — yeni namespace API ──
          _SectionTitle('Wonzy.button'),
          Wonzy.button
              .standard(
                text: 'Bana Bas',
                onPressed: () => 'Butona basıldı!'.debugLog(),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                borderRadius: 12,
              )
              .paddingSymmetric(h: 16),

          32.h,
        ].column(crossAxisAlignment: CrossAxisAlignment.stretch),
      ).paddingAll(16),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return title.text.bold
        .titleLarge(context)
        .color(context.primaryColor)
        .paddingOnly(top: 16, bottom: 8);
  }
}
