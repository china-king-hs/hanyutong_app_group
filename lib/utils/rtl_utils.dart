/// RTL 语言工具类
/// 用于处理从右向左书写的语言（波斯语、阿拉伯语）

import 'package:flutter/material.dart';

// RTL 语言代码列表
const rtlLanguages = {'fa', 'ar'};

/// 检查是否为 RTL 语言
bool isRTL(String languageCode) {
  return rtlLanguages.contains(languageCode);
}

/// 获取文字方向
TextDirection getTextDirection(String languageCode) {
  return isRTL(languageCode) ? TextDirection.rtl : TextDirection.ltr;
}

/// 获取水平对齐方式
AlignmentGeometry getHorizontalAlignment(String languageCode) {
  return isRTL(languageCode) ? Alignment.centerRight : Alignment.centerLeft;
}

/// 获取 Flex 布局方向
MainAxisAlignment getMainAxisAlignment(String languageCode) {
  return isRTL(languageCode) ? MainAxisAlignment.end : MainAxisAlignment.start;
}

/// 获取 Cross 对齐方式
CrossAxisAlignment getCrossAxisAlignment(String languageCode) {
  return isRTL(languageCode) ? CrossAxisAlignment.end : CrossAxisAlignment.start;
}

/// 镜像图标（用于 RTL 语言的返回按钮等）
Widget mirrorIconIfRTL(IconData icon, String languageCode, {double? size, Color? color}) {
  if (isRTL(languageCode)) {
    return Transform.flip(
      flipX: true,
      child: Icon(icon, size: size, color: color),
    );
  }
  return Icon(icon, size: size, color: color);
}

/// 获取合适的间距顺序（用于 Row/Column 中的子元素）
List<Widget> getOrderedChildren(List<Widget> children, String languageCode, {bool reverse = false}) {
  if (isRTL(languageCode) && reverse) {
    return children.reversed.toList();
  }
  return children;
}

/// 获取带 RTL 支持的文本小部件
Widget rtlText(
  String text,
  String languageCode, {
  TextStyle? style,
  TextAlign? textAlign,
  TextOverflow? overflow,
  int? maxLines,
  bool? softWrap,
}) {
  return Text(
    text,
    textDirection: getTextDirection(languageCode),
    style: style,
    textAlign: textAlign ?? (isRTL(languageCode) ? TextAlign.right : TextAlign.left),
    overflow: overflow,
    maxLines: maxLines,
    softWrap: softWrap,
  );
}