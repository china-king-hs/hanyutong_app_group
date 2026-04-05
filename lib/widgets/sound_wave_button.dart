import 'package:flutter/material.dart';

/// 带声波动画的喇叭按钮
/// 点击后播放声波扩散动画，模拟正在播放音频的效果
///
/// 参数说明：
/// - [size]      : 按钮直径（默认36）
/// - [iconSize]  : 图标大小（默认 size * 0.5，可手动覆盖）
/// - [color]     : 一键设置主色（同时应用到 iconColor 和 waveColor）
/// - [iconColor] : 未播放时图标颜色（单独设置时优先于 color）
/// - [bgColor]   : 按钮背景色（未播放时）
/// - [waveColor] : 声波圆环颜色（单独设置时优先于 color）
class SoundWaveButton extends StatefulWidget {
  final VoidCallback? onTap;
  final double size;
  final double? iconSize;
  final Color? color;
  final Color? iconColor;
  final Color bgColor;
  final Color? waveColor;

  const SoundWaveButton({
    super.key,
    this.onTap,
    this.size = 36,
    this.iconSize,
    this.color,
    this.iconColor,
    this.bgColor = Colors.white,
    this.waveColor,
  });

  @override
  State<SoundWaveButton> createState() => _SoundWaveButtonState();
}

class _SoundWaveButtonState extends State<SoundWaveButton>
    with TickerProviderStateMixin {
  late AnimationController _waveController;
  late AnimationController _iconController;
  late Animation<double> _iconScale;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    // 声波扩散动画（循环）
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    // 图标轻微缩放（按下弹起感）
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.85,
      upperBound: 1.0,
      value: 1.0,
    );
    _iconScale = _iconController;
  }

  @override
  void dispose() {
    _waveController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  void _handleTap() {
    // 图标按下弹起
    _iconController.reverse().then((_) => _iconController.forward());

    if (_isPlaying) {
      // 正在播放 → 停止
      _waveController.stop();
      setState(() => _isPlaying = false);
    } else {
      // 开始播放
      _waveController.repeat();
      setState(() => _isPlaying = true);
      // 模拟2秒后停止
      Future.delayed(const Duration(milliseconds: 2000), () {
        if (mounted && _isPlaying) {
          _waveController.stop();
          _waveController.reset();
          setState(() => _isPlaying = false);
        }
      });
    }

    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final double sz = widget.size;
    final Color primaryColor = widget.color ?? const Color(0xFF4285F4);
    final Color effectiveIconColor = widget.iconColor ?? primaryColor;
    final Color effectiveWaveColor = widget.waveColor ?? primaryColor;
    final double effectiveIconSize = widget.iconSize ?? sz * 0.5;
    return GestureDetector(
      onTap: _handleTap,
      child: SizedBox(
        width: sz + 24,
        height: sz + 24,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 声波圆环（两圈，错开相位）
            if (_isPlaying) ...[
              _WaveRing(
                controller: _waveController,
                baseRadius: sz / 2,
                waveColor: effectiveWaveColor,
                phaseOffset: 0.0,
              ),
              _WaveRing(
                controller: _waveController,
                baseRadius: sz / 2,
                waveColor: effectiveWaveColor,
                phaseOffset: 0.5,
              ),
            ],
            // 按钮本体
            ScaleTransition(
              scale: _iconScale,
              child: Container(
                width: sz,
                height: sz,
                decoration: BoxDecoration(
                  color: _isPlaying ? effectiveIconColor : widget.bgColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.10),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.volume_up,
                  size: effectiveIconSize,
                  color: _isPlaying ? Colors.white : effectiveIconColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 单个声波扩散圆环
class _WaveRing extends AnimatedWidget {
  final double baseRadius;
  final Color waveColor;
  final double phaseOffset;

  const _WaveRing({
    required AnimationController controller,
    required this.baseRadius,
    required this.waveColor,
    required this.phaseOffset,
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as AnimationController;
    // 让两个圆环错开相位
    double progress = (animation.value + phaseOffset) % 1.0;
    // 从基础大小扩散到2倍
    final double radius = baseRadius + progress * baseRadius * 1.2;
    // 透明度：从 0.5 渐变到 0
    final double opacity = (1.0 - progress) * 0.45;

    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: waveColor.withValues(alpha: opacity),
          width: 2.0,
        ),
      ),
    );
  }
}
