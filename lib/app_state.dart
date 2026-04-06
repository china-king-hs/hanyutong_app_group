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
  int _totalMinutes = 0; // 累计学习分钟数

  // ---------- 今日学习时长 ----------
  int _learningTime = 0;

  // ---------- 计时器相关 ----------
  DateTime? _sessionStartTime; // 本次学习会话开始时间
  DateTime? _lastLearningDate; // 上次学习日期,用于计算连续天数
  bool _goalReachedToday = false; // 今天是否已达成目标

  // ---------- 收藏（List 保留收藏顺序，越后面的越新） ----------
  List<String> _favorites = [];

  // ---------- 已掌握（List 保留掌握顺序，越后面的越新） ----------
  List<String> _masteredWordIds = [];
  List<String> _masteredIdiomIds = [];
  Set<String> _masteredProverbIds = {};

  // ---------- 诗词已学习（中文释义和母语释义都点过才标记） ----------
  Set<String> _learnedPoemIds = {};

  // ---------- Getters ----------
  String get language => _language;
  String get level => _level;
  int get dailyGoal => _dailyGoal;
  bool get isOnboarded => _isOnboarded;
  String get username => _username.isEmpty ? 'Learner' : _username;
  int get streak => _streak;
  int get totalDays => _totalDays;
  /// 累计学习时长（小时），每 30 分钟进 0.5 小时
  double get totalHours => (_totalMinutes / 30).ceilToDouble() * 0.5;
  int get masteredWords => _masteredWordIds.length;
  int get masteredIdioms => _masteredIdiomIds.length;
  int get masteredProverbs => _masteredProverbIds.length;
  int get learningTime => _learningTime;
  Set<String> get favorites => _favorites.toSet();
  List<String> get favoritesOrdered => _favorites; // 有序列表，供收藏页倒序使用
  List<String> get masteredWordIds => _masteredWordIds;
  List<String> get masteredIdiomIds => _masteredIdiomIds;
  Set<String> get masteredProverbIds => _masteredProverbIds;
  Set<String> get learnedPoemIds => _learnedPoemIds;
  int get learnedPoems => _learnedPoemIds.length;

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
    // 兼容旧版 totalHours（int，单位小时），转为分钟数
    final oldTotalHours = prefs.getInt('totalHours') ?? 0;
    _totalMinutes = prefs.getInt('totalMinutes') ?? (oldTotalHours * 60);
    _learningTime = prefs.getInt('todayLearningTime') ?? 0;
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
      _favorites = list.cast<String>().toList();
    }

    final masteredJson = prefs.getString('masteredWordIds');
    if (masteredJson != null) {
      final List list = jsonDecode(masteredJson);
      _masteredWordIds = list.cast<String>().toList();
    }

    final idiomJson = prefs.getString('masteredIdiomIds');
    if (idiomJson != null) {
      final List list = jsonDecode(idiomJson);
      _masteredIdiomIds = list.cast<String>().toList();
    }

    final proverbJson = prefs.getString('masteredProverbIds');
    if (proverbJson != null) {
      final List list = jsonDecode(proverbJson);
      _masteredProverbIds = list.cast<String>().toSet();
    }

    final learnedPoemJson = prefs.getString('learnedPoemIds');
    if (learnedPoemJson != null) {
      final List list = jsonDecode(learnedPoemJson);
      _learnedPoemIds = list.cast<String>().toSet();
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
        _save((p) async {
          p.setInt('todayLearningTime', 0);
          p.setBool('goalReachedToday', false);
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

  // 重置学习记录（保留用户设置，只清除学习数据）
  void resetLearningData() {
    // 清除已掌握的词语/成语/谚语/诗词
    _masteredWordIds = [];
    _masteredIdiomIds = [];
    _masteredProverbIds = {};
    _learnedPoemIds = {};

    // 清除收藏
    _favorites = [];

    // 清除学习统计
    _streak = 0;
    _totalDays = 0;
    _totalMinutes = 0;

    // 清除今日学习状态
    _learningTime = 0;
    _goalReachedToday = false;
    _sessionStartTime = null;
    _lastLearningDate = null;

    _save((p) async {
      // 已掌握数据
      await p.remove('masteredWordIds');
      await p.remove('masteredIdiomIds');
      await p.remove('masteredProverbIds');
      await p.remove('learnedPoemIds');
      // 收藏
      await p.remove('favorites');
      // 学习统计
      await p.setInt('streak', 0);
      await p.setInt('totalDays', 0);
      await p.setInt('totalMinutes', 0);
      // 今日学习状态
      await p.setInt('todayLearningTime', 0);
      await p.setBool('goalReachedToday', false);
      await p.remove('lastLearningDate');
    });
    notifyListeners();
  }

  void setUsername(String name) {
    _username = name;
    _save((p) async => p.setString('username', name));
    notifyListeners();
  }

  void toggleFavorite(String item) {
    final newList = List<String>.from(_favorites);
    if (newList.contains(item)) {
      newList.remove(item);
    } else {
      newList.add(item); // 追加到末尾，越新收藏越靠后
    }
    _favorites = newList;
    _save((p) async => p.setString('favorites', jsonEncode(newList)));
    notifyListeners();
  }

  /// 将词语标记为已掌握（两步测评都通过后调用）
  void markWordMastered(String wordId) {
    if (_masteredWordIds.contains(wordId)) return;
    _masteredWordIds.add(wordId);  // 追加到末尾，越新掌握的越靠后
    _save((p) async {
      p.setString('masteredWordIds', jsonEncode(_masteredWordIds));
    });
    notifyListeners();
  }

  /// 将成语标记为已掌握
  void markIdiomMastered(String idiomId) {
    if (_masteredIdiomIds.contains(idiomId)) return;
    _masteredIdiomIds.add(idiomId); // 追加到末尾，越新掌握越靠后
    _save((p) async {
      p.setString('masteredIdiomIds', jsonEncode(_masteredIdiomIds));
    });
    notifyListeners();
  }

  /// 将谚语标记为已掌握
  void markProverbMastered(String proverbId) {
    if (_masteredProverbIds.contains(proverbId)) return;
    _masteredProverbIds.add(proverbId);
    _save((p) async {
      p.setString('masteredProverbIds', jsonEncode(_masteredProverbIds.toList()));
    });
    notifyListeners();
  }

  /// 标记诗词为已学习（中文释义和母语释义都查看后才调用）
  void markPoemLearned(String poemId) {
    if (_learnedPoemIds.contains(poemId)) return;
    _learnedPoemIds.add(poemId);
    _save((p) async {
      p.setString('learnedPoemIds', jsonEncode(_learnedPoemIds.toList()));
    });
    notifyListeners();
  }

  // 开始学习计时(进入学习页面时调用)
  void startLearningSession() {
    _checkNewDay(); // 检查是否是新的一天
    if (_sessionStartTime == null) {
      _sessionStartTime = DateTime.now();
    }
  }

  // 结束学习计时(退出学习页面时调用)
  void endLearningSession() {
    if (_sessionStartTime != null) {
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

  // 手动添加学习时间
  void addLearningTime(int minutes) {
    final prev = _learningTime;
    _learningTime += minutes;
    _totalMinutes += minutes;

    // 如果达到目标且今天还没达到过，更新连续天数和累计天数
    if (prev < _dailyGoal && _learningTime >= _dailyGoal && !_goalReachedToday) {
      _goalReachedToday = true;
      _streak++;
      _totalDays++;
      _save((p) async {
        p.setInt('streak', _streak);
        p.setInt('totalDays', _totalDays);
        p.setBool('goalReachedToday', _goalReachedToday);
      });
    }

    _save((p) async {
      p.setInt('todayLearningTime', _learningTime);
      p.setInt('totalMinutes', _totalMinutes);
    });
    notifyListeners();
  }
}
