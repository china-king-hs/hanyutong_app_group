// 应用本地化类
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Chinese Go',
      'selectNativeLanguage': 'What language do you use to learn Chinese?',
      'pleaseSelect': 'Please select your native language',
      'confirm': 'Confirm',
      'back': 'Back',
      'chooseNativeLanguage': 'Choose Native Language',
      'dailyGoalMinutes': 'Daily Goal (per day)',
      'minutes': 'minutes',
      // 首页
      'home': 'Home',
      'learning': 'Learning',
      'profile': 'Profile',
      'todayLearningTime': 'Today Learning Time',
      'wordsMastered': 'Words Mastered',
      'sentencesMastered': 'Sentences Mastered',
      'advancedMastered': 'Advanced Mastered',
      'continueLearning': 'Continue Learning',
      'words': 'Words',
      'sentences': 'Sentences',
      'advanced': 'Advanced',
      'review': 'Review',
      'favorites': 'Favorites',
      // home_tab.dart中的文本
      'mastered': 'Mastered',
      'streakLabel': 'Day Streak',
      'totalDaysLabel': 'Total Days',
      'totalHoursLabel': 'Learning Hours',
      'wordsLabel': 'Words',
      'sentencesLabel': 'Sentences',
      'advancedLabel': 'Advanced',
      'grammarLabel': 'Grammar',
      'idiomsLabel': 'Idioms',
      'proverbsLabel': 'Proverbs',
      'poetryLabel': 'Poetry',
      'unitDay': 'day',
      'unitDays': 'days',
      'unitHour': 'hour',
      'unitHours': 'hours',
      'unitItem': 'item',
      'unitItems': 'items',
      'myFavorites': 'My Favorites',
      // learn_tab.dart中的文本
      'beginnerLevel': 'Beginner',
      'elementaryLevel': 'Elementary',
      'intermediateLevel': 'Intermediate',
      'advancedLevelName': 'Advanced',
      'currentLevelLabel': 'Current Level',
      'wordsPractice': 'Words Practice',
      'sentencesPractice': 'Sentences Practice',
      'grammarLearning': 'Grammar Learning',
      'basicLearning': 'Basic Learning',
      'advancedReading': 'Advanced Reading · Chinese Culture',
      'idioms': 'Idioms',
      'proverbs': 'Proverbs/Sayings',
      'poetry': 'Poetry',
      'culture': 'Cultural Knowledge',
      'auxiliaryMaterials': 'Auxiliary Learning Materials',
      'hskOutline': 'HSK Exam Outline',
      'hskMaterials': 'HSK Study Materials',
      'practiceNowLabel': 'Practice Now',
      // 学习页
      'learn': 'Learn',
      'currentLevel': 'Current Level',
      'beginner': 'Beginner',
      'intermediate': 'Intermediate',
      'advancedLevel': 'Advanced',
      'expert': 'Expert',
      'practiceNow': 'Practice Now',
      // 个人页
      'myProfile': 'My Profile',
      'learningStats': 'Learning Stats',
      'streak': 'Day Streak',
      'totalDays': 'Total Days',
      'totalHours': 'Total Hours',
      'settings': 'Settings',
      'editUsername': 'Edit Username',
      'enterNewUsername': 'Enter new username',
      'save': 'Save',
      'language': 'Language',
      'dailyGoal': 'Daily Goal',
      'notifications': 'Notifications',
      'noNotifications': 'No notifications',
      'noNotificationsDesc': 'You\'re all caught up!',
      'about': 'About',
      'logOut': 'Log Out',
      'editProfile': 'Edit Profile',
      // 新增的本地化键值
      // practice_page.dart
      'wordsPracticeTitle': 'Words Practice',
      'sentencesPracticeTitle': 'Sentences Practice',
      'tapMicToRead': 'Tap the microphone to read the Chinese above',
      'explainInNativeLanguage': 'Explain the meaning in your native language',
      'skip': 'Skip',
      'showAnswer': 'Show Answer',
      'skipMasteredTitle': 'Have you already mastered this word?',
      'skipMasteredNo': 'No',
      'skipMasteredYes': 'Yes',
      'skipIdiomMasteredTitle': 'Have you already mastered this idiom?',
      'skipProverbMasteredTitle': 'Have you already mastered this proverb?',
      'pronunciationScore': 'Pronunciation Score 🎤',
      'pronunciationAccuracy': 'Pronunciation Accuracy',
      'nextStepExplain': 'Next Step →',
      'meaningScore': 'Meaning Score 💡',
      'meaningAccuracy': 'Meaning Accuracy',
      'masteredSuccess': '✅ You have mastered!',
      'continueBtn': 'Continue →',
      'tryAgain': 'Try Again',
      'reRecord': 'Re-record',
      'meaningBelow': 'Explanation below',
      'meaningPlaceholder': '(Native language explanation, data not imported, temporarily blank)',
      'close': 'Close',
      'step1ReadChinese': 'Read Chinese',
      'step2Explain': 'Explain Meaning',
      'holdToRecord': 'Hold to record',
      'slideUpToCancel': 'Slide up to cancel',
      // advanced_practice.dart
      'chineseExplanation': 'Chinese Explanation',
      'dataNotLoaded': '(Data not loaded, temporarily blank)',
      'loading': 'Loading...',
      'retry': 'Retry',
      'noData': '(No data)',
      'optionA': 'Option A',
      'optionB': 'Option B',
      'optionC': 'Option C',
      'optionD': 'Option D',
      'questionProgress': 'Question {current} of {total}',
      'tapToPlay': 'Tap to Play',
      'submit': 'Submit',
      // level_test.dart
      'whatsYourLevel': 'What is your Chinese level?',
      'selectBestOption': 'Select the option that best matches your current situation',
      'nextStep': 'Next Step',
      'levelBeginner': 'Beginner',
      'levelElementary': 'Elementary',
      'levelIntermediate': 'Intermediate',
      'levelAdvanced': 'Advanced',
      // goal_setting.dart
      'setLearningGoal': 'Set a learning goal',
      'dailyConsistency': 'Consistency brings visible progress',
      'startLearning': 'Start Learning',
      'goal5min': '5 min/day',
      'goal5desc': 'Easy start, learn anytime',
      'goal15min': '15 min/day',
      'goal15desc': 'Steady progress, daily check-in',
      'goal30min': '30 min/day',
      'goal30desc': 'Efficient learning, fast progress',
      'goal60min': '60 min/day',
      'goal60desc': 'Deep immersion, comprehensive breakthrough',
      // level descriptions
      'beginnerDesc': 'Just started, know a few Chinese characters',
      'elementaryDesc': 'Can have simple daily conversations',
      'intermediateDesc': 'Master common words, can read short texts',
      'advancedDesc': 'Familiar with idioms and poetry, challenge deep Chinese',
      // profile_tab.dart
      'learnerName': 'Learner',
      'myAchievements': 'My Achievements',
      // 徽章 - 类别1: 入门
      'badgeBeginner': 'Beginner',
      'badgeBeginnerDesc': 'Master your first word, idiom or proverb',
      'badgeExplorer': 'Explorer',
      'badgeExplorerDesc': 'Explore 5 different learning sections',
      // 徽章 - 类别2: 词语
      'badgeWordLearner': 'Word Learner',
      'badgeWordLearnerDesc': 'Master 10 words',
      'badgeWordKnight': 'Word Knight',
      'badgeWordKnightDesc': 'Master 30 words',
      'badgeWordMaster': 'Word Master',
      'badgeWordMasterDesc': 'Master 50 words',
      'badgeWordLegend': 'Word Legend',
      'badgeWordLegendDesc': 'Master 100 words',
      // 徽章 - 类别3: 成语
      'badgeIdiomFirst': 'Idiom Starter',
      'badgeIdiomFirstDesc': 'Master your first idiom',
      'badgeIdiomAdept': 'Idiom Adept',
      'badgeIdiomAdeptDesc': 'Master 5 idioms',
      'badgeIdiomMaster': 'Idiom Master',
      'badgeIdiomMasterDesc': 'Master 10 idioms',
      // 徽章 - 类别4: 谚语
      'badgeProverbFirst': 'Proverb Starter',
      'badgeProverbFirstDesc': 'Master your first proverb',
      'badgeProverbAdept': 'Proverb Adept',
      'badgeProverbAdeptDesc': 'Master 5 proverbs',
      'badgeProverbSage': 'Proverb Sage',
      'badgeProverbSageDesc': 'Master 10 proverbs',
      // 徽章 - 类别5: 连续学习
      'badgeStreak3': 'Keep Going',
      'badgeStreak3Desc': 'Study 3 days in a row',
      'badgeStreak7': 'Week Warrior',
      'badgeStreak7Desc': 'Study 7 days in a row',
      'badgeStreak14': 'Fortnight Pro',
      'badgeStreak14Desc': 'Study 14 days in a row',
      'badgeStreak30': 'Monthly Champion',
      'badgeStreak30Desc': 'Study 30 days in a row',
      'badgeStreak100': 'Century Hero',
      'badgeStreak100Desc': 'Study 100 days in a row',
      // 徽章 - 类别6: 诗词
      'badgePoemLover': 'Poetry Lover',
      'badgePoemLoverDesc': 'Learn 3 poems',
      'badgePoemScholar': 'Poetry Scholar',
      'badgePoemScholarDesc': 'Learn 8 poems',
      // 徽章 - 类别7: 收藏
      'badgeCollector': 'Collector',
      'badgeCollectorDesc': 'Favorite 10 items',
      'badgeTreasureHunter': 'Treasure Hunter',
      'badgeTreasureHunterDesc': 'Favorite 25 items',
      'badgeUnlocked': 'Badge Unlocked!',
      'badgeLocked': 'Not yet unlocked',
      'learningProgress': 'Learning Progress',
      // achievements_page
      'viewAll': 'View All →',
      'startLearningToUnlockAchievements': 'Start learning to unlock achievements!',
      // review_page.dart
      'reviewTitle': 'Review',
      'wordsReview': 'Words Review',
      'idiomsReview': 'Idioms Review',
      'proverbsReview': 'Proverbs Review',
      'poetryReview': 'Poetry Review',
      'noMasteredWordsYet': 'No words mastered yet',
      'noMasteredWordsHint': 'Complete both steps in words practice to add words here',
      // empty_page.dart
      'comingSoon': 'Coming Soon',
      'featureInDevelopment': 'Feature is under development...',
      // settings_page.dart
      'resetOnboarding': 'Reset Onboarding',
      'resetOnboardingDesc': 'Show language selection, level test and goal setting again',
      'confirmReset': 'Reset?',
      'resetSuccess': 'Reset successful. Please restart the app.',
      'reset': 'Reset',
      'resetLearningRecord': 'Reset Learning Records',
      'resetLearningRecordDesc': 'Clear all learning progress, favorites, and mastery records. Your language and settings will be kept.',
      'resetLearningRecordSuccess': 'Learning records reset successful.',
      // poetry explanation buttons
      'showChineseMeaning': 'Chinese Meaning',
      'showNativeMeaning': 'My Language Meaning',
      'jumpToPoem': 'Jump to Poem',
      'jumpToIdiom': 'Jump to Idiom',
      'jumpToProverb': 'Jump to Proverb',
      'jumpToWord': 'Jump to Word',
      'wordAlreadyMastered': 'This word is already mastered.',
      'invalidNumberHint': 'is not valid, please enter 1 ~ ',
      // culture_practice_page.dart
      'jumpToCulture': 'Jump to Item',
      'nativeExplanation': 'Native Explanation',
      'prevItem': 'Previous',
      'nextItem': 'Next',
      'cultureSolarTerm': 'Solar Term',
      'cultureFestival': 'Festival',
    },
    'ru': {
      'appTitle': 'Chinese Go',
      'selectNativeLanguage': 'На каком языке вы изучаете китайский?',
      'pleaseSelect': 'Пожалуйста, выберите ваш родной язык',
      'confirm': 'Подтвердить',
      'back': 'Назад',
      'chooseNativeLanguage': 'Выберите родной язык',
      'dailyGoalMinutes': 'Ежедневная цель (в день)',
      'minutes': 'минут',
      'home': 'Главная',
      'learning': 'Обучение',
      'profile': 'Профиль',
      'todayLearningTime': 'Время обучения сегодня',
      'wordsMastered': 'Освоено слов',
      'sentencesMastered': 'Освоено предложений',
      'advancedMastered': 'Освоено продвинутых',
      'continueLearning': 'Продолжить обучение',
      'words': 'Слова',
      'sentences': 'Предложения',
      'advanced': 'Продвинутые',
      'review': 'Повторение',
      'favorites': 'Избранное',
      // home_tab.dart中的文本
      'mastered': 'Освоено',
      'streakLabel': 'Дней подряд',
      'totalDaysLabel': 'Всего дней',
      'totalHoursLabel': 'Часов обучения',
      'wordsLabel': 'Слова',
      'sentencesLabel': 'Предложения',
      'advancedLabel': 'Продвинутые',
      'grammarLabel': 'Грамматика',
      'idiomsLabel': 'Идиомы',
      'proverbsLabel': 'Пословицы',
      'poetryLabel': 'Поэзия',
      'unitDay': 'день',
      'unitDays': 'дней',
      'unitHour': 'час',
      'unitHours': 'часов',
      'unitItem': 'единица',
      'unitItems': 'единиц',
      'myFavorites': 'Мои избранные',
      'learn': 'Учить',
      'currentLevel': 'Текущий уровень',
      'beginner': 'Начинающий',
      'intermediate': 'Средний',
      'advancedLevel': 'Продвинутый',
      'expert': 'Эксперт',
      'practiceNow': 'Практиковать сейчас',
      'myProfile': 'Мой профиль',
     'learningStats': 'Статистика обучения',
      'streak': 'Дней подряд',
      'totalDays': 'Всего дней',
      'totalHours': 'Всего часов',
      'settings': 'Настройки',
      'editUsername': 'Изменить имя пользователя',
      'enterNewUsername': 'Введите новое имя пользователя',
      'save': 'Сохранить',
      'language': 'Язык',
      'dailyGoal': 'Ежедневная цель',
      'notifications': 'Уведержения',
      'noNotifications': 'Нет уведомлений',
      'noNotificationsDesc': 'Всё в порядке!',
      'about': 'О приложении',
      'logOut': 'Выйти',
      'editProfile': 'Редактировать профиль',
      // learn_tab.dart中的文本
      'beginnerLevel': 'Начинающий',
      'elementaryLevel': 'Элементарный',
      'intermediateLevel': 'Средний',
      'advancedLevelName': 'Продвинутый',
      'currentLevelLabel': 'Текущий уровень',
      'wordsPractice': 'Практика слов',
      'sentencesPractice': 'Практика предложений',
      'grammarLearning': 'Изучение грамматики',
      'basicLearning': 'Базовое обучение',
      'advancedReading': 'Продвинутое чтение · Китайская культура',
      'idioms': 'Идиомы',
      'proverbs': 'Поговорки/Пословицы',
      'poetry': 'Поэзия',
      'culture': 'Культурные знания',
      'auxiliaryMaterials': 'Вспомогательные учебные материалы',
      'hskOutline': 'Программа экзамена HSK',
      'hskMaterials': 'Учебные материалы HSK',
      'practiceNowLabel': 'Практиковать сейчас',
      // 新增的本地化键值
      // practice_page.dart
      'wordsPracticeTitle': 'Практика слов',
      'sentencesPracticeTitle': 'Практика предложений',
      'tapMicToRead': 'Нажмите на микрофон, чтобы прочитать китайский текст выше',
      'explainInNativeLanguage': 'Объясните значение на вашем родном языке',
      'skip': 'Пропустить',
      'showAnswer': 'Показать ответ',
      'skipMasteredTitle': 'Вы уже освоили это слово?',
      'skipMasteredNo': 'Нет',
      'skipMasteredYes': 'Да',
      'skipIdiomMasteredTitle': 'Вы уже освоили эту идиому?',
      'skipProverbMasteredTitle': 'Вы уже освоили эту пословицу?',
      'pronunciationScore': 'Оценка произношения 🎤',
      'pronunciationAccuracy': 'Точность произношения',
      'nextStepExplain': 'Следующий шаг →',
      'meaningScore': 'Оценка понимания 💡',
      'meaningAccuracy': 'Точность понимания',
      'masteredSuccess': '✅ Вы освоили!',
      'continueBtn': 'Продолжить →',
      'tryAgain': 'Попробовать снова',
      'reRecord': 'Перезаписать',
      'meaningBelow': 'Объяснение ниже',
      'meaningPlaceholder': '(Объяснение на родном языке, данные не импортированы, временно пусто)',
      'close': 'Закрыть',
      'step1ReadChinese': 'Читайте китайский',
      'step2Explain': 'Объясните значение',
      'holdToRecord': 'Удерживайте для записи',
      'slideUpToCancel': 'Проведите вверх для отмены',
      // advanced_practice.dart
      'chineseExplanation': 'Китайское объяснение',
      'dataNotLoaded': '(Данные не загружены, временно пусто)',
      'loading': 'Загрузка...',
      'retry': 'Повторить',
      'noData': '(Нет данных)',
      'optionA': 'Вариант A',
      'optionB': 'Вариант B',
      'optionC': 'Вариант C',
      'optionD': 'Вариант D',
      'questionProgress': 'Вопрос {current} из {total}',
      'tapToPlay': 'Нажмите для воспроизведения',
      'submit': 'Отправить',
      // level_test.dart
      'whatsYourLevel': 'Какой у вас уровень китайского?',
      'selectBestOption': 'Выберите вариант, который лучше всего соответствует вашей текущей ситуации',
      'nextStep': 'Следующий шаг',
      'levelBeginner': 'Начинающий',
      'levelElementary': 'Элементарный',
      'levelIntermediate': 'Средний',
      'levelAdvanced': 'Продвинутый',
      // goal_setting.dart
      'setLearningGoal': 'Установить цель обучения',
      'dailyConsistency': 'Последовательность приносит заметный прогресс',
      'startLearning': 'Начать обучение',
      'goal5min': '5 минут/день',
      'goal5desc': 'Лёгкий старт, учитесь когда угодно',
      'goal15min': '15 минут/день',
      'goal15desc': 'Стабильный прогресс, ежедневная практика',
      'goal30min': '30 минут/день',
      'goal30desc': 'Эффективное обучение, быстрый прогресс',
      'goal60min': '60 минут/день',
      'goal60desc': 'Глубокое погружение, всесторонний прорыв',
      // level descriptions
      'beginnerDesc': 'Только начинаю, знаю несколько китайских иероглифов',
      'elementaryDesc': 'Могу вести простые ежедневные диалоги',
      'intermediateDesc': 'Освоил часто встречающиеся слова, могу читать короткие тексты',
      'advancedDesc': 'Знаком с идиомами и стихами, углубляюсь в китайский язык',
      // profile_tab.dart
      'learnerName': 'Обучающийся',
      'myAchievements': 'Мои достижения',
      // 徽章 - 类别1: 入门
      'badgeBeginner': 'Начинающий',
      'badgeBeginnerDesc': 'Освойте первое слово, идиому или пословицу',
      'badgeExplorer': 'Исследователь',
      'badgeExplorerDesc': 'Изучите 5 разных разделов',
      // 徽章 - 类别2: 词语
      'badgeWordLearner': 'Изучающий слова',
      'badgeWordLearnerDesc': 'Освойте 10 слов',
      'badgeWordKnight': 'Рыцарь слов',
      'badgeWordKnightDesc': 'Освойте 30 слов',
      'badgeWordMaster': 'Мастер слов',
      'badgeWordMasterDesc': 'Освойте 50 слов',
      'badgeWordLegend': 'Легенда слов',
      'badgeWordLegendDesc': 'Освойте 100 слов',
      // 徽章 - 类别3: 成语
      'badgeIdiomFirst': 'Начало идиом',
      'badgeIdiomFirstDesc': 'Освойте первую идиому',
      'badgeIdiomAdept': 'Знаток идиом',
      'badgeIdiomAdeptDesc': 'Освойте 5 идиом',
      'badgeIdiomMaster': 'Мастер идиом',
      'badgeIdiomMasterDesc': 'Освойте 10 идиом',
      // 徽章 - 类别4: 谚语
      'badgeProverbFirst': 'Начало пословиц',
      'badgeProverbFirstDesc': 'Освойте первую пословицу',
      'badgeProverbAdept': 'Знаток пословиц',
      'badgeProverbAdeptDesc': 'Освойте 5 пословиц',
      'badgeProverbSage': 'Мудрец пословиц',
      'badgeProverbSageDesc': 'Освойте 10 пословиц',
      // 徽章 - 类别5: 连续学习
      'badgeStreak3': 'Не сдавайтесь',
      'badgeStreak3Desc': 'Учитесь 3 дня подряд',
      'badgeStreak7': 'Воин недели',
      'badgeStreak7Desc': 'Учитесь 7 дней подряд',
      'badgeStreak14': 'Профессионал',
      'badgeStreak14Desc': 'Учитесь 14 дней подряд',
      'badgeStreak30': 'Чемпион месяца',
      'badgeStreak30Desc': 'Учитесь 30 дней подряд',
      'badgeStreak100': 'Герой века',
      'badgeStreak100Desc': 'Учитесь 100 дней подряд',
      // 徽章 - 类别6: 诗词
      'badgePoemLover': 'Любитель поэзии',
      'badgePoemLoverDesc': 'Выучите 3 стихотворения',
      'badgePoemScholar': 'Поэтический учёный',
      'badgePoemScholarDesc': 'Выучите 8 стихотворений',
      // 徽章 - 类别7: 收藏
      'badgeCollector': 'Коллекционер',
      'badgeCollectorDesc': 'Добавьте 10 избранных',
      'badgeTreasureHunter': 'Кладоискатель',
      'badgeTreasureHunterDesc': 'Добавьте 25 избранных',
      'badgeUnlocked': 'Значок получен!',
      'badgeLocked': 'Пока не получено',
      'learningProgress': 'Прогресс обучения',
      // achievements_page
      'viewAll': 'Все →',
      'startLearningToUnlockAchievements': 'Начните учиться, чтобы получить достижения!',
      // review_page.dart
      'reviewTitle': 'Обзор',
      'wordsReview': 'Обзор слов',
      'idiomsReview': 'Обзор идиом',
      'proverbsReview': 'Обзор пословиц',
      'poetryReview': 'Обзор поэзии',
      'noMasteredWordsYet': 'Пока нет освоенных слов',
      'noMasteredWordsHint': 'Пройдите оба этапа практики слов, чтобы добавить слова сюда',
      // empty_page.dart
      'comingSoon': 'Скоро будет',
      'featureInDevelopment': 'Функция находится в разработке...',
      // settings_page.dart
      'resetOnboarding': 'Сбросить онбординг',
      'resetOnboardingDesc': 'Снова показать выбор языка, тест уровня и установку цели',
      'confirmReset': 'Сбросить?',
      'resetSuccess': 'Сброшено. Пожалуйста, перезапустите приложение.',
      'reset': 'Сбросить',
      'resetLearningRecord': 'Сбросить записи обучения',
      'resetLearningRecordDesc': 'Очистить весь прогресс, избранное и освоенные записи. Язык и настройки будут сохранены.',
      'resetLearningRecordSuccess': 'Записи обучения успешно сброшены.',
      // poetry explanation buttons
      'showChineseMeaning': 'Китайское значение',
      'showNativeMeaning': 'Значение на моём языке',
      'jumpToPoem': 'Перейти к стиху',
      'jumpToIdiom': 'Перейти к идиоме',
      'jumpToProverb': 'Перейти к пословице',
      'jumpToWord': 'Перейти к слову',
      'wordAlreadyMastered': 'Это слово уже освоено.',
      'invalidNumberHint': 'недопустимо, введите 1 ~ ',
      // culture_practice_page.dart
      'jumpToCulture': 'Перейти к элементу',
      'nativeExplanation': 'Объяснение на родном языке',
      'prevItem': 'Предыдущий',
      'nextItem': 'Следующий',
      'cultureSolarTerm': 'Солнечный термин',
      'cultureFestival': 'Праздник',
    },
    'fa': {
      'appTitle': 'چینی گو',
      'selectNativeLanguage': 'برای یادگیری چینی از کدام زبان استفاده می‌کنید؟',
      'pleaseSelect': 'لطفاً زبان مادری خود را انتخاب کنید',
      'confirm': 'تأیید',
      'back': 'بازگشت',
      'chooseNativeLanguage': 'انتخاب زبان مادری',
      'dailyGoalMinutes': 'هدف روزانه (در روز)',
      'minutes': 'دقیقه',
      'home': 'خانه',
      'learning': 'یادگیری',
      'profile': 'پروفایل',
      'todayLearningTime': 'زمان یادگیری امروز',
      'wordsMastered': 'کلمات تسلط یافته',
      'sentencesMastered': 'جمله‌های تسلط یافته',
      'advancedMastered': 'پیشرفته تسلط یافته',
      'continueLearning': 'ادامه یادگیری',
      'words': 'کلمات',
      'sentences': 'جمله‌ها',
      'advanced': 'پیشرفته',
      'review': 'مرور',
      'favorites': 'موردعلاقه',
      // home_tab.dart中的文本
      'mastered': 'تسلط یافته',
      'streakLabel': 'روز متوالی',
      'totalDaysLabel': 'کل روزها',
      'totalHoursLabel': 'ساعت‌های یادگیری',
      'wordsLabel': 'کلمات',
      'sentencesLabel': 'جمله‌ها',
      'advancedLabel': 'پیشرفته',
      'grammarLabel': 'دستور زبان',
      'idiomsLabel': 'اصطلاحات',
      'proverbsLabel': 'ضرب‌المثل‌ها',
      'poetryLabel': 'شعر',
      'unitDay': 'روز',
      'unitDays': 'روز',
      'unitHour': 'ساعت',
      'unitHours': 'ساعت',
      'unitItem': 'مورد',
      'unitItems': 'مورد',
      'myFavorites': 'موردعلاقه‌های من',
      'learn': 'یادگیری',
      'currentLevel': 'سطح فعلی',
      'beginner': 'مبتدی',
      'intermediate': 'متوسط',
      'advancedLevel': 'پیشرفته',
      'expert': 'متخصص',
      'practiceNow': 'تمرین الآن',
      'myProfile': 'پروفایل من',
      'learningStats': 'آمار یادگیری',
      'streak': 'روز متوالی',
      'totalDays': 'کل روزها',
      'totalHours': 'کل ساعت‌ها',
      'settings': 'تنظیمات',
      'editUsername': 'ویرایش نام کاربری',
      'enterNewUsername': 'نام کاربری جدید را وارد کنید',
      'save': 'ذخیره',
      'language': 'زبان',
      'dailyGoal': 'هدف روزانه',
      'notifications': 'اعلان‌ها',
      'noNotifications': 'هیچ اعلانی وجود ندارد',
      'noNotificationsDesc': 'همه چیز خوب است!',
      'about': 'درباره',
      'logOut': 'خروج',
      'editProfile': 'ویرایش پروفایل',
      // learn_tab.dart中的文本
      'beginnerLevel': 'مبتدی',
      'elementaryLevel': 'ابتدایی',
      'intermediateLevel': 'متوسط',
      'advancedLevelName': 'پیشرفته',
      'currentLevelLabel': 'سطح فعلی',
      'wordsPractice': 'تمرین کلمات',
      'sentencesPractice': 'تمرین جملات',
      'grammarLearning': 'یادگیری دستور زبان',
      'basicLearning': 'یادگیری پایه',
      'advancedReading': 'خواندن پیشرفته · فرهنگ چینی',
      'idioms': 'اصطلاحات',
      'proverbs': 'ضرب‌المثل‌ها/گفتارها',
      'poetry': 'شعر',
      'culture': 'دانش فرهنگی',
      'auxiliaryMaterials': 'مواد کمک آموزشی',
      'hskOutline': 'طرح امتحان HSK',
      'hskMaterials': 'مواد مطالعه HSK',
      'practiceNowLabel': 'تمرین الآن',
      // practice_page.dart中的文本
      'wordsPracticeTitle': 'تمرین کلمات',
      'sentencesPracticeTitle': 'تمرین جملات',
      'tapMicToRead': 'برای خواندن متن چینی بالا روی میکروفون ضربه بزنید',
      'explainInNativeLanguage': 'معنی را به زبان مادری خود توضیح دهید',
      'skip': 'رد کردن',
      'showAnswer': 'نمایش پاسخ',
      'skipMasteredTitle': 'آیا این کلمه را قبلاً یاد گرفته‌اید؟',
      'skipMasteredNo': 'خیر',
      'skipMasteredYes': 'بله',
      'skipIdiomMasteredTitle': 'آیا این اصطلاح را قبلاً یاد گرفته‌اید؟',
      'skipProverbMasteredTitle': 'آیا این ضرب‌المثل را قبلاً یاد گرفته‌اید؟',
      'pronunciationScore': 'امتیاز تلفظ 🎤',
      'pronunciationAccuracy': 'دقت تلفظ',
      'nextStepExplain': 'مرحله بعد →',
      'meaningScore': 'امتیاز معنی 💡',
      'meaningAccuracy': 'دقت معنی',
      'masteredSuccess': '✅ شما تسلط یافته‌اید!',
      'continueBtn': 'ادامه →',
      'tryAgain': 'دوباره امتحان کنید',
      'reRecord': 'ضبط مجدد',
      'meaningBelow': 'توضیح زیر',
      'meaningPlaceholder': '(توضیح به زبان مادری، داده وارد نشده، موقتا خالی)',
      'close': 'بستن',
      'step1ReadChinese': 'چینی بخوانید',
      'step2Explain': 'معنی را توضیح دهید',
      'holdToRecord': 'نگه دارید تا ضبط شود',
      'slideUpToCancel': 'برای لغو به بالا بکشید',
      // advanced_practice.dart
      'chineseExplanation': 'توضیح چینی',
      'dataNotLoaded': '(داده بارگیری نشده، موقتا خالی)',
      'loading': 'بارگیری...',
      'retry': 'تلاش دوباره',
      'noData': '(داده‌ای وجود ندارد)',
      'optionA': 'گزینه الف',
      'optionB': 'گزینه ب',
      'optionC': 'گزینه ج',
      'optionD': 'گزینه د',
      'questionProgress': 'سوال {current} از {total}',
      'tapToPlay': 'برای پخش ضربه بزنید',
      'submit': 'ارسال',
      // level_test.dart
      'whatsYourLevel': 'سطح چینی شما چیست؟',
      'selectBestOption': 'گزینه‌ای را که با وضعیت فعلی شما بیشترین هماهنگی را دارد انتخاب کنید',
      'nextStep': 'مرحله بعد',
      'levelBeginner': 'مبتدی',
      'levelElementary': 'ابتدایی',
      'levelIntermediate': 'متوسط',
      'levelAdvanced': 'پیشرفته',
      // goal_setting.dart
      'setLearningGoal': 'تعیین هدف یادگیری',
      'dailyConsistency': 'ثبات روزانه پیشرفت قابل مشاهده به همراه دارد',
      'startLearning': 'شروع یادگیری',
      'goal5min': '۵ دقیقه/روز',
      'goal5desc': 'شروع آسان، هر زمان و هر مکان',
      'goal15min': '۱۵ دقیقه/روز',
      'goal15desc': 'پیشرفت پایدار، ثبت روزانه',
      'goal30min': '۳۰ دقیقه/روز',
      'goal30desc': 'یادگیری کارآمد، پیشرفت سریع',
      'goal60min': '۶۰ دقیقه/روز',
      'goal60desc': 'غوطه‌وری عمیق، پیشرفت جامع',
      // level descriptions
      'beginnerDesc': 'تازه شروع کردم، چند کاراکتر چینی می‌شناسم',
      'elementaryDesc': 'می‌توانم گفتگوهای روزانه ساده انجام دهم',
      'intermediateDesc': 'کلمات رایج را تسلط یافته‌ام، می‌توانم متن‌های کوتاه بخوانم',
      'advancedDesc': 'با اصطلاحات و اشعار آشنام، چینی عمیق را به چالش می‌کشم',
      // profile_tab.dart
      'learnerName': 'یادگیرنده',
      'myAchievements': 'دستاوردهای من',
      // 徽章 - 类别1: 入门
      'badgeBeginner': 'مبتدی',
      'badgeBeginnerDesc': 'اولین کلمه، عبارت یا ضرب‌المثل را بیاموزید',
      'badgeExplorer': 'کاشف',
      'badgeExplorerDesc': '۵ بخش مختلف یادگیری را کاوش کنید',
      // 徽章 - 类别2: 词语
      'badgeWordLearner': 'یادگیرنده کلمات',
      'badgeWordLearnerDesc': '۱۰ کلمه را بیاموزید',
      'badgeWordKnight': 'شوالیه کلمات',
      'badgeWordKnightDesc': '۳۰ کلمه را بیاموزید',
      'badgeWordMaster': 'استاد کلمات',
      'badgeWordMasterDesc': '۵۰ کلمه را بیاموزید',
      'badgeWordLegend': 'افسانه کلمات',
      'badgeWordLegendDesc': '۱۰۰ کلمه را بیاموزید',
      // 徽章 - 类别3: 成语
      'badgeIdiomFirst': 'شروع عبارات',
      'badgeIdiomFirstDesc': 'اولین عبارت را بیاموزید',
      'badgeIdiomAdept': 'ماهر عبارات',
      'badgeIdiomAdeptDesc': '۵ عبارت را بیاموزید',
      'badgeIdiomMaster': 'استاد عبارات',
      'badgeIdiomMasterDesc': '۱۰ عبارت را بیاموزید',
      // 徽章 - 类别4: 谚语
      'badgeProverbFirst': 'شروع ضرب‌المثل‌ها',
      'badgeProverbFirstDesc': 'اولین ضرب‌المثل را بیاموزید',
      'badgeProverbAdept': 'ماهر ضرب‌المثل‌ها',
      'badgeProverbAdeptDesc': '۵ ضرب‌المثل را بیاموزید',
      'badgeProverbSage': 'حکیم ضرب‌المثل‌ها',
      'badgeProverbSageDesc': '۱۰ ضرب‌المثل را بیاموزید',
      // 徽章 - 类别5: 连续学习
      'badgeStreak3': 'ادامه دهید',
      'badgeStreak3Desc': '۳ روز متوالی مطالعه کنید',
      'badgeStreak7': 'جنگجوی هفته',
      'badgeStreak7Desc': '۷ روز متوالی مطالعه کنید',
      'badgeStreak14': 'حرفه‌ای دو هفته',
      'badgeStreak14Desc': '۱۴ روز متوالی مطالعه کنید',
      'badgeStreak30': 'قهرمان ماهانه',
      'badgeStreak30Desc': '۳۰ روز متوالی مطالعه کنید',
      'badgeStreak100': 'قهرمان صد روزه',
      'badgeStreak100Desc': '۱۰۰ روز متوالی مطالعه کنید',
      // 徽章 - 类别6: 诗词
      'badgePoemLover': 'عاشق شعر',
      'badgePoemLoverDesc': '۳ شعر بیاموزید',
      'badgePoemScholar': 'دانشمند شعر',
      'badgePoemScholarDesc': '۸ شعر بیاموزید',
      // 徽章 - 类别7: 收藏
      'badgeCollector': 'جمع‌آوری‌کننده',
      'badgeCollectorDesc': '۱۰ مورد را به علاقه‌مندی‌ها اضافه کنید',
      'badgeTreasureHunter': 'شکارچی گنج',
      'badgeTreasureHunterDesc': '۲۵ مورد را به علاقه‌مندی‌ها اضافه کنید',
      'badgeUnlocked': 'نشان دریافت شد!',
      'badgeLocked': 'هنوز دریافت نشده',
      'learningProgress': 'پیشرفت یادگیری',
      // achievements_page
      'viewAll': 'مشاهده همه →',
      'startLearningToUnlockAchievements': 'برای کسب دستاوردها شروع به یادگیری کنید!',
      // favorites_page.dart
      'noFavoritesYet': 'هنوز موردعلاقه‌ای وجود ندارد',
      'noFavoritesYetHint': 'برای افزودن موارد اینجا، روی آیکون ستاره ضربه بزنید',
      // review_page.dart
      'reviewTitle': 'مرور',
      'wordsReview': 'مرور کلمات',
      'idiomsReview': 'مرور اصطلاحات',
      'proverbsReview': 'مرور ضرب‌المثل‌ها',
      'poetryReview': 'مرور شعر',
      'noMasteredWordsYet': 'هنوز کلمه‌ای تسلط یافته نشده',
      'noMasteredWordsHint': 'هر دو مرحله تمرین کلمات را کامل کنید تا کلمات اینجا اضافه شوند',
      // empty_page.dart
      'comingSoon': 'به زودی',
      'featureInDevelopment': 'ویژگی در حال توسعه است...',
      // settings_page.dart
      'resetOnboarding': 'بازنشانی راهنما',
      'resetOnboardingDesc': 'نمایش مجدد انتخاب زبان، تست سطح و تنظیم هدف',
      'confirmReset': 'بازنشانی؟',
      'resetSuccess': 'بازنشانی شد. لطفاً برنامه را مجدداً اجرا کنید.',
      'reset': 'بازنشانی',
      'resetLearningRecord': 'بازنشانی سوابق یادگیری',
      'resetLearningRecordDesc': 'پاک کردن تمام پیشرفت، موارد موردعلاقه و سوابق تسلط. زبان و تنظیمات شما حفظ خواهد شد.',
      'resetLearningRecordSuccess': 'سوابق یادگیری با موفقیت بازنشانی شد.',
      // poetry explanation buttons
      'showChineseMeaning': 'معنی چینی',
      'showNativeMeaning': 'معنی به زبان من',
      'jumpToPoem': 'پرش به شعر',
      'jumpToIdiom': 'پرش به اصطلاح',
      'jumpToProverb': 'پرش به ضرب‌المثل',
      'jumpToWord': 'پرش به کلمه',
      'wordAlreadyMastered': 'این کلمه قبلاً یاد گرفته شده است.',
      'invalidNumberHint': 'معتبر نیست، لطفاً ۱ ~ ',
      // culture_practice_page.dart
      'jumpToCulture': 'پرش به مورد',
      'nativeExplanation': 'توضیح به زبان مادری',
      'prevItem': 'قبلی',
      'nextItem': 'بعدی',
      'cultureSolarTerm': 'موقعیت خورشیدی',
      'cultureFestival': 'جشنواره',
    },
    'ar': {
      'appTitle': 'تشين جو',
      'selectNativeLanguage': 'ما اللغة التي تستخدمها لتعلم الصينية؟',
      'pleaseSelect': 'يرجى اختيار لغتك الأم',
      'confirm': 'تأكيد',
      'back': 'رجوع',
      'chooseNativeLanguage': 'اختر اللغة الأم',
      'dailyGoalMinutes': 'الهدف اليومي (في اليوم)',
      'minutes': 'دقيقة',
      'home': 'الرئيسية',
      'learning': 'التعلم',
      'profile': 'الملف الشخصي',
      'todayLearningTime': 'وقت التعلم اليوم',
      'wordsMastered': 'الكلمات المتقنة',
      'sentencesMastered': 'الجمل المتقنة',
      'advancedMastered': 'المتقدم المتقن',
      'continueLearning': 'متابعة التعلم',
      'words': 'الكلمات',
      'sentences': 'الجمل',
      'advanced': 'متقدم',
      'review': 'مراجعة',
      'favorites': 'المفضلة',
      // home_tab.dart中的文本
      'mastered': 'تم إتقانها',
      'streakLabel': 'أيام متتالية',
      'totalDaysLabel': 'إجمالي الأيام',
      'totalHoursLabel': 'ساعات التعلم',
      'wordsLabel': 'الكلمات',
      'sentencesLabel': 'الجمل',
      'advancedLabel': 'متقدم',
      'grammarLabel': 'القواعد',
      'idiomsLabel': 'الأمثال',
      'proverbsLabel': 'الحكم',
      'poetryLabel': 'الشعر',
      'unitDay': 'يوم',
      'unitDays': 'أيام',
      'unitHour': 'ساعة',
      'unitHours': 'ساعات',
      'unitItem': 'عنصر',
      'unitItems': 'عناصر',
      'myFavorites': 'مفضلتي',
      'learn': 'تعلم',
      'currentLevel': 'المستوى الحالي',
      'beginner': 'مبتدئ',
      'intermediate': 'متوسط',
      'advancedLevel': 'متقدم',
      'expert': 'خبير',
      'practiceNow': 'تمرين الآن',
      'myProfile': 'ملفي الشخصي',
      'learningStats': 'إحصائيات التعلم',
      'streak': 'أيام متتالية',
      'totalDays': 'إجمالي الأيام',
      'totalHours': 'إجمالي الساعات',
      'settings': 'الإعدادات',
      'editUsername': 'تعديل اسم المستخدم',
      'enterNewUsername': 'أدخل اسم المستخدم الجديد',
      'save': 'حفظ',
      'language': 'اللغة',
      'dailyGoal': 'الهدف اليومي',
      'notifications': 'الإشعارات',
      'noNotifications': 'لا توجد إشعارات',
      'noNotificationsDesc': 'كل شيء على ما يرام!',
      'about': 'حول',
      'logOut': 'تسجيل الخروج',
      'editProfile': 'تعديل الملف الشخصي',
      // learn_tab.dart中的文本
      'beginnerLevel': 'مبتدئ',
      'elementaryLevel': 'ابتدائي',
      'intermediateLevel': 'متوسط',
      'advancedLevelName': 'متقدم',
      'currentLevelLabel': 'المستوى الحالي',
      'wordsPractice': 'تدريب الكلمات',
      'sentencesPractice': 'تدريب الجمل',
      'grammarLearning': 'تعلم القواعد',
      'basicLearning': 'التعلم الأساسي',
      'advancedReading': 'قراءة متقدمة · الثقافة الصينية',
      'idioms': 'أمثال',
      'proverbs': 'حكم / أقوال',
      'poetry': 'شعر',
      'culture': 'معرفة ثقافية',
      'auxiliaryMaterials': 'مواد تعليمية مساعدة',
      'hskOutline': 'مخطط امتحان HSK',
      'hskMaterials': 'مواد دراسة HSK',
      'practiceNowLabel': 'تدرب الآن',
      // practice_page.dart中的文本
      'wordsPracticeTitle': 'تدريب الكلمات',
      'sentencesPracticeTitle': 'تدريب الجمل',
      'tapMicToRead': 'اضغط على الميكروفون لقراءة النص الصيني أعلاه',
      'explainInNativeLanguage': 'اشرح المعنى بلغتك الأم',
      'skip': 'تخطي',
      'showAnswer': 'إظهار الإجابة',
      'skipMasteredTitle': 'هل أتقنت هذه الكلمة بالفعل؟',
      'skipMasteredNo': 'لا',
      'skipMasteredYes': 'نعم',
      'skipIdiomMasteredTitle': 'هل أتقنت هذه العبارة بالفعل؟',
      'skipProverbMasteredTitle': 'هل أتقنت هذه الحكمة بالفعل؟',
      'pronunciationScore': 'نتيجة النطق 🎤',
      'pronunciationAccuracy': 'دقة النطق',
      'nextStepExplain': 'الخطوة التالية →',
      'meaningScore': 'نتيجة المعنى 💡',
      'meaningAccuracy': 'دقة المعنى',
      'masteredSuccess': '✅ لقد أتقنت!',
      'continueBtn': 'متابعة →',
      'tryAgain': 'حاول مرة أخرى',
      'reRecord': 'إعادة التسجيل',
      'meaningBelow': 'الشرح أدناه',
      'meaningPlaceholder': '(شرح باللغة الأم، لم يتم استيراد البيانات، فارغ مؤقتاً)',
      'close': 'إغلاق',
      'step1ReadChinese': 'اقرأ الصينية',
      'step2Explain': 'اشرح المعنى',
      'holdToRecord': 'اضغط مطولاً للتسجيل',
      'slideUpToCancel': 'اسحب لأعلى للإلغاء',
      // advanced_practice.dart
      'chineseExplanation': 'شرح صيني',
      'dataNotLoaded': '(لم يتم تحميل البيانات، فارغ مؤقتاً)',
      'loading': 'جارٍ التحميل...',
      'retry': 'إعادة المحاولة',
      'noData': '(لا توجد بيانات)',
      'optionA': 'الخيار أ',
      'optionB': 'الخيار ب',
      'optionC': 'الخيار ج',
      'optionD': 'الخيار د',
      'questionProgress': 'السؤال {current} من {total}',
      'tapToPlay': 'اضغط للعب',
      'submit': 'إرسال',
      // level_test.dart
      'whatsYourLevel': 'ما هو مستواك في اللغة الصينية؟',
      'selectBestOption': 'اختر الخيار الذي يناسب وضعك الحالي بشكل أفضل',
      'nextStep': 'الخطوة التالية',
      'levelBeginner': 'مبتدئ',
      'levelElementary': 'ابتدائي',
      'levelIntermediate': 'متوسط',
      'levelAdvanced': 'متقدم',
      // goal_setting.dart
      'setLearningGoal': 'تحديد هدف التعلم',
      'dailyConsistency': 'الانتظام اليومي يجلب تقدمًا ملحوظًا',
      'startLearning': 'ابدأ التعلم',
      'goal5min': '5 دقيقة/يوم',
      'goal5desc': 'بداية سهلة، تعلم في أي وقت',
      'goal15min': '15 دقيقة/يوم',
      'goal15desc': 'تقدم ثابت، تسجيل يومي',
      'goal30min': '30 دقيقة/يوم',
      'goal30desc': 'تعلم فعال، تقدم سريع',
      'goal60min': '60 دقيقة/يوم',
      'goal60desc': 'انغماس عميق، تقدم شامل',
      // level descriptions
      'beginnerDesc': 'بدأت للتو، أعرف بعض الأحرف الصينية',
      'elementaryDesc': 'يمكنني إجراء محادثات يومية بسيطة',
      'intermediateDesc': 'أحسنت الكلمات الشائعة، يمكنني قراءة نصوص قصيرة',
      'advancedDesc': 'مطلع على الأمثال والشعر، أتحدى الصينية المتعمقة',
      // profile_tab.dart
      'learnerName': 'المتعلم',
      'myAchievements': 'إنجازاتي',
      // 徽章 - 类别1: 入门
      'badgeBeginner': 'مبتدئ',
      'badgeBeginnerDesc': 'أتقن أول كلمة أو عبارة أو مثل',
      'badgeExplorer': 'مستكشف',
      'badgeExplorerDesc': 'استكشف 5 أقسام تعلم مختلفة',
      // 徽章 - 类别2: 词语
      'badgeWordLearner': 'متعلم الكلمات',
      'badgeWordLearnerDesc': 'أتقن 10 كلمات',
      'badgeWordKnight': 'فارس الكلمات',
      'badgeWordKnightDesc': 'أتقن 30 كلمة',
      'badgeWordMaster': 'أستاذ الكلمات',
      'badgeWordMasterDesc': 'أتقن 50 كلمة',
      'badgeWordLegend': 'أسطورة الكلمات',
      'badgeWordLegendDesc': 'أتقن 100 كلمة',
      // 徽章 - 类别3: 成语
      'badgeIdiomFirst': 'بداية العبارات',
      'badgeIdiomFirstDesc': 'أتقن أول عبارة',
      'badgeIdiomAdept': 'ماهر العبارات',
      'badgeIdiomAdeptDesc': 'أتقن 5 عبارات',
      'badgeIdiomMaster': 'أستاذ العبارات',
      'badgeIdiomMasterDesc': 'أتقن 10 عبارات',
      // 徽章 - 类别4: 谚语
      'badgeProverbFirst': 'بداية الحكم',
      'badgeProverbFirstDesc': 'أتقن أول حكمة',
      'badgeProverbAdept': 'ماهر الحكم',
      'badgeProverbAdeptDesc': 'أتقن 5 حكم',
      'badgeProverbSage': 'حكيم الحكم',
      'badgeProverbSageDesc': 'أتقن 10 حكم',
      // 徽章 - 类别5: 连续学习
      'badgeStreak3': 'استمر',
      'badgeStreak3Desc': 'ادرس 3 أيام متتالية',
      'badgeStreak7': 'محارب الأسبوع',
      'badgeStreak7Desc': 'ادرس 7 أيام متتالية',
      'badgeStreak14': 'محترف الأسبوعين',
      'badgeStreak14Desc': 'ادرس 14 يوماً متتالياً',
      'badgeStreak30': 'بطل الشهري',
      'badgeStreak30Desc': 'ادرس 30 يوماً متتالياً',
      'badgeStreak100': 'بطل القرن',
      'badgeStreak100Desc': 'ادرس 100 يوماً متتالياً',
      // 徽章 - 类别6: 诗词
      'badgePoemLover': 'عاشق الشعر',
      'badgePoemLoverDesc': 'تعلم 3 قصائد',
      'badgePoemScholar': 'عالم الشعر',
      'badgePoemScholarDesc': 'تعلم 8 قصائد',
      // 徽章 - 类别7: 收藏
      'badgeCollector': 'جامع',
      'badgeCollectorDesc': 'أضف 10 مفضلات',
      'badgeTreasureHunter': 'صياد الكنوز',
      'badgeTreasureHunterDesc': 'أضف 25 مفضلات',
      'badgeUnlocked': 'تم فتح الشارة!',
      'badgeLocked': 'لم تُفتح بعد',
      'learningProgress': 'تقدم التعلم',
      // achievements_page
      'viewAll': 'عرض الكل →',
      'startLearningToUnlockAchievements': 'ابدأ التعلم لفتح الإنجازات!',
      // favorites_page.dart
      'noFavoritesYet': 'لا مفضلات حتى الآن',
      'noFavoritesYetHint': 'اضغط على أيقونة النجمة لإضافة عناصر هنا',
      // review_page.dart
      'reviewTitle': 'مراجعة',
      'wordsReview': 'مراجعة الكلمات',
      'idiomsReview': 'مراجعة الأمثال',
      'proverbsReview': 'مراجعة الحكم',
      'poetryReview': 'مراجعة الشعر',
      'noMasteredWordsYet': 'لم تتم مراجعة أي كلمات بعد',
      'noMasteredWordsHint': 'أكمل كلا المرحلتين في تمرين الكلمات لإضافة الكلمات هنا',
      // empty_page.dart
      'comingSoon': 'قريباً',
      'featureInDevelopment': 'الميزة قيد التطوير...',
      // settings_page.dart
      'resetOnboarding': 'إعادة تعيين الإرشاد',
      'resetOnboardingDesc': 'عرض اختيار اللغة واختبار المستوى وتعيين الهدف مرة أخرى',
      'confirmReset': 'إعادة التعيين؟',
      'resetSuccess': 'تم إعادة التعيين. يرجى إعادة تشغيل التطبيق.',
      'reset': 'إعادة التعيين',
      'resetLearningRecord': 'إعادة تعيين سجلات التعلم',
      'resetLearningRecordDesc': 'مسح جميع التقدم والمفضلات وسجلات الإتقان. سيتم الاحتفاظ بلغتك وإعداداتك.',
      'resetLearningRecordSuccess': 'تم إعادة تعيين سجلات التعلم بنجاح.',
      // poetry explanation buttons
      'showChineseMeaning': 'المعنى الصيني',
      'showNativeMeaning': 'المعنى بلغتي',
      'jumpToPoem': 'الانتقال إلى القصيدة',
      'jumpToIdiom': 'الانتقال إلى المثل',
      'jumpToProverb': 'الانتقال إلى الحكمة',
      'jumpToWord': 'الانتقال إلى الكلمة',
      'wordAlreadyMastered': 'هذه الكلمة تم إتقانها بالفعل.',
      'invalidNumberHint': 'غير صالح، يرجى إدخال 1 ~ ',
      // culture_practice_page.dart
      'jumpToCulture': 'الانتقال إلى العنصر',
      'nativeExplanation': 'شرح باللغة الأم',
      'prevItem': 'السابق',
      'nextItem': 'التالي',
      'cultureSolarTerm': 'مصطلح شمسي',
      'cultureFestival': 'مهرجان',
    },
    'tr': {
      'appTitle': 'Chinese Go',
      'selectNativeLanguage': 'Çince öğrenmek için hangi dili kullanıyorsunuz?',
      'pleaseSelect': 'Lütfen ana dilinizi seçin',
      'confirm': 'Onayla',
      'back': 'Geri',
      'chooseNativeLanguage': 'Ana Dil Seç',
      'dailyGoalMinutes': 'Günlük Hedef (günde)',
      'minutes': 'dakika',
      'home': 'Ana Sayfa',
      'learning': 'Öğrenme',
      'profile': 'Profil',
      'todayLearningTime': 'Bugünkü Öğrenme Süresi',
      'wordsMastered': 'Öğrenilen Kelimeler',
      'sentencesMastered': 'Öğrenilen Cümleler',
      'advancedMastered': 'Öğrenilen Gelişmiş',
      'continueLearning': 'Öğrenmeye Devam Et',
      'words': 'Kelimeler',
      'sentences': 'Cümleler',
      'advanced': 'Gelişmiş',
      'review': 'Gözden Geçirme',
      'favorites': 'Favoriler',
      // home_tab.dart中的文本
      'mastered': 'Öğrenilen',
      'streakLabel': 'Arka Arkaya Gün',
      'totalDaysLabel': 'Toplam Gün',
      'totalHoursLabel': 'Öğrenme Saatleri',
      'wordsLabel': 'Kelimeler',
      'sentencesLabel': 'Cümleler',
      'advancedLabel': 'Gelişmiş',
      'grammarLabel': 'Dilbilgisi',
      'idiomsLabel': 'Deyimler',
      'proverbsLabel': 'Atasözleri',
      'poetryLabel': 'Şiir',
      'unitDay': 'gün',
      'unitDays': 'gün',
      'unitHour': 'saat',
      'unitHours': 'saat',
      'unitItem': 'öğe',
      'unitItems': 'öğe',
      'myFavorites': 'Favorilerim',
      'learn': 'Öğren',
      'currentLevel': 'Mevcut Seviye',
      'beginner': 'Başlangıç',
      'intermediate': 'Orta',
      'advancedLevel': 'İleri',
      'expert': 'Uzman',
      'practiceNow': 'Şimdi Pratik Yap',
      'myProfile': 'Profilim',
      'learningStats': 'Öğrenme İstatistikleri',
      'streak': 'Arka Arkaya Gün',
      'totalDays': 'Toplam Gün',
      'totalHours': 'Toplam Saat',
      'settings': 'Ayarlar',
      'editUsername': 'Kullanıcı Adını Düzenle',
      'enterNewUsername': 'Yeni kullanıcı adı girin',
      'save': 'Kaydet',
      'language': 'Dil',
      'dailyGoal': 'Günlük Hedef',
      'notifications': 'Bildirimler',
      'noNotifications': 'Bildirim yok',
      'noNotificationsDesc': 'Her şey yolunda!',
      'about': 'Hakkında',
      'logOut': 'Çıkış Yap',
      'editProfile': 'Profili Düzenle',
      // learn_tab.dart中的文本
      'beginnerLevel': 'Başlangıç',
      'elementaryLevel': 'Temel',
      'intermediateLevel': 'Orta',
      'advancedLevelName': 'İleri',
      'currentLevelLabel': 'Mevcut Seviye',
      'wordsPractice': 'Kelime Pratiği',
      'sentencesPractice': 'Cümle Pratiği',
      'grammarLearning': 'Dilbilgisi Öğrenme',
      'basicLearning': 'Temel Öğrenme',
      'advancedReading': 'İleri Okuma · Çin Kültürü',
      'idioms': 'Deyimler',
      'proverbs': 'Atasözleri/Sözler',
      'poetry': 'Şiir',
      'culture': 'Kültürel Bilgi',
      'auxiliaryMaterials': 'Yardımcı Öğrenme Materyalleri',
      'hskOutline': 'HSK Sınav Programı',
      'hskMaterials': 'HSK Çalışma Materyalleri',
      'practiceNowLabel': 'Şimdi Pratik Yap',
      // 新增的本地化键值
      // practice_page.dart
      'wordsPracticeTitle': 'Kelime Pratiği',
      'sentencesPracticeTitle': 'Cümle Pratiği',
      'tapMicToRead': 'Yukarıdaki Çince metni okumak için mikrofon simgesine tıklayın',
      'explainInNativeLanguage': 'Anlamını ana dilinizde açıklayın',
      'skip': 'Atla',
      'showAnswer': 'Cevabı Göster',
      'skipMasteredTitle': 'Bu kelimeyi zaten öğrendiniz mi?',
      'skipMasteredNo': 'Hayır',
      'skipMasteredYes': 'Evet',
      'skipIdiomMasteredTitle': 'Bu deyimi zaten öğrendiniz mi?',
      'skipProverbMasteredTitle': 'Bu atasözünü zaten öğrendiniz mi?',
      'pronunciationScore': 'Telaffuz Puanı 🎤',
      'pronunciationAccuracy': 'Telaffuz Doğruluğu',
      'nextStepExplain': 'Sonraki Adım →',
      'meaningScore': 'Anlama Puanı 💡',
      'meaningAccuracy': 'Anlama Doğruluğu',
      'masteredSuccess': '✅ Öğrendin!',
      'continueBtn': 'Devam Et →',
      'tryAgain': 'Tekrar Deneyin',
      'reRecord': 'Tekrar Kaydet',
      'meaningBelow': 'Açıklama Aşağıda',
      'meaningPlaceholder': '(Ana dil açıklaması, veri yüklenmedi, geçici olarak boş)',
      'close': 'Kapat',
      'step1ReadChinese': 'Çince Okuyun',
      'step2Explain': 'Anlamı Açıklayın',
      'holdToRecord': 'Kaydetmek için basılı tutun',
      'slideUpToCancel': 'İptal etmek için yukarı kaydırın',
      // advanced_practice.dart
      'chineseExplanation': 'Çince Açıklama',
      'dataNotLoaded': '(Veri yüklenmedi, geçici olarak boş)',
      'loading': 'Yükleniyor...',
      'retry': 'Tekrar Dene',
      'noData': '(Veri yok)',
      'optionA': 'Seçenek A',
      'optionB': 'Seçenek B',
      'optionC': 'Seçenek C',
      'optionD': 'Seçenek D',
      'questionProgress': 'Soru {current} / {total}',
      'tapToPlay': 'Oynatmak İçin Tıklayın',
      'submit': 'Gönder',
      // level_test.dart
      'whatsYourLevel': 'Çince seviyeniz nedir?',
      'selectBestOption': 'Mevcut durumunuza en uygun seçeneği seçin',
      'nextStep': 'Sonraki Adım',
      'levelBeginner': 'Başlangıç',
      'levelElementary': 'Temel',
      'levelIntermediate': 'Orta',
      'levelAdvanced': 'İleri',
      // goal_setting.dart
      'setLearningGoal': 'Bir öğrenme hedefi belirleyin',
      'dailyConsistency': 'Düzenlilik görünür ilerleme getirir',
      'startLearning': 'Öğrenmeye Başla',
      'goal5min': '5 dakika/gün',
      'goal5desc': 'Kolay başlangıç, istediğiniz zaman öğrenin',
      'goal15min': '15 dakika/gün',
      'goal15desc': 'Istikrarlı ilerleme, günlük kayıt',
      'goal30min': '30 dakika/gün',
      'goal30desc': 'Etkili öğrenme, hızlı ilerleme',
      'goal60min': '60 dakika/gün',
      'goal60desc': 'Derin dalış, kapsamlı atılım',
      // level descriptions
      'beginnerDesc': 'Yeni başladım, birkaç Çince karakter biliyorum',
      'elementaryDesc': 'Basit günlük konuşmalar yapabilirim',
      'intermediateDesc': 'Sık kullanılan kelimeleri öğrendim, kısa metinler okuyabilirim',
      'advancedDesc': 'Deyimler ve şiirlerle tanışım, derin Çinceyi meydan okum',
      // profile_tab.dart
      'learnerName': 'Öğrenen',
      'myAchievements': 'Başarılarım',
      // 徽章 - 类别1: 入门
      'badgeBeginner': 'Başlangıç',
      'badgeBeginnerDesc': 'İlk kelime, deyim veya atasözünü öğrenin',
      'badgeExplorer': 'Kaşif',
      'badgeExplorerDesc': '5 farklı öğrenme bölümünü keşfedin',
      // 徽章 - 类别2: 词语
      'badgeWordLearner': 'Kelime Öğrenici',
      'badgeWordLearnerDesc': '10 kelime öğrenin',
      'badgeWordKnight': 'Kelime Şövalyesi',
      'badgeWordKnightDesc': '30 kelime öğrenin',
      'badgeWordMaster': 'Kelime Ustası',
      'badgeWordMasterDesc': '50 kelime öğrenin',
      'badgeWordLegend': 'Kelime Efsanesi',
      'badgeWordLegendDesc': '100 kelime öğrenin',
      // 徽章 - 类别3: 成语
      'badgeIdiomFirst': 'Deyim Başlangıcı',
      'badgeIdiomFirstDesc': 'İlk deyimi öğrenin',
      'badgeIdiomAdept': 'Deyim Uzmanı',
      'badgeIdiomAdeptDesc': '5 deyim öğrenin',
      'badgeIdiomMaster': 'Deyim Ustası',
      'badgeIdiomMasterDesc': '10 deyim öğrenin',
      // 徽章 - 类别4: 谚语
      'badgeProverbFirst': 'Atasözü Başlangıcı',
      'badgeProverbFirstDesc': 'İlk atasözünü öğrenin',
      'badgeProverbAdept': 'Atasözü Uzmanı',
      'badgeProverbAdeptDesc': '5 atasözü öğrenin',
      'badgeProverbSage': 'Atasözü Bilgesi',
      'badgeProverbSageDesc': '10 atasözü öğrenin',
      // 徽章 - 类别5: 连续学习
      'badgeStreak3': 'Devam Et',
      'badgeStreak3Desc': '3 gün üst üste çalışın',
      'badgeStreak7': 'Haftalık Savaşçı',
      'badgeStreak7Desc': '7 gün üst üste çalışın',
      'badgeStreak14': 'İki Haftalık Uzman',
      'badgeStreak14Desc': '14 gün üst üste çalışın',
      'badgeStreak30': 'Aylık Şampiyon',
      'badgeStreak30Desc': '30 gün üst üste çalışın',
      'badgeStreak100': 'Yüzyılın Kahramanı',
      'badgeStreak100Desc': '100 gün üst üste çalışın',
      // 徽章 - 类别6: 诗词
      'badgePoemLover': 'Şiir Aşığı',
      'badgePoemLoverDesc': '3 şiir öğrenin',
      'badgePoemScholar': 'Şiir Bilgini',
      'badgePoemScholarDesc': '8 şiir öğrenin',
      // 徽章 - 类别7: 收藏
      'badgeCollector': 'Koleksiyoncu',
      'badgeCollectorDesc': '10 favorileme yapın',
      'badgeTreasureHunter': 'Hazine Avcısı',
      'badgeTreasureHunterDesc': '25 favorileme yapın',
      'badgeUnlocked': 'Rozet Kazanıldı!',
      'badgeLocked': 'Henüz kazanılmadı',
      'learningProgress': 'Öğrenme İlerlemesi',
      // achievements_page
      'viewAll': 'Tümünü Gör →',
      'startLearningToUnlockAchievements': 'Başarımları açmak için öğrenmeye başlayın!',
      // review_page.dart
      'reviewTitle': 'Gözden Geçirme',
      'wordsReview': 'Kelime Gözden Geçirme',
      'idiomsReview': 'Deyim Gözden Geçirme',
      'proverbsReview': 'Atasözü Gözden Geçirme',
      'poetryReview': 'Şiir Gözden Geçirme',
      'noMasteredWordsYet': 'Henüz kelime öğrenilmedi',
      'noMasteredWordsHint': 'Buraya kelime eklemek için kelime pratiğinde her iki adımı da tamamlayın',
      // empty_page.dart
      'comingSoon': 'Yakında',
      'featureInDevelopment': 'Özellik geliştirme aşamasında...',
      // settings_page.dart
      'resetOnboarding': 'Onboard Sıfırla',
      'resetOnboardingDesc': 'Dil seçimini, seviye testini ve hedef ayarını tekrar göster',
      'confirmReset': 'Sıfırla?',
      'resetSuccess': 'Sıfırlandı. Lütfen uygulamayı yeniden başlatın.',
      'reset': 'Sıfırla',
      'resetLearningRecord': 'Öğrenme Kayıtlarını Sıfırla',
      'resetLearningRecordDesc': 'Tüm öğrenme ilerlemesini, favorileri ve öğrenilenleri temizle. Dil ve ayarlarınız korunacaktır.',
      'resetLearningRecordSuccess': 'Öğrenme kayıtları başarıyla sıfırlandı.',
      // poetry explanation buttons
      'showChineseMeaning': 'Çince Anlam',
      'showNativeMeaning': 'Kendi Dilimde Anlam',
      'jumpToPoem': 'Şiire Git',
      'jumpToIdiom': 'Deyime Git',
      'jumpToProverb': 'Atasözüne Git',
      'jumpToWord': 'Kelimeye Git',
      'wordAlreadyMastered': 'Bu kelime zaten öğrenildi.',
      'invalidNumberHint': 'geçersiz, lütfen 1 ~ ',
      // culture_practice_page.dart
      'jumpToCulture': 'Öğeye Git',
      'nativeExplanation': 'Ana Dil Açıklaması',
      'prevItem': 'Önceki',
      'nextItem': 'Sonraki',
      'cultureSolarTerm': 'Güneş Dönemi',
      'cultureFestival': 'Festival',
    },
  };

  String get appTitle => _localizedValues[locale.languageCode]?['appTitle'] ?? 'Chinese Go';
  String get selectNativeLanguage => _localizedValues[locale.languageCode]?['selectNativeLanguage'] ?? 'What language do you use to learn Chinese?';
  String get pleaseSelect => _localizedValues[locale.languageCode]?['pleaseSelect'] ?? 'Please select your native language';
  String get confirm => _localizedValues[locale.languageCode]?['confirm'] ?? 'Confirm';
  String get back => _localizedValues[locale.languageCode]?['back'] ?? 'Back';
  String get chooseNativeLanguage => _localizedValues[locale.languageCode]?['chooseNativeLanguage'] ?? 'Choose Native Language';
  String get dailyGoalMinutes => _localizedValues[locale.languageCode]?['dailyGoalMinutes'] ?? 'Daily Goal (minutes)';
  String get minutes => _localizedValues[locale.languageCode]?['minutes'] ?? 'minutes';
  String get home => _localizedValues[locale.languageCode]?['home'] ?? 'Home';
  String get learning => _localizedValues[locale.languageCode]?['learning'] ?? 'Learning';
  String get profile => _localizedValues[locale.languageCode]?['profile'] ?? 'Profile';
  String get todayLearningTime => _localizedValues[locale.languageCode]?['todayLearningTime'] ?? 'Today Learning Time';
  String get wordsMastered => _localizedValues[locale.languageCode]?['wordsMastered'] ?? 'Words Mastered';
  String get sentencesMastered => _localizedValues[locale.languageCode]?['sentencesMastered'] ?? 'Sentences Mastered';
  String get advancedMastered => _localizedValues[locale.languageCode]?['advancedMastered'] ?? 'Advanced Mastered';
  String get continueLearning => _localizedValues[locale.languageCode]?['continueLearning'] ?? 'Continue Learning';
  String get words => _localizedValues[locale.languageCode]?['words'] ?? 'Words';
  String get sentences => _localizedValues[locale.languageCode]?['sentences'] ?? 'Sentences';
  String get advanced => _localizedValues[locale.languageCode]?['advanced'] ?? 'Advanced';
  String get review => _localizedValues[locale.languageCode]?['review'] ?? 'Review';
  String get favorites => _localizedValues[locale.languageCode]?['favorites'] ?? 'Favorites';
  String get learn => _localizedValues[locale.languageCode]?['learn'] ?? 'Learn';
  String get currentLevel => _localizedValues[locale.languageCode]?['currentLevel'] ?? 'Current Level';
  String get beginner => _localizedValues[locale.languageCode]?['beginner'] ?? 'Beginner';
  String get intermediate => _localizedValues[locale.languageCode]?['intermediate'] ?? 'Intermediate';
  String get advancedLevel => _localizedValues[locale.languageCode]?['advancedLevel'] ?? 'Advanced';
  String get expert => _localizedValues[locale.languageCode]?['expert'] ?? 'Expert';
  String get practiceNow => _localizedValues[locale.languageCode]?['practiceNow'] ?? 'Practice Now';
  String get myProfile => _localizedValues[locale.languageCode]?['myProfile'] ?? 'My Profile';
  String get learningStats => _localizedValues[locale.languageCode]?['learningStats'] ?? 'Learning Stats';
  String get streak => _localizedValues[locale.languageCode]?['streak'] ?? 'Day Streak';
  String get totalDays => _localizedValues[locale.languageCode]?['totalDays'] ?? 'Total Days';
  String get totalHours => _localizedValues[locale.languageCode]?['totalHours'] ?? 'Total Hours';
  String get settings => _localizedValues[locale.languageCode]?['settings'] ?? 'Settings';
  String get editUsername => _localizedValues[locale.languageCode]?['editUsername'] ?? 'Edit Username';
  String get enterNewUsername => _localizedValues[locale.languageCode]?['enterNewUsername'] ?? 'Enter new username';
  String get save => _localizedValues[locale.languageCode]?['save'] ?? 'Save';
  String get language => _localizedValues[locale.languageCode]?['language'] ?? 'Language';
  String get dailyGoal => _localizedValues[locale.languageCode]?['dailyGoal'] ?? 'Daily Goal';
  String get notifications => _localizedValues[locale.languageCode]?['notifications'] ?? 'Notifications';
  String get noNotifications => _localizedValues[locale.languageCode]?['noNotifications'] ?? 'No notifications';
  String get noNotificationsDesc => _localizedValues[locale.languageCode]?['noNotificationsDesc'] ?? 'You\'re all caught up!';
  String get about => _localizedValues[locale.languageCode]?['about'] ?? 'About';
  String get logOut => _localizedValues[locale.languageCode]?['logOut'] ?? 'Log Out';
  String get editProfile => _localizedValues[locale.languageCode]?['editProfile'] ?? 'Edit Profile';
  
  // home_tab.dart中的文本
  String get mastered => _localizedValues[locale.languageCode]?['mastered'] ?? 'Mastered';
  String get streakLabel => _localizedValues[locale.languageCode]?['streakLabel'] ?? 'Day Streak';
  String get totalDaysLabel => _localizedValues[locale.languageCode]?['totalDaysLabel'] ?? 'Total Days';
  String get totalHoursLabel => _localizedValues[locale.languageCode]?['totalHoursLabel'] ?? 'Learning Hours';
  String get wordsLabel => _localizedValues[locale.languageCode]?['wordsLabel'] ?? 'Words';
  String get sentencesLabel => _localizedValues[locale.languageCode]?['sentencesLabel'] ?? 'Sentences';
  String get advancedLabel => _localizedValues[locale.languageCode]?['advancedLabel'] ?? 'Advanced';
  String get grammarLabel => _localizedValues[locale.languageCode]?['grammarLabel'] ?? 'Grammar';
  String get idiomsLabel => _localizedValues[locale.languageCode]?['idiomsLabel'] ?? 'Idioms';
  String get proverbsLabel => _localizedValues[locale.languageCode]?['proverbsLabel'] ?? 'Proverbs';
  String get poetryLabel => _localizedValues[locale.languageCode]?['poetryLabel'] ?? 'Poetry';
  String get myFavorites => _localizedValues[locale.languageCode]?['myFavorites'] ?? 'My Favorites';

  // 单位文本
  String get unitDay => _localizedValues[locale.languageCode]?['unitDay'] ?? 'day';
  String get unitDays => _localizedValues[locale.languageCode]?['unitDays'] ?? 'days';
  String get unitHour => _localizedValues[locale.languageCode]?['unitHour'] ?? 'hour';
  String get unitHours => _localizedValues[locale.languageCode]?['unitHours'] ?? 'hours';
  String get unitItem => _localizedValues[locale.languageCode]?['unitItem'] ?? 'item';
  String get unitItems => _localizedValues[locale.languageCode]?['unitItems'] ?? 'items';
  
  // learn_tab.dart中的文本
  String get beginnerLevel => _localizedValues[locale.languageCode]?['beginnerLevel'] ?? 'Beginner';
  String get elementaryLevel => _localizedValues[locale.languageCode]?['elementaryLevel'] ?? 'Elementary';
  String get intermediateLevel => _localizedValues[locale.languageCode]?['intermediateLevel'] ?? 'Intermediate';
  String get advancedLevelName => _localizedValues[locale.languageCode]?['advancedLevelName'] ?? 'Advanced';
  String get currentLevelLabel => _localizedValues[locale.languageCode]?['currentLevelLabel'] ?? 'Current Level';
  String get wordsPractice => _localizedValues[locale.languageCode]?['wordsPractice'] ?? 'Words Practice';
  String get sentencesPractice => _localizedValues[locale.languageCode]?['sentencesPractice'] ?? 'Sentences Practice';
  String get grammarLearning => _localizedValues[locale.languageCode]?['grammarLearning'] ?? 'Grammar Learning';
  String get basicLearning => _localizedValues[locale.languageCode]?['basicLearning'] ?? 'Basic Learning';
  String get advancedReading => _localizedValues[locale.languageCode]?['advancedReading'] ?? 'Advanced Reading · Chinese Culture';
  String get idioms => _localizedValues[locale.languageCode]?['idioms'] ?? 'Idioms';
  String get proverbs => _localizedValues[locale.languageCode]?['proverbs'] ?? 'Proverbs/Sayings';
  String get poetry => _localizedValues[locale.languageCode]?['poetry'] ?? 'Poetry';
  String get culture => _localizedValues[locale.languageCode]?['culture'] ?? 'Cultural Knowledge';
  String get auxiliaryMaterials => _localizedValues[locale.languageCode]?['auxiliaryMaterials'] ?? 'Auxiliary Learning Materials';
  String get hskOutline => _localizedValues[locale.languageCode]?['hskOutline'] ?? 'HSK Exam Outline';
  String get hskMaterials => _localizedValues[locale.languageCode]?['hskMaterials'] ?? 'HSK Study Materials';
  String get practiceNowLabel => _localizedValues[locale.languageCode]?['practiceNowLabel'] ?? 'Practice Now';

  // practice_page.dart中的文本
  String get wordsPracticeTitle => _localizedValues[locale.languageCode]?['wordsPracticeTitle'] ?? 'Words Practice';
  String get sentencesPracticeTitle => _localizedValues[locale.languageCode]?['sentencesPracticeTitle'] ?? 'Sentences Practice';
  String get tapMicToRead => _localizedValues[locale.languageCode]?['tapMicToRead'] ?? 'Tap the microphone to read the Chinese above';
  String get explainInNativeLanguage => _localizedValues[locale.languageCode]?['explainInNativeLanguage'] ?? 'Explain the meaning in your native language';
  String get skip => _localizedValues[locale.languageCode]?['skip'] ?? 'Skip';
  String get showAnswer => _localizedValues[locale.languageCode]?['showAnswer'] ?? 'Show Answer';
  String get skipMasteredTitle => _localizedValues[locale.languageCode]?['skipMasteredTitle'] ?? 'Have you already mastered this word?';
  String get skipMasteredNo => _localizedValues[locale.languageCode]?['skipMasteredNo'] ?? 'No';
  String get skipMasteredYes => _localizedValues[locale.languageCode]?['skipMasteredYes'] ?? 'Yes';
  String get skipIdiomMasteredTitle => _localizedValues[locale.languageCode]?['skipIdiomMasteredTitle'] ?? 'Have you already mastered this idiom?';
  String get skipProverbMasteredTitle => _localizedValues[locale.languageCode]?['skipProverbMasteredTitle'] ?? 'Have you already mastered this proverb?';
  String get pronunciationScore => _localizedValues[locale.languageCode]?['pronunciationScore'] ?? 'Pronunciation Score 🎤';
  String get pronunciationAccuracy => _localizedValues[locale.languageCode]?['pronunciationAccuracy'] ?? 'Pronunciation Accuracy';
  String get nextStepExplain => _localizedValues[locale.languageCode]?['nextStepExplain'] ?? 'Next Step →';
  String get meaningScore => _localizedValues[locale.languageCode]?['meaningScore'] ?? 'Meaning Score 💡';
  String get meaningAccuracy => _localizedValues[locale.languageCode]?['meaningAccuracy'] ?? 'Meaning Accuracy';
  String get masteredSuccess => _localizedValues[locale.languageCode]?['masteredSuccess'] ?? '✅ You have mastered!';
  String get continueBtn => _localizedValues[locale.languageCode]?['continueBtn'] ?? 'Continue →';
  String get tryAgain => _localizedValues[locale.languageCode]?['tryAgain'] ?? 'Try Again';
  String get reRecord => _localizedValues[locale.languageCode]?['reRecord'] ?? 'Re-record';
  String get meaningBelow => _localizedValues[locale.languageCode]?['meaningBelow'] ?? 'Explanation below';
  String get meaningPlaceholder => _localizedValues[locale.languageCode]?['meaningPlaceholder'] ?? '(Native language explanation, data not imported, temporarily blank)';
  String get close => _localizedValues[locale.languageCode]?['close'] ?? 'Close';
  String get step1ReadChinese => _localizedValues[locale.languageCode]?['step1ReadChinese'] ?? 'Read Chinese';
  String get step2Explain => _localizedValues[locale.languageCode]?['step2Explain'] ?? 'Explain Meaning';
  String get holdToRecord => _localizedValues[locale.languageCode]?['holdToRecord'] ?? 'Hold to record';
  String get slideUpToCancel => _localizedValues[locale.languageCode]?['slideUpToCancel'] ?? 'Slide up to cancel';

  // review_page.dart中的文本
  String get reviewTitle => _localizedValues[locale.languageCode]?['reviewTitle'] ?? 'Review';
  String get wordsReview => _localizedValues[locale.languageCode]?['wordsReview'] ?? 'Words Review';
  String get idiomsReview => _localizedValues[locale.languageCode]?['idiomsReview'] ?? 'Idioms Review';
  String get proverbsReview => _localizedValues[locale.languageCode]?['proverbsReview'] ?? 'Proverbs Review';
  String get poetryReview => _localizedValues[locale.languageCode]?['poetryReview'] ?? 'Poetry Review';
  String get noMasteredWordsYet => _localizedValues[locale.languageCode]?['noMasteredWordsYet'] ?? 'No words mastered yet';
  String get noMasteredWordsHint => _localizedValues[locale.languageCode]?['noMasteredWordsHint'] ?? 'Complete both steps in words practice to add words here';

  String get questionProgress => _localizedValues[locale.languageCode]?['questionProgress'] ?? 'Question {current} of {total}';
  String get tapToPlay => _localizedValues[locale.languageCode]?['tapToPlay'] ?? 'Tap to Play';
  String get submit => _localizedValues[locale.languageCode]?['submit'] ?? 'Submit';
  String get optionA => _localizedValues[locale.languageCode]?['optionA'] ?? 'Option A';
  String get optionB => _localizedValues[locale.languageCode]?['optionB'] ?? 'Option B';
  String get optionC => _localizedValues[locale.languageCode]?['optionC'] ?? 'Option C';
  String get optionD => _localizedValues[locale.languageCode]?['optionD'] ?? 'Option D';

  // advanced_practice.dart中的文本
  String get chineseExplanation => _localizedValues[locale.languageCode]?['chineseExplanation'] ?? 'Chinese Explanation';
  String get dataNotLoaded => _localizedValues[locale.languageCode]?['dataNotLoaded'] ?? '(Data not loaded, temporarily blank)';
  String get loading => _localizedValues[locale.languageCode]?['loading'] ?? 'Loading...';
  String get retry => _localizedValues[locale.languageCode]?['retry'] ?? 'Retry';
  String get noData => _localizedValues[locale.languageCode]?['noData'] ?? '(No data)';

  // favorites_page.dart中的文本
  String get myFavoritesTitle => _localizedValues[locale.languageCode]?['myFavorites'] ?? 'My Favorites';
  String get noFavoritesYet => _localizedValues[locale.languageCode]?['noFavoritesYet'] ?? 'No favorites yet';
  String get noFavoritesYetHint => _localizedValues[locale.languageCode]?['noFavoritesYetHint'] ?? 'Tap the star icon to add items here';

  // empty_page.dart中的文本
  String get comingSoon => _localizedValues[locale.languageCode]?['comingSoon'] ?? 'Coming Soon';
  String get featureInDevelopment => _localizedValues[locale.languageCode]?['featureInDevelopment'] ?? 'Feature is under development...';

  // profile_tab.dart中的文本
  String get learnerName => _localizedValues[locale.languageCode]?['learnerName'] ?? 'Learner';
  String get myAchievements => _localizedValues[locale.languageCode]?['myAchievements'] ?? 'My Achievements';
  // 徽章 - 类别1: 入门
  String get badgeBeginner => _localizedValues[locale.languageCode]?['badgeBeginner'] ?? 'Beginner';
  String get badgeBeginnerDesc => _localizedValues[locale.languageCode]?['badgeBeginnerDesc'] ?? 'Master your first word, idiom or proverb';
  String get badgeExplorer => _localizedValues[locale.languageCode]?['badgeExplorer'] ?? 'Explorer';
  String get badgeExplorerDesc => _localizedValues[locale.languageCode]?['badgeExplorerDesc'] ?? 'Explore 5 different learning sections';
  // 徽章 - 类别2: 词语
  String get badgeWordLearner => _localizedValues[locale.languageCode]?['badgeWordLearner'] ?? 'Word Learner';
  String get badgeWordLearnerDesc => _localizedValues[locale.languageCode]?['badgeWordLearnerDesc'] ?? 'Master 10 words';
  String get badgeWordKnight => _localizedValues[locale.languageCode]?['badgeWordKnight'] ?? 'Word Knight';
  String get badgeWordKnightDesc => _localizedValues[locale.languageCode]?['badgeWordKnightDesc'] ?? 'Master 30 words';
  String get badgeWordMaster => _localizedValues[locale.languageCode]?['badgeWordMaster'] ?? 'Word Master';
  String get badgeWordMasterDesc => _localizedValues[locale.languageCode]?['badgeWordMasterDesc'] ?? 'Master 50 words';
  String get badgeWordLegend => _localizedValues[locale.languageCode]?['badgeWordLegend'] ?? 'Word Legend';
  String get badgeWordLegendDesc => _localizedValues[locale.languageCode]?['badgeWordLegendDesc'] ?? 'Master 100 words';
  // 徽章 - 类别3: 成语
  String get badgeIdiomFirst => _localizedValues[locale.languageCode]?['badgeIdiomFirst'] ?? 'Idiom Starter';
  String get badgeIdiomFirstDesc => _localizedValues[locale.languageCode]?['badgeIdiomFirstDesc'] ?? 'Master your first idiom';
  String get badgeIdiomAdept => _localizedValues[locale.languageCode]?['badgeIdiomAdept'] ?? 'Idiom Adept';
  String get badgeIdiomAdeptDesc => _localizedValues[locale.languageCode]?['badgeIdiomAdeptDesc'] ?? 'Master 5 idioms';
  String get badgeIdiomMaster => _localizedValues[locale.languageCode]?['badgeIdiomMaster'] ?? 'Idiom Master';
  String get badgeIdiomMasterDesc => _localizedValues[locale.languageCode]?['badgeIdiomMasterDesc'] ?? 'Master 10 idioms';
  // 徽章 - 类别4: 谚语
  String get badgeProverbFirst => _localizedValues[locale.languageCode]?['badgeProverbFirst'] ?? 'Proverb Starter';
  String get badgeProverbFirstDesc => _localizedValues[locale.languageCode]?['badgeProverbFirstDesc'] ?? 'Master your first proverb';
  String get badgeProverbAdept => _localizedValues[locale.languageCode]?['badgeProverbAdept'] ?? 'Proverb Adept';
  String get badgeProverbAdeptDesc => _localizedValues[locale.languageCode]?['badgeProverbAdeptDesc'] ?? 'Master 5 proverbs';
  String get badgeProverbSage => _localizedValues[locale.languageCode]?['badgeProverbSage'] ?? 'Proverb Sage';
  String get badgeProverbSageDesc => _localizedValues[locale.languageCode]?['badgeProverbSageDesc'] ?? 'Master 10 proverbs';
  // 徽章 - 类别5: 连续学习
  String get badgeStreak3 => _localizedValues[locale.languageCode]?['badgeStreak3'] ?? 'Keep Going';
  String get badgeStreak3Desc => _localizedValues[locale.languageCode]?['badgeStreak3Desc'] ?? 'Study 3 days in a row';
  String get badgeStreak7 => _localizedValues[locale.languageCode]?['badgeStreak7'] ?? 'Week Warrior';
  String get badgeStreak7Desc => _localizedValues[locale.languageCode]?['badgeStreak7Desc'] ?? 'Study 7 days in a row';
  String get badgeStreak14 => _localizedValues[locale.languageCode]?['badgeStreak14'] ?? 'Fortnight Pro';
  String get badgeStreak14Desc => _localizedValues[locale.languageCode]?['badgeStreak14Desc'] ?? 'Study 14 days in a row';
  String get badgeStreak30 => _localizedValues[locale.languageCode]?['badgeStreak30'] ?? 'Monthly Champion';
  String get badgeStreak30Desc => _localizedValues[locale.languageCode]?['badgeStreak30Desc'] ?? 'Study 30 days in a row';
  String get badgeStreak100 => _localizedValues[locale.languageCode]?['badgeStreak100'] ?? 'Century Hero';
  String get badgeStreak100Desc => _localizedValues[locale.languageCode]?['badgeStreak100Desc'] ?? 'Study 100 days in a row';
  // 徽章 - 类别6: 诗词
  String get badgePoemLover => _localizedValues[locale.languageCode]?['badgePoemLover'] ?? 'Poetry Lover';
  String get badgePoemLoverDesc => _localizedValues[locale.languageCode]?['badgePoemLoverDesc'] ?? 'Learn 3 poems';
  String get badgePoemScholar => _localizedValues[locale.languageCode]?['badgePoemScholar'] ?? 'Poetry Scholar';
  String get badgePoemScholarDesc => _localizedValues[locale.languageCode]?['badgePoemScholarDesc'] ?? 'Learn 8 poems';
  // 徽章 - 类别7: 收藏
  String get badgeCollector => _localizedValues[locale.languageCode]?['badgeCollector'] ?? 'Collector';
  String get badgeCollectorDesc => _localizedValues[locale.languageCode]?['badgeCollectorDesc'] ?? 'Favorite 10 items';
  String get badgeTreasureHunter => _localizedValues[locale.languageCode]?['badgeTreasureHunter'] ?? 'Treasure Hunter';
  String get badgeTreasureHunterDesc => _localizedValues[locale.languageCode]?['badgeTreasureHunterDesc'] ?? 'Favorite 25 items';
  String get badgeUnlocked => _localizedValues[locale.languageCode]?['badgeUnlocked'] ?? 'Badge Unlocked!';
  String get badgeLocked => _localizedValues[locale.languageCode]?['badgeLocked'] ?? 'Not yet unlocked';
  String get learningProgress => _localizedValues[locale.languageCode]?['learningProgress'] ?? 'Learning Progress';

  // achievements_page
  String get viewAll => _localizedValues[locale.languageCode]?['viewAll'] ?? 'View All →';
  String get startLearningToUnlockAchievements => _localizedValues[locale.languageCode]?['startLearningToUnlockAchievements'] ?? 'Start learning to unlock achievements!';

  // settings_page.dart中的文本
  String get resetOnboarding => _localizedValues[locale.languageCode]?['resetOnboarding'] ?? 'Reset Onboarding';
  String get resetOnboardingDesc => _localizedValues[locale.languageCode]?['resetOnboardingDesc'] ?? 'Show language selection, level test and goal setting again';
  String get confirmReset => _localizedValues[locale.languageCode]?['confirmReset'] ?? 'Reset?';
  String get resetSuccess => _localizedValues[locale.languageCode]?['resetSuccess'] ?? 'Reset successful. Please restart the app.';
  String get reset => _localizedValues[locale.languageCode]?['reset'] ?? 'Reset';
  String get resetLearningRecord => _localizedValues[locale.languageCode]?['resetLearningRecord'] ?? 'Reset Learning Records';
  String get resetLearningRecordDesc => _localizedValues[locale.languageCode]?['resetLearningRecordDesc'] ?? 'Clear all learning progress, favorites, and mastery records. Your language and settings will be kept.';
  String get resetLearningRecordSuccess => _localizedValues[locale.languageCode]?['resetLearningRecordSuccess'] ?? 'Learning records reset successful.';
  String get showChineseMeaning => _localizedValues[locale.languageCode]?['showChineseMeaning'] ?? 'Chinese Meaning';
  String get showNativeMeaning => _localizedValues[locale.languageCode]?['showNativeMeaning'] ?? 'My Language Meaning';
  String get jumpToPoem => _localizedValues[locale.languageCode]?['jumpToPoem'] ?? 'Jump to Poem';
  String get jumpToIdiom => _localizedValues[locale.languageCode]?['jumpToIdiom'] ?? 'Jump to Idiom';
  String get jumpToProverb => _localizedValues[locale.languageCode]?['jumpToProverb'] ?? 'Jump to Proverb';
  String get jumpToWord => _localizedValues[locale.languageCode]?['jumpToWord'] ?? 'Jump to Word';
  String get wordAlreadyMastered => _localizedValues[locale.languageCode]?['wordAlreadyMastered'] ?? 'This word is already mastered.';
  String get invalidNumberHint => _localizedValues[locale.languageCode]?['invalidNumberHint'] ?? 'is not valid, please enter 1 ~ ';
  // culture_practice_page.dart
  String get jumpToCulture => _localizedValues[locale.languageCode]?['jumpToCulture'] ?? 'Jump to Item';
  String get nativeExplanation => _localizedValues[locale.languageCode]?['nativeExplanation'] ?? 'Native Explanation';
  String get prevItem => _localizedValues[locale.languageCode]?['prevItem'] ?? 'Previous';
  String get nextItem => _localizedValues[locale.languageCode]?['nextItem'] ?? 'Next';
  String get cultureSolarTerm => _localizedValues[locale.languageCode]?['cultureSolarTerm'] ?? 'Solar Term';
  String get cultureFestival => _localizedValues[locale.languageCode]?['cultureFestival'] ?? 'Festival';
  String get cancel => _localizedValues[locale.languageCode]?['confirm'] ?? 'Cancel';

  // level_test.dart中的文本
  String get whatsYourLevel => _localizedValues[locale.languageCode]?['whatsYourLevel'] ?? 'What is your Chinese level?';
  String get selectBestOption => _localizedValues[locale.languageCode]?['selectBestOption'] ?? 'Select the option that best matches your current situation';
  String get nextStep => _localizedValues[locale.languageCode]?['nextStep'] ?? 'Next Step';
  String get levelBeginner => _localizedValues[locale.languageCode]?['levelBeginner'] ?? 'Beginner';
  String get levelElementary => _localizedValues[locale.languageCode]?['levelElementary'] ?? 'Elementary';
  String get levelIntermediate => _localizedValues[locale.languageCode]?['levelIntermediate'] ?? 'Intermediate';
  String get levelAdvanced => _localizedValues[locale.languageCode]?['levelAdvanced'] ?? 'Advanced';

  // goal_setting.dart中的文本
  String get setLearningGoal => _localizedValues[locale.languageCode]?['setLearningGoal'] ?? 'Set a learning goal';
  String get dailyConsistency => _localizedValues[locale.languageCode]?['dailyConsistency'] ?? 'Consistency brings visible progress';
  String get startLearning => _localizedValues[locale.languageCode]?['startLearning'] ?? 'Start Learning';
  String get goal5min => _localizedValues[locale.languageCode]?['goal5min'] ?? '5 min/day';
  String get goal5desc => _localizedValues[locale.languageCode]?['goal5desc'] ?? 'Easy start, learn anytime';
  String get goal15min => _localizedValues[locale.languageCode]?['goal15min'] ?? '15 min/day';
  String get goal15desc => _localizedValues[locale.languageCode]?['goal15desc'] ?? 'Steady progress, daily check-in';
  String get goal30min => _localizedValues[locale.languageCode]?['goal30min'] ?? '30 min/day';
  String get goal30desc => _localizedValues[locale.languageCode]?['goal30desc'] ?? 'Efficient learning, fast progress';
  String get goal60min => _localizedValues[locale.languageCode]?['goal60min'] ?? '60 min/day';
  String get goal60desc => _localizedValues[locale.languageCode]?['goal60desc'] ?? 'Deep immersion, comprehensive breakthrough';

  // level descriptions
  String get beginnerDesc => _localizedValues[locale.languageCode]?['beginnerDesc'] ?? 'Just started, know a few Chinese characters';
  String get elementaryDesc => _localizedValues[locale.languageCode]?['elementaryDesc'] ?? 'Can have simple daily conversations';
  String get intermediateDesc => _localizedValues[locale.languageCode]?['intermediateDesc'] ?? 'Master common words, can read short texts';
  String get advancedDesc => _localizedValues[locale.languageCode]?['advancedDesc'] ?? 'Familiar with idioms and poetry, challenge deep Chinese';

  // 动态文本方法
  String minutesText(int count) => '$count ${_localizedValues[locale.languageCode]?['minutes'] ?? 'minutes'}';
  
  // 带单位的动态文本
  String dayText(int count) => '$count ${count == 1 ? unitDay : unitDays}';
  String hourText(int count) => '$count ${count == 1 ? unitHour : unitHours}';
  String itemText(int count) => '$count ${count == 1 ? unitItem : unitItems}';
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru', 'fa', 'ar', 'tr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}