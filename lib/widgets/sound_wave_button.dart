import 'package:flutter/material.dart';
import '../services/tts_service.dart';

/// 带声波动画的喇叭按钮
///
/// [text] 非空时，点击按钮会自动通过 Edge TTS 朗读该文本。
/// [onTap] 仍可单独使用，适用于外部自定义 TTS 调用场景。
///
/// 参数说明：
/// - [text]      : 要朗读的文本（非空时自动播放 TTS）
/// - [size]      : 按钮直径（默认36）
/// - [iconSize]  : 图标大小（默认 size * 0.5，可手动覆盖）
/// - [color]     : 一键设置主色（同时应用到 iconColor 和 waveColor）
/// - [iconColor] : 未播放时图标颜色（单独设置时优先于 color）
/// - [bgColor]   : 按钮背景色（未播放时）
/// - [waveColor] : 声波圆环颜色（单独设置时优先于 color）
class SoundWaveButton extends StatefulWidget {
  final String? text;
  final VoidCallback? onTap;
  final double size;
  final double? iconSize;
  final Color? color;
  final Color? iconColor;
  final Color bgColor;
  final Color? waveColor;

  const SoundWaveButton({
    super.key,
    this.text,
    this.onTap,
    this.size = 36,
    this.iconSize,
    this.color,
    this.iconColor,
    this.bgColor = Colors.white,
    this.waveColor,
  });

  @override
  State<SoundWaveButton> createState() => SoundWaveButtonState();
}

class SoundWaveButtonState extends State<SoundWaveButton>
    with TickerProviderStateMixin {
  late AnimationController _waveController;
  late AnimationController _iconController;
  late Animation<double> _iconScale;
  bool _isPlaying = false;

  // 页面级 TTS 实例（同页面多个按钮共享）
  static TtsService? _sharedTts;

  TtsService get _tts {
    _sharedTts ??= TtsService();
    return _sharedTts!;
  }

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
      _waveController.reset();
      setState(() => _isPlaying = false);
    } else {
      // 开始播放
      _waveController.repeat();
      setState(() => _isPlaying = true);
    }

    // 优先使用 onTap 回调（外部自定义场景），否则用内置 TTS
    if (widget.onTap != null) {
      widget.onTap!();
    } else if (widget.text != null && widget.text!.isNotEmpty) {
      _tts.speak(widget.text!).then((_) {
        if (mounted) stopAnimation();
      });
    }
  }

  /// 外部调用：TTS 播放完成后停止动画
  void stopAnimation() {
    if (mounted && _isPlaying) {
      _waveController.stop();
      _waveController.reset();
      setState(() => _isPlaying = false);
    }
  }

  /// 当前是否正在播放（外部可用于判断状态）
  bool get isPlaying => _isPlaying;

  @override
  Widget build(BuildContext context) {
    final double sz = widget.size;
    final Color primaryColor = widget.color ?? const Color(0xFF10B981);
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
