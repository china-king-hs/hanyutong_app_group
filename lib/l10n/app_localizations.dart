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
      // 徽章 - 类别1: 词语
      'badgeWord500': 'Word Pro',
      'badgeWord500Desc': 'Master 500 words',
      'badgeWord1000': 'Word Expert',
      'badgeWord1000Desc': 'Master 1000 words',
      'badgeWord3000': 'Word Master',
      'badgeWord3000Desc': 'Master 3000 words',
      // 徽章 - 类别2: 成语
      'badgeIdiom10': 'Idiom Starter',
      'badgeIdiom10Desc': 'Master 10 idioms',
      'badgeIdiom50': 'Idiom Adept',
      'badgeIdiom50Desc': 'Master 50 idioms',
      'badgeIdiom100': 'Idiom Expert',
      'badgeIdiom100Desc': 'Master 100 idioms',
      'badgeIdiom500': 'Idiom Master',
      'badgeIdiom500Desc': 'Master 500 idioms',
      // 徽章 - 类别3: 谚语
      'badgeProverb10': 'Proverb Starter',
      'badgeProverb10Desc': 'Master 10 proverbs',
      'badgeProverb30': 'Proverb Adept',
      'badgeProverb30Desc': 'Master 30 proverbs',
      'badgeProverb50': 'Proverb Expert',
      'badgeProverb50Desc': 'Master 50 proverbs',
      'badgeProverb100': 'Proverb Sage',
      'badgeProverb100Desc': 'Master 100 proverbs',
      // 徽章 - 类别4: 诗词
      'badgePoem5': 'Poetry Lover',
      'badgePoem5Desc': 'Learn 5 poems',
      'badgePoem10': 'Poetry Scholar',
      'badgePoem10Desc': 'Learn 10 poems',
      'badgePoem50': 'Poetry Expert',
      'badgePoem50Desc': 'Learn 50 poems',
      'badgePoem100': 'Poetry Master',
      'badgePoem100Desc': 'Learn 100 poems',
      // 徽章 - 类别5: 收藏
      'badgeFav10': 'Collector',
      'badgeFav10Desc': 'Favorite 10 items',
      'badgeFav50': 'Fav Enthusiast',
      'badgeFav50Desc': 'Favorite 50 items',
      'badgeFav100': 'Fav Expert',
      'badgeFav100Desc': 'Favorite 100 items',
      'badgeFav500': 'Fav Master',
      'badgeFav500Desc': 'Favorite 500 items',
      'badgeFav1000': 'Fav Legend',
      'badgeFav1000Desc': 'Favorite 1000 items',
      'badgeFav3000': 'Fav Champion',
      'badgeFav3000Desc': 'Favorite 3000 items',
      // 徽章 - 类别6: 连续学习
      'badgeStreak3': 'Keep Going',
      'badgeStreak3Desc': 'Study 3 days in a row',
      'badgeStreak7': 'Week Warrior',
      'badgeStreak7Desc': 'Study 7 days in a row',
      'badgeStreak14': 'Fortnight Pro',
      'badgeStreak14Desc': 'Study 14 days in a row',
      'badgeStreak30': 'Monthly Champion',
      'badgeStreak30Desc': 'Study 30 days in a row',
      // 徽章 - 类别7: 累计学习天数
      'badgeTotalDays3': 'Day 3',
      'badgeTotalDays3Desc': 'Study for 3 days total',
      'badgeTotalDays7': 'Week Scholar',
      'badgeTotalDays7Desc': 'Study for 7 days total (one week)',
      'badgeTotalDays15': 'Half Month',
      'badgeTotalDays15Desc': 'Study for 15 days total',
      'badgeTotalDays30': 'Month Scholar',
      'badgeTotalDays30Desc': 'Study for 30 days total (one month)',
      'badgeTotalDays100': 'Century Scholar',
      'badgeTotalDays100Desc': 'Study for 100 days total',
      'badgeTotalDays365': 'Year Champion',
      'badgeTotalDays365Desc': 'Study for 365 days total (one year)',
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
      // 徽章 - 类别1: 词语
      'badgeWord500': 'Словесный профи',
      'badgeWord500Desc': 'Освойте 500 слов',
      'badgeWord1000': 'Эксперт слов',
      'badgeWord1000Desc': 'Освойте 1000 слов',
      'badgeWord3000': 'Мастер слов',
      'badgeWord3000Desc': 'Освойте 3000 слов',
      // 徽章 - 类别2: 成语
      'badgeIdiom10': 'Начало идиом',
      'badgeIdiom10Desc': 'Освойте 10 идиом',
      'badgeIdiom50': 'Знаток идиом',
      'badgeIdiom50Desc': 'Освойте 50 идиом',
      'badgeIdiom100': 'Эксперт идиом',
      'badgeIdiom100Desc': 'Освойте 100 идиом',
      'badgeIdiom500': 'Мастер идиом',
      'badgeIdiom500Desc': 'Освойте 500 идиом',
      // 徽章 - 类别3: 谚语
      'badgeProverb10': 'Начало пословиц',
      'badgeProverb10Desc': 'Освойте 10 пословиц',
      'badgeProverb30': 'Знаток пословиц',
      'badgeProverb30Desc': 'Освойте 30 пословиц',
      'badgeProverb50': 'Эксперт пословиц',
      'badgeProverb50Desc': 'Освойте 50 пословиц',
      'badgeProverb100': 'Мудрец пословиц',
      'badgeProverb100Desc': 'Освойте 100 пословиц',
      // 徽章 - 类别4: 诗词
      'badgePoem5': 'Любитель поэзии',
      'badgePoem5Desc': 'Выучите 5 стихотворений',
      'badgePoem10': 'Поэтический учёный',
      'badgePoem10Desc': 'Выучите 10 стихотворений',
      'badgePoem50': 'Эксперт поэзии',
      'badgePoem50Desc': 'Выучите 50 стихотворений',
      'badgePoem100': 'Мастер поэзии',
      'badgePoem100Desc': 'Выучите 100 стихотворений',
      // 徽章 - 类别5: 收藏
      'badgeFav10': 'Коллекционер',
      'badgeFav10Desc': 'Добавьте 10 избранных',
      'badgeFav50': 'Энтузиаст избранного',
      'badgeFav50Desc': 'Добавьте 50 избранных',
      'badgeFav100': 'Эксперт избранного',
      'badgeFav100Desc': 'Добавьте 100 избранных',
      'badgeFav500': 'Мастер избранного',
      'badgeFav500Desc': 'Добавьте 500 избранных',
      'badgeFav1000': 'Легенда избранного',
      'badgeFav1000Desc': 'Добавьте 1000 избранных',
      'badgeFav3000': 'Чемпион коллекций',
      'badgeFav3000Desc': 'Добавьте 3000 избранных',
      // 徽章 - 类别6: 连续学习
      'badgeStreak3': 'Не сдавайтесь',
      'badgeStreak3Desc': 'Учитесь 3 дня подряд',
      'badgeStreak7': 'Воин недели',
      'badgeStreak7Desc': 'Учитесь 7 дней подряд',
      'badgeStreak14': 'Профессионал',
      'badgeStreak14Desc': 'Учитесь 14 дней подряд',
      'badgeStreak30': 'Чемпион месяца',
      'badgeStreak30Desc': 'Учитесь 30 дней подряд',
      // 徽章 - 类别7: 累计学习天数
      'badgeTotalDays3': 'День 3',
      'badgeTotalDays3Desc': 'Учитесь 3 дня всего',
      'badgeTotalDays7': 'Недельный ученик',
      'badgeTotalDays7Desc': 'Учитесь 7 дней всего (одна неделя)',
      'badgeTotalDays15': 'Полмесяца',
      'badgeTotalDays15Desc': 'Учитесь 15 дней всего',
      'badgeTotalDays30': 'Месячный ученик',
      'badgeTotalDays30Desc': 'Учитесь 30 дней всего (один месяц)',
      'badgeTotalDays100': 'Столетний ученик',
      'badgeTotalDays100Desc': 'Учитесь 100 дней всего',
      'badgeTotalDays365': 'Годовой чемпион',
      'badgeTotalDays365Desc': 'Учитесь 365 дней всего (один год)',
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
      // 徽章 - 类别1: 词语
      'badgeWord500': 'متخصص کلمات',
      'badgeWord500Desc': '۵۰۰ کلمه را بیاموزید',
      'badgeWord1000': 'کارشناس کلمات',
      'badgeWord1000Desc': '۱۰۰۰ کلمه را بیاموزید',
      'badgeWord3000': 'استاد کلمات',
      'badgeWord3000Desc': '۳۰۰۰ کلمه را بیاموزید',
      // 徽章 - 类别2: 成语
      'badgeIdiom10': 'شروع عبارات',
      'badgeIdiom10Desc': '۱۰ عبارت را بیاموزید',
      'badgeIdiom50': 'ماهر عبارات',
      'badgeIdiom50Desc': '۵۰ عبارت را بیاموزید',
      'badgeIdiom100': 'کارشناس عبارات',
      'badgeIdiom100Desc': '۱۰۰ عبارت را بیاموزید',
      'badgeIdiom500': 'استاد عبارات',
      'badgeIdiom500Desc': '۵۰۰ عبارت را بیاموزید',
      // 徽章 - 类别3: 谚语
      'badgeProverb10': 'شروع ضرب‌المثل‌ها',
      'badgeProverb10Desc': '۱۰ ضرب‌المثل را بیاموزید',
      'badgeProverb30': 'ماهر ضرب‌المثل‌ها',
      'badgeProverb30Desc': '۳۰ ضرب‌المثل را بیاموزید',
      'badgeProverb50': 'کارشناس ضرب‌المثل‌ها',
      'badgeProverb50Desc': '۵۰ ضرب‌المثل را بیاموزید',
      'badgeProverb100': 'حکیم ضرب‌المثل‌ها',
      'badgeProverb100Desc': '۱۰۰ ضرب‌المثل را بیاموزید',
      // 徽章 - 类别4: 诗词
      'badgePoem5': 'عاشق شعر',
      'badgePoem5Desc': '۵ شعر بیاموزید',
      'badgePoem10': 'دانشمند شعر',
      'badgePoem10Desc': '۱۰ شعر بیاموزید',
      'badgePoem50': 'کارشناس شعر',
      'badgePoem50Desc': '۵۰ شعر بیاموزید',
      'badgePoem100': 'استاد شعر',
      'badgePoem100Desc': '۱۰۰ شعر بیاموزید',
      // 徽章 - 类别5: 收藏
      'badgeFav10': 'جمع‌آوری‌کننده',
      'badgeFav10Desc': '۱۰ مورد را به علاقه‌مندی‌ها اضافه کنید',
      'badgeFav50': 'علاقه‌مند پرشور',
      'badgeFav50Desc': '۵۰ مورد را به علاقه‌مندی‌ها اضافه کنید',
      'badgeFav100': 'کارشناس علاقه‌مندی‌ها',
      'badgeFav100Desc': '۱۰۰ مورد را به علاقه‌مندی‌ها اضافه کنید',
      'badgeFav500': 'استاد علاقه‌مندی‌ها',
      'badgeFav500Desc': '۵۰۰ مورد را به علاقه‌مندی‌ها اضافه کنید',
      'badgeFav1000': 'افسانه علاقه‌مندی‌ها',
      'badgeFav1000Desc': '۱۰۰۰ مورد را به علاقه‌مندی‌ها اضافه کنید',
      'badgeFav3000': 'قهرمان مجموعه‌ها',
      'badgeFav3000Desc': '۳۰۰۰ مورد را به علاقه‌مندی‌ها اضافه کنید',
      // 徽章 - 类别6: 连续学习
      'badgeStreak3': 'ادامه دهید',
      'badgeStreak3Desc': '۳ روز متوالی مطالعه کنید',
      'badgeStreak7': 'جنگجوی هفته',
      'badgeStreak7Desc': '۷ روز متوالی مطالعه کنید',
      'badgeStreak14': 'حرفه‌ای دو هفته',
      'badgeStreak14Desc': '۱۴ روز متوالی مطالعه کنید',
      'badgeStreak30': 'قهرمان ماهانه',
      'badgeStreak30Desc': '۳۰ روز متوالی مطالعه کنید',
      // 徽章 - 类别7: 累计学习天数
      'badgeTotalDays3': 'روز ۳',
      'badgeTotalDays3Desc': 'در مجموع ۳ روز مطالعه کنید',
      'badgeTotalDays7': 'دانشجوی هفتگی',
      'badgeTotalDays7Desc': 'در مجموع ۷ روز مطالعه کنید (یک هفته)',
      'badgeTotalDays15': 'نیم ماه',
      'badgeTotalDays15Desc': 'در مجموع ۱۵ روز مطالعه کنید',
      'badgeTotalDays30': 'دانشجوی ماهانه',
      'badgeTotalDays30Desc': 'در مجموع ۳۰ روز مطالعه کنید (یک ماه)',
      'badgeTotalDays100': 'دانشجوی صد روزه',
      'badgeTotalDays100Desc': 'در مجموع ۱۰۰ روز مطالعه کنید',
      'badgeTotalDays365': 'قهرمان سالانه',
      'badgeTotalDays365Desc': 'در مجموع ۳۶۵ روز مطالعه کنید (یک سال)',
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
      // 徽章 - 类别1: 词语
      'badgeWord500': 'محترف الكلمات',
      'badgeWord500Desc': 'أتقن 500 كلمة',
      'badgeWord1000': 'خبير الكلمات',
      'badgeWord1000Desc': 'أتقن 1000 كلمة',
      'badgeWord3000': 'أستاذ الكلمات',
      'badgeWord3000Desc': 'أتقن 3000 كلمة',
      // 徽章 - 类别2: 成语
      'badgeIdiom10': 'بداية العبارات',
      'badgeIdiom10Desc': 'أتقن 10 عبارات',
      'badgeIdiom50': 'ماهر العبارات',
      'badgeIdiom50Desc': 'أتقن 50 عبارة',
      'badgeIdiom100': 'خبير العبارات',
      'badgeIdiom100Desc': 'أتقن 100 عبارة',
      'badgeIdiom500': 'أستاذ العبارات',
      'badgeIdiom500Desc': 'أتقن 500 عبارة',
      // 徽章 - 类别3: 谚语
      'badgeProverb10': 'بداية الحكم',
      'badgeProverb10Desc': 'أتقن 10 حكم',
      'badgeProverb30': 'ماهر الحكم',
      'badgeProverb30Desc': 'أتقن 30 حكمة',
      'badgeProverb50': 'خبير الحكم',
      'badgeProverb50Desc': 'أتقن 50 حكمة',
      'badgeProverb100': 'حكيم الحكم',
      'badgeProverb100Desc': 'أتقن 100 حكمة',
      // 徽章 - 类别4: 诗词
      'badgePoem5': 'عاشق الشعر',
      'badgePoem5Desc': 'تعلم 5 قصائد',
      'badgePoem10': 'عالم الشعر',
      'badgePoem10Desc': 'تعلم 10 قصائد',
      'badgePoem50': 'خبير الشعر',
      'badgePoem50Desc': 'تعلم 50 قصيدة',
      'badgePoem100': 'أستاذ الشعر',
      'badgePoem100Desc': 'تعلم 100 قصيدة',
      // 徽章 - 类别5: 收藏
      'badgeFav10': 'جامع',
      'badgeFav10Desc': 'أضف 10 مفضلات',
      'badgeFav50': 'محب المفضلات',
      'badgeFav50Desc': 'أضف 50 مفضلة',
      'badgeFav100': 'خبير المفضلات',
      'badgeFav100Desc': 'أضف 100 مفضلة',
      'badgeFav500': 'أستاذ المفضلات',
      'badgeFav500Desc': 'أضف 500 مفضلة',
      'badgeFav1000': 'أسطورة المفضلات',
      'badgeFav1000Desc': 'أضف 1000 مفضلة',
      'badgeFav3000': 'بطل المجموعات',
      'badgeFav3000Desc': 'أضف 3000 مفضلة',
      // 徽章 - 类别6: 连续学习
      'badgeStreak3': 'استمر',
      'badgeStreak3Desc': 'ادرس 3 أيام متتالية',
      'badgeStreak7': 'محارب الأسبوع',
      'badgeStreak7Desc': 'ادرس 7 أيام متتالية',
      'badgeStreak14': 'محترف الأسبوعين',
      'badgeStreak14Desc': 'ادرس 14 يوماً متتالياً',
      'badgeStreak30': 'بطل الشهري',
      'badgeStreak30Desc': 'ادرس 30 يوماً متتالياً',
      // 徽章 - 类别7: 累计学习天数
      'badgeTotalDays3': 'اليوم 3',
      'badgeTotalDays3Desc': 'ادرس لمدة 3 أيام إجمالياً',
      'badgeTotalDays7': 'طالب أسبوعي',
      'badgeTotalDays7Desc': 'ادرس لمدة 7 أيام إجمالياً (أسبوع واحد)',
      'badgeTotalDays15': 'نصف شهر',
      'badgeTotalDays15Desc': 'ادرس لمدة 15 يوماً إجمالياً',
      'badgeTotalDays30': 'طالب شهري',
      'badgeTotalDays30Desc': 'ادرس لمدة 30 يوماً إجمالياً (شهر واحد)',
      'badgeTotalDays100': 'طالب قرني',
      'badgeTotalDays100Desc': 'ادرس لمدة 100 يوم إجمالياً',
      'badgeTotalDays365': 'بطل سنوي',
      'badgeTotalDays365Desc': 'ادرس لمدة 365 يوماً إجمالياً (سنة واحدة)',
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
      // 徽章 - 类别1: 词语
      'badgeWord500': 'Kelime Uzmanı',
      'badgeWord500Desc': '500 kelime öğrenin',
      'badgeWord1000': 'Kelime Bilgini',
      'badgeWord1000Desc': '1000 kelime öğrenin',
      'badgeWord3000': 'Kelime Ustası',
      'badgeWord3000Desc': '3000 kelime öğrenin',
      // 徽章 - 类别2: 成语
      'badgeIdiom10': 'Deyim Başlangıcı',
      'badgeIdiom10Desc': '10 deyim öğrenin',
      'badgeIdiom50': 'Deyim Uzmanı',
      'badgeIdiom50Desc': '50 deyim öğrenin',
      'badgeIdiom100': 'Deyim Bilgini',
      'badgeIdiom100Desc': '100 deyim öğrenin',
      'badgeIdiom500': 'Deyim Ustası',
      'badgeIdiom500Desc': '500 deyim öğrenin',
      // 徽章 - 类别3: 谚语
      'badgeProverb10': 'Atasözü Başlangıcı',
      'badgeProverb10Desc': '10 atasözü öğrenin',
      'badgeProverb30': 'Atasözü Uzmanı',
      'badgeProverb30Desc': '30 atasözü öğrenin',
      'badgeProverb50': 'Atasözü Bilgini',
      'badgeProverb50Desc': '50 atasözü öğrenin',
      'badgeProverb100': 'Atasözü Bilgesi',
      'badgeProverb100Desc': '100 atasözü öğrenin',
      // 徽章 - 类别4: 诗词
      'badgePoem5': 'Şiir Aşığı',
      'badgePoem5Desc': '5 şiir öğrenin',
      'badgePoem10': 'Şiir Bilgini',
      'badgePoem10Desc': '10 şiir öğrenin',
      'badgePoem50': 'Şiir Uzmanı',
      'badgePoem50Desc': '50 şiir öğrenin',
      'badgePoem100': 'Şiir Ustası',
      'badgePoem100Desc': '100 şiir öğrenin',
      // 徽章 - 类别5: 收藏
      'badgeFav10': 'Koleksiyoncu',
      'badgeFav10Desc': '10 favorileme yapın',
      'badgeFav50': 'Favori Tutkunu',
      'badgeFav50Desc': '50 favorileme yapın',
      'badgeFav100': 'Favori Uzmanı',
      'badgeFav100Desc': '100 favorileme yapın',
      'badgeFav500': 'Favori Ustası',
      'badgeFav500Desc': '500 favorileme yapın',
      'badgeFav1000': 'Favori Efsanesi',
      'badgeFav1000Desc': '1000 favorileme yapın',
      'badgeFav3000': 'Koleksiyon Şampiyonu',
      'badgeFav3000Desc': '3000 favorileme yapın',
      // 徽章 - 类别6: 连续学习
      'badgeStreak3': 'Devam Et',
      'badgeStreak3Desc': '3 gün üst üste çalışın',
      'badgeStreak7': 'Haftalık Savaşçı',
      'badgeStreak7Desc': '7 gün üst üste çalışın',
      'badgeStreak14': 'İki Haftalık Uzman',
      'badgeStreak14Desc': '14 gün üst üste çalışın',
      'badgeStreak30': 'Aylık Şampiyon',
      'badgeStreak30Desc': '30 gün üst üste çalışın',
      // 徽章 - 类别7: 累计学习天数
      'badgeTotalDays3': '3. Gün',
      'badgeTotalDays3Desc': 'Toplam 3 gün çalışın',
      'badgeTotalDays7': 'Haftalık Öğrenci',
      'badgeTotalDays7Desc': 'Toplam 7 gün çalışın (bir hafta)',
      'badgeTotalDays15': 'Yarım Ay',
      'badgeTotalDays15Desc': 'Toplam 15 gün çalışın',
      'badgeTotalDays30': 'Aylık Öğrenci',
      'badgeTotalDays30Desc': 'Toplam 30 gün çalışın (bir ay)',
      'badgeTotalDays100': 'Yüzyıllık Öğrenci',
      'badgeTotalDays100Desc': 'Toplam 100 gün çalışın',
      'badgeTotalDays365': 'Yıllık Şampiyon',
      'badgeTotalDays365Desc': 'Toplam 365 gün çalışın (bir yıl)',
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
  // 徽章 - 类别1: 词语
  String get badgeWord500 => _localizedValues[locale.languageCode]?['badgeWord500'] ?? 'Word Pro';
  String get badgeWord500Desc => _localizedValues[locale.languageCode]?['badgeWord500Desc'] ?? 'Master 500 words';
  String get badgeWord1000 => _localizedValues[locale.languageCode]?['badgeWord1000'] ?? 'Word Expert';
  String get badgeWord1000Desc => _localizedValues[locale.languageCode]?['badgeWord1000Desc'] ?? 'Master 1000 words';
  String get badgeWord3000 => _localizedValues[locale.languageCode]?['badgeWord3000'] ?? 'Word Master';
  String get badgeWord3000Desc => _localizedValues[locale.languageCode]?['badgeWord3000Desc'] ?? 'Master 3000 words';
  // 徽章 - 类别2: 成语
  String get badgeIdiom10 => _localizedValues[locale.languageCode]?['badgeIdiom10'] ?? 'Idiom Starter';
  String get badgeIdiom10Desc => _localizedValues[locale.languageCode]?['badgeIdiom10Desc'] ?? 'Master 10 idioms';
  String get badgeIdiom50 => _localizedValues[locale.languageCode]?['badgeIdiom50'] ?? 'Idiom Adept';
  String get badgeIdiom50Desc => _localizedValues[locale.languageCode]?['badgeIdiom50Desc'] ?? 'Master 50 idioms';
  String get badgeIdiom100 => _localizedValues[locale.languageCode]?['badgeIdiom100'] ?? 'Idiom Expert';
  String get badgeIdiom100Desc => _localizedValues[locale.languageCode]?['badgeIdiom100Desc'] ?? 'Master 100 idioms';
  String get badgeIdiom500 => _localizedValues[locale.languageCode]?['badgeIdiom500'] ?? 'Idiom Master';
  String get badgeIdiom500Desc => _localizedValues[locale.languageCode]?['badgeIdiom500Desc'] ?? 'Master 500 idioms';
  // 徽章 - 类别3: 谚语
  String get badgeProverb10 => _localizedValues[locale.languageCode]?['badgeProverb10'] ?? 'Proverb Starter';
  String get badgeProverb10Desc => _localizedValues[locale.languageCode]?['badgeProverb10Desc'] ?? 'Master 10 proverbs';
  String get badgeProverb30 => _localizedValues[locale.languageCode]?['badgeProverb30'] ?? 'Proverb Adept';
  String get badgeProverb30Desc => _localizedValues[locale.languageCode]?['badgeProverb30Desc'] ?? 'Master 30 proverbs';
  String get badgeProverb50 => _localizedValues[locale.languageCode]?['badgeProverb50'] ?? 'Proverb Expert';
  String get badgeProverb50Desc => _localizedValues[locale.languageCode]?['badgeProverb50Desc'] ?? 'Master 50 proverbs';
  String get badgeProverb100 => _localizedValues[locale.languageCode]?['badgeProverb100'] ?? 'Proverb Sage';
  String get badgeProverb100Desc => _localizedValues[locale.languageCode]?['badgeProverb100Desc'] ?? 'Master 100 proverbs';
  // 徽章 - 类别4: 诗词
  String get badgePoem5 => _localizedValues[locale.languageCode]?['badgePoem5'] ?? 'Poetry Lover';
  String get badgePoem5Desc => _localizedValues[locale.languageCode]?['badgePoem5Desc'] ?? 'Learn 5 poems';
  String get badgePoem10 => _localizedValues[locale.languageCode]?['badgePoem10'] ?? 'Poetry Scholar';
  String get badgePoem10Desc => _localizedValues[locale.languageCode]?['badgePoem10Desc'] ?? 'Learn 10 poems';
  String get badgePoem50 => _localizedValues[locale.languageCode]?['badgePoem50'] ?? 'Poetry Expert';
  String get badgePoem50Desc => _localizedValues[locale.languageCode]?['badgePoem50Desc'] ?? 'Learn 50 poems';
  String get badgePoem100 => _localizedValues[locale.languageCode]?['badgePoem100'] ?? 'Poetry Master';
  String get badgePoem100Desc => _localizedValues[locale.languageCode]?['badgePoem100Desc'] ?? 'Learn 100 poems';
  // 徽章 - 类别5: 收藏
  String get badgeFav10 => _localizedValues[locale.languageCode]?['badgeFav10'] ?? 'Collector';
  String get badgeFav10Desc => _localizedValues[locale.languageCode]?['badgeFav10Desc'] ?? 'Favorite 10 items';
  String get badgeFav50 => _localizedValues[locale.languageCode]?['badgeFav50'] ?? 'Fav Enthusiast';
  String get badgeFav50Desc => _localizedValues[locale.languageCode]?['badgeFav50Desc'] ?? 'Favorite 50 items';
  String get badgeFav100 => _localizedValues[locale.languageCode]?['badgeFav100'] ?? 'Fav Expert';
  String get badgeFav100Desc => _localizedValues[locale.languageCode]?['badgeFav100Desc'] ?? 'Favorite 100 items';
  String get badgeFav500 => _localizedValues[locale.languageCode]?['badgeFav500'] ?? 'Fav Master';
  String get badgeFav500Desc => _localizedValues[locale.languageCode]?['badgeFav500Desc'] ?? 'Favorite 500 items';
  String get badgeFav1000 => _localizedValues[locale.languageCode]?['badgeFav1000'] ?? 'Fav Legend';
  String get badgeFav1000Desc => _localizedValues[locale.languageCode]?['badgeFav1000Desc'] ?? 'Favorite 1000 items';
  String get badgeFav3000 => _localizedValues[locale.languageCode]?['badgeFav3000'] ?? 'Fav Champion';
  String get badgeFav3000Desc => _localizedValues[locale.languageCode]?['badgeFav3000Desc'] ?? 'Favorite 3000 items';
  // 徽章 - 类别6: 连续学习
  String get badgeStreak3 => _localizedValues[locale.languageCode]?['badgeStreak3'] ?? 'Keep Going';
  String get badgeStreak3Desc => _localizedValues[locale.languageCode]?['badgeStreak3Desc'] ?? 'Study 3 days in a row';
  String get badgeStreak7 => _localizedValues[locale.languageCode]?['badgeStreak7'] ?? 'Week Warrior';
  String get badgeStreak7Desc => _localizedValues[locale.languageCode]?['badgeStreak7Desc'] ?? 'Study 7 days in a row';
  String get badgeStreak14 => _localizedValues[locale.languageCode]?['badgeStreak14'] ?? 'Fortnight Pro';
  String get badgeStreak14Desc => _localizedValues[locale.languageCode]?['badgeStreak14Desc'] ?? 'Study 14 days in a row';
  String get badgeStreak30 => _localizedValues[locale.languageCode]?['badgeStreak30'] ?? 'Monthly Champion';
  String get badgeStreak30Desc => _localizedValues[locale.languageCode]?['badgeStreak30Desc'] ?? 'Study 30 days in a row';
  // 徽章 - 类别7: 累计学习天数
  String get badgeTotalDays3 => _localizedValues[locale.languageCode]?['badgeTotalDays3'] ?? 'Day 3';
  String get badgeTotalDays3Desc => _localizedValues[locale.languageCode]?['badgeTotalDays3Desc'] ?? 'Study for 3 days total';
  String get badgeTotalDays7 => _localizedValues[locale.languageCode]?['badgeTotalDays7'] ?? 'Week Scholar';
  String get badgeTotalDays7Desc => _localizedValues[locale.languageCode]?['badgeTotalDays7Desc'] ?? 'Study for 7 days total (one week)';
  String get badgeTotalDays15 => _localizedValues[locale.languageCode]?['badgeTotalDays15'] ?? 'Half Month';
  String get badgeTotalDays15Desc => _localizedValues[locale.languageCode]?['badgeTotalDays15Desc'] ?? 'Study for 15 days total';
  String get badgeTotalDays30 => _localizedValues[locale.languageCode]?['badgeTotalDays30'] ?? 'Month Scholar';
  String get badgeTotalDays30Desc => _localizedValues[locale.languageCode]?['badgeTotalDays30Desc'] ?? 'Study for 30 days total (one month)';
  String get badgeTotalDays100 => _localizedValues[locale.languageCode]?['badgeTotalDays100'] ?? 'Century Scholar';
  String get badgeTotalDays100Desc => _localizedValues[locale.languageCode]?['badgeTotalDays100Desc'] ?? 'Study for 100 days total';
  String get badgeTotalDays365 => _localizedValues[locale.languageCode]?['badgeTotalDays365'] ?? 'Year Champion';
  String get badgeTotalDays365Desc => _localizedValues[locale.languageCode]?['badgeTotalDays365Desc'] ?? 'Study for 365 days total (one year)';
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