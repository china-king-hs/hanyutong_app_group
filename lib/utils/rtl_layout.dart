// RTL布局工具类
// 为波斯语和阿拉伯语提供全面的RTL支持

import 'package:flutter/material.dart';
import '../config/app_languages.dart';

/// RTL布局相关工具类
class RtlLayout {
  /// 检查当前语言是否为RTL
  static bool isRTL(BuildContext context, String languageCode) {
    return languageCode == 'fa' || languageCode == 'ar';
  }

  /// 获取文字方向
  static TextDirection getTextDirection(String languageCode) {
    return isRTLByCode(languageCode) ? TextDirection.rtl : TextDirection.ltr;
  }

  /// 根据语言代码检查是否为RTL
  static bool isRTLByCode(String languageCode) {
    return languageCode == 'fa' || languageCode == 'ar';
  }

  /// 获取对齐方式
  static AlignmentGeometry getAlignment(String languageCode) {
    return isRTLByCode(languageCode) ? Alignment.centerRight : Alignment.centerLeft;
  }

  /// 获取开始对齐方式
  static AlignmentGeometry getStartAlignment(String languageCode) {
    return isRTLByCode(languageCode) ? Alignment.centerRight : Alignment.centerLeft;
  }

  /// 获取结束对齐方式
  static AlignmentGeometry getEndAlignment(String languageCode) {
    return isRTLByCode(languageCode) ? Alignment.centerLeft : Alignment.centerRight;
  }

  /// 镜像图标（如果当前语言是RTL）
  static IconData mirrorIconIfRTL(IconData icon, String languageCode) {
    if (!isRTLByCode(languageCode)) return icon;

    // 常用图标的镜像映射
    final mirroredIcons = {
      Icons.arrow_back: Icons.arrow_forward,
      Icons.arrow_forward: Icons.arrow_back,
      Icons.chevron_left: Icons.chevron_right,
      Icons.chevron_right: Icons.chevron_left,
      Icons.menu: Icons.menu, // 菜单图标通常不需要镜像
      Icons.arrow_back_ios: Icons.arrow_forward_ios,
      Icons.arrow_forward_ios: Icons.arrow_back_ios,
    };

    return mirroredIcons[icon] ?? icon;
  }

  /// 为RTL语言调整边距
  static EdgeInsetsGeometry adjustPaddingForRTL(
    EdgeInsetsGeometry padding,
    String languageCode,
  ) {
    if (!isRTLByCode(languageCode)) return padding;

    // 对于RTL语言，左右边距需要交换
    if (padding is EdgeInsets) {
      return EdgeInsets.fromLTRB(
        padding.right,
        padding.top,
        padding.left,
        padding.bottom,
      );
    }
    return padding;
  }

  /// 为RTL语言调整对齐方式
  static CrossAxisAlignment adjustCrossAxisAlignmentForRTL(
    CrossAxisAlignment alignment,
    String languageCode,
  ) {
    if (!isRTLByCode(languageCode)) return alignment;

    // 对于RTL语言，交叉轴对齐方式需要调整
    switch (alignment) {
      case CrossAxisAlignment.start:
        return CrossAxisAlignment.end;
      case CrossAxisAlignment.end:
        return CrossAxisAlignment.start;
      default:
        return alignment;
    }
  }

  /// 为RTL语言调整主轴对齐方式
  static MainAxisAlignment adjustMainAxisAlignmentForRTL(
    MainAxisAlignment alignment,
    String languageCode,
  ) {
    if (!isRTLByCode(languageCode)) return alignment;

    // 对于RTL语言，主轴对齐方式需要调整
    switch (alignment) {
      case MainAxisAlignment.start:
        return MainAxisAlignment.end;
      case MainAxisAlignment.end:
        return MainAxisAlignment.start;
      default:
        return alignment;
    }
  }

  /// 创建支持RTL的文本
  static Widget rtlAwareText(
    String text, {
    required String languageCode,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return Text(
      text,
      style: style,
      textAlign: textAlign ?? (isRTLByCode(languageCode) ? TextAlign.right : TextAlign.left),
      textDirection: getTextDirection(languageCode),
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  /// 创建支持RTL的按钮
  static Widget rtlAwareButton({
    required Widget child,
    required VoidCallback onPressed,
    required String languageCode,
    ButtonStyle? style,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Directionality(
        textDirection: getTextDirection(languageCode),
        child: child,
      ),
    );
  }

  /// 创建支持RTL的行
  static Widget rtlAwareRow({
    required List<Widget> children,
    required String languageCode,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) {
    return Row(
      children: isRTLByCode(languageCode) ? children.reversed.toList() : children,
      mainAxisAlignment: adjustMainAxisAlignmentForRTL(mainAxisAlignment, languageCode),
      crossAxisAlignment: adjustCrossAxisAlignmentForRTL(crossAxisAlignment, languageCode),
      mainAxisSize: mainAxisSize,
      textDirection: textDirection ?? getTextDirection(languageCode),
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
    );
  }

  /// 创建支持RTL的列
  static Widget rtlAwareColumn({
    required List<Widget> children,
    required String languageCode,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) {
    return Column(
      children: children,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: adjustCrossAxisAlignmentForRTL(crossAxisAlignment, languageCode),
      mainAxisSize: mainAxisSize,
      textDirection: textDirection ?? getTextDirection(languageCode),
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
    );
  }
}

/// RTL布局包装器
class RtlLayoutWrapper extends StatelessWidget {
  final Widget child;
  final String languageCode;

  const RtlLayoutWrapper({
    super.key,
    required this.child,
    required this.languageCode,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: RtlLayout.getTextDirection(languageCode),
      child: child,
    );
  }
}