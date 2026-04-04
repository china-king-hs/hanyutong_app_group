import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/// 全局状态，对应 React 版本的 AppContext
class AppState extends ChangeNotifier {
  // ---------- 用户设置 ----------
  String _language = 'en';
  String _level = 'beginner';
  int _dailyGoal = 15;
  bool _isOnboarded = false;
  String _username = '';

  // ---------- 学习统计 ----------
  int _streak = 0;
  int _totalDays = 0;
  int _totalHours = 0;
  int _masteredWords = 68;
  int _masteredSentences = 42;
  int _masteredAdvanced = 15;

  // ---------- 今日学习时长 ----------
  int _learningTime = 0;
  bool _showGoalPopup = false;

  // ---------- 计时器相关 ----------
  DateTime? _sessionStartTime; // 本次学习会话开始时间
  DateTime? _lastLearningDate; // 上次学习日期,用于计算连续天数
  bool _goalReachedToday = false; // 今天是否已达成目标

  // ---------- 收藏 ----------
  Set<String> _favorites = {};

  // ---------- 已掌握词语 ----------
  Set<String> _masteredWordIds = {};

  // ---------- Getters ----------
  String get language => _language;
  String get level => _level;
  int get dailyGoal => _dailyGoal;
  bool get isOnboarded => _isOnboarded;
  String get username => _username.isEmpty ? 'Learner' : _username;
  int get streak => _streak;
  int get totalDays => _totalDays;
  int get totalHours => _totalHours;
  int get masteredWords => _masteredWords;
  int get masteredSentences => _masteredSentences;
  int get masteredAdvanced => _masteredAdvanced;
  int get learningTime => _learningTime;
  bool get showGoalPopup => _showGoalPopup;
  Set<String> get favorites => _favorites;
  Set<String> get masteredWordIds => _masteredWordIds;

  // ---------- 初始化（从 SharedPreferences 读取） ----------
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _language = prefs.getString('language') ?? 'en';
    _level = prefs.getString('level') ?? 'beginner';
    _dailyGoal = prefs.getInt('dailyGoal') ?? 15;
    _isOnboarded = prefs.getBool('isOnboarded') ?? false;
    _username = prefs.getString('username') ?? '';
    _streak = prefs.getInt('streak') ?? 0;
    _totalDays = prefs.getInt('totalDays') ?? 0;
    _totalHours = prefs.getInt('totalHours') ?? 0;
    _masteredWords = prefs.getInt('masteredWords') ?? 68;
    _masteredSentences = prefs.getInt('masteredSentences') ?? 42;
    _masteredAdvanced = prefs.getInt('masteredAdvanced') ?? 15;
    _learningTime = prefs.getInt('todayLearningTime') ?? 0;
    _showGoalPopup = prefs.getBool('showGoalPopup') ?? false;
    final lastDateStr = prefs.getString('lastLearningDate');
    if (lastDateStr != null) {
      _lastLearningDate = DateTime.parse(lastDateStr);
    }
    _goalReachedToday = prefs.getBool('goalReachedToday') ?? false;

    // 检查是否是新的一天,重置今日学习时间
    _checkNewDay();

    final favJson = prefs.getString('favorites');
    if (favJson != null) {
      final List list = jsonDecode(favJson);
      _favorites = list.cast<String>().toSet();
    }

    final masteredJson = prefs.getString('masteredWordIds');
    if (masteredJson != null) {
      final List list = jsonDecode(masteredJson);
      _masteredWordIds = list.cast<String>().toSet();
    }
  }

  // 检查是否是新的学习日期,并处理连续学习天数
  void _checkNewDay() {
    if (_lastLearningDate != null) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final lastDate = DateTime(_lastLearningDate!.year, _lastLearningDate!.month, _lastLearningDate!.day);

      final difference = today.difference(lastDate).inDays;

      if (difference > 1) {
        // 如果超过一天没有学习,连续天数归零
        if (_streak > 0) {
          _streak = 0;
          _save((p) async => p.setInt('streak', 0));
        }
      }

      if (difference >= 1) {
        // 新的一天,重置今日学习时间和达成目标标志
        _learningTime = 0;
        _goalReachedToday = false;
        _showGoalPopup = false;
        _save((p) async {
          p.setInt('todayLearningTime', 0);
          p.setBool('goalReachedToday', false);
          p.setBool('showGoalPopup', false);
        });
      }
    }
  }

  Future<void> _save(Future<void> Function(SharedPreferences) fn) async {
    final prefs = await SharedPreferences.getInstance();
    await fn(prefs);
  }

  void setLanguage(String lang) {
    _language = lang;
    _save((p) async => p.setString('language', lang));
    notifyListeners();
  }

  void setLevel(String lvl) {
    _level = lvl;
    _save((p) async => p.setString('level', lvl));
    notifyListeners();
  }

  void setDailyGoal(int goal) {
    _dailyGoal = goal;
    _save((p) async => p.setInt('dailyGoal', goal));
    notifyListeners();
  }

  void setIsOnboarded(bool value) {
    _isOnboarded = value;
    _save((p) async => p.setBool('isOnboarded', value));
    notifyListeners();
  }

  // 重置引导状态(用于测试)
  void resetOnboarding() {
    _isOnboarded = false;
    _save((p) async => p.setBool('isOnboarded', false));
    notifyListeners();
  }

  void setUsername(String name) {
    _username = name;
    _save((p) async => p.setString('username', name));
    notifyListeners();
  }

  void toggleFavorite(String item) {
    final newSet = Set<String>.from(_favorites);
    if (newSet.contains(item)) {
      newSet.remove(item);
    } else {
      newSet.add(item);
    }
    _favorites = newSet;
    _save((p) async => p.setString('favorites', jsonEncode(newSet.toList())));
    notifyListeners();
  }

  /// 将词语标记为已掌握（两步测评都通过后调用）
  void markWordMastered(String wordId) {
    if (_masteredWordIds.contains(wordId)) return;
    _masteredWordIds.add(wordId);
    _masteredWords = _masteredWordIds.length;
    _save((p) async {
      p.setString('masteredWordIds', jsonEncode(_masteredWordIds.toList()));
      p.setInt('masteredWords', _masteredWords);
    });
    notifyListeners();
  }

  void setShowGoalPopup(bool show) {
    _showGoalPopup = show;
    _save((p) async => p.setBool('showGoalPopup', show));
    notifyListeners();
  }

  // 开始学习计时(进入学习页面时调用)
  void startLearningSession() {
    _checkNewDay(); // 检查是否是新的一天
    if (_sessionStartTime == null && !_goalReachedToday) {
      _sessionStartTime = DateTime.now();
    }
  }

  // 结束学习计时(退出学习页面时调用)
  void endLearningSession() {
    if (_sessionStartTime != null && !_goalReachedToday) {
      final now = DateTime.now();
      final duration = now.difference(_sessionStartTime!).inMinutes;

      if (duration > 0) {
        addLearningTime(duration);
      }

      _sessionStartTime = null;

      // 更新最后学习日期
      _lastLearningDate = DateTime.now();
      _save((p) async => p.setString('lastLearningDate', _lastLearningDate!.toIso8601String()));
    }
  }

  // 手动添加学习时间(保留原有方法)
  void addLearningTime(int minutes) {
    final prev = _learningTime;
    _learningTime += minutes;

    // 如果达到目标且今天还没达到过
    if (prev < _dailyGoal && _learningTime >= _dailyGoal && !_goalReachedToday) {
      _goalReachedToday = true;
      _showGoalPopup = true;
      _streak++;
      _totalDays++;
      _totalHours += (_learningTime ~/ 60);
      _save((p) async {
        p.setInt('streak', _streak);
        p.setInt('totalDays', _totalDays);
        p.setInt('totalHours', _totalHours);
        p.setBool('goalReachedToday', _goalReachedToday);
        p.setBool('showGoalPopup', _showGoalPopup);
      });
    }

    _save((p) async => p.setInt('todayLearningTime', _learningTime));
    notifyListeners();
  }
}
