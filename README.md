# Chinese Go App — Flutter

> 面向外国人的中文学习语音评测 App，帮助学习者通过听、说、测三个维度深度掌握中文词汇与发音。

---

## 目录

- [项目简介](#项目简介)
- [核心功能](#核心功能)
- [技术架构](#技术架构)
- [多语言支持](#多语言支持)
- [项目结构](#项目结构)
- [快速开始](#快速开始)
- [页面说明](#页面说明)
- [UI 组件](#ui-组件)
- [开发进度](#开发进度)

---

## 项目简介

**Chinese Go App** 是一款专为外国人设计的中文学习 App。用户可以：

1. **听 → 解释**：听中文词汇/成语/古诗词，用母语语音解释含义，AI 进行三维评分
2. **读 → 评测**：朗读中文，AI 评测发音与声调准确度

分级体系覆盖从零基础到高阶：

| 级别 | 对应等级 | 内容 |
|------|----------|------|
| 入门 | HSK 1–2 级 | 基础字词 |
| 初级 | HSK 3–4 级 | 常用词句 |
| 中级 | HSK 5–6 级 | 进阶表达 |
| 高级 | HSK 7–9 级 | 成语、谚语、歇后语、古诗词 |

---

## 核心功能

### 语义理解评分（听力练习）
- 用户听中文内容后，用母语语音描述其含义
- AI 三维评分系统：
  - **字面义**：对字面意思的理解
  - **引申义**：对隐含意思的理解
  - **现实意义**：在实际语境中的运用
- 三层评分机制：关键词匹配 → 语义相似度（sentence-transformers）→ LLM 深度判断（DeepSeek）

### 发音声调评测（朗读练习）
- 用户跟读中文词汇或句子
- AI 评测声调、发音准确度
- 实时反馈与改进建议

### 词汇学习系统
- 卡片式学习，支持收藏与复习
- 学习进度跟踪与统计
- 按级别和类别分类浏览

---

## 技术架构

### 前端（Flutter）
```
框架：Flutter（支持 Android、iOS、Windows Desktop）
状态管理：Provider + SharedPreferences
路由：go_router（自定义淡入淡出动画 200ms）
国际化：自定义 AppLocalizations（5 种语言）
```

### 后端（计划）
```
语音识别：OpenAI Whisper large-v3（后端部署，移动端上传音频文件）
语义评分：sentence-transformers（语义相似度）+ DeepSeek API（深度判断）
备选方案：科大讯飞星火（有免费额度）
```

### 主要依赖
```yaml
flutter_riverpod / provider     # 状态管理
go_router                       # 路由
shared_preferences              # 本地存储
window_manager: ^0.3.9          # Windows 窗口控制（手机比例 390×844）
```

---

## 多语言支持

App 支持 **5 种界面语言**，涵盖 LTR 和 RTL 两种布局方向：

| 语言 | 代码 | 布局方向 | 原生名称 |
|------|------|----------|----------|
| 英语 | `en` | LTR（从左到右） | English |
| 俄语 | `ru` | LTR | Русский |
| 土耳其语 | `tr` | LTR | Türkçe |
| 波斯语 | `fa` | **RTL**（从右到左） | فارسی |
| 阿拉伯语 | `ar` | **RTL**（从右到左） | العربية |

### 实现方式

**本地化类**（`lib/l10n/app_localizations.dart`）
- 包含 100+ 个本地化键值
- 涵盖所有界面文本：导航栏、按钮、提示、标签、对话框等
- 支持在运行时动态切换语言（无需重启 App）

**语言配置**（`lib/config/app_languages.dart`）
- `AppLanguage` 数据类，包含 locale、原生名称、英文名、RTL 标识
- `supportedLanguages` 全局列表
- `getLanguage(String code)` 辅助函数

**RTL 布局支持**（`lib/utils/rtl_utils.dart` / `lib/utils/rtl_layout.dart`）
- 自动检测当前语言是否为 RTL
- 提供 RTL 包装器组件（`RtlAwareWidget`）
- 自动调整：文字对齐、图标镜像、边距方向

### 本地化文本覆盖范围

| 界面 | 状态 |
|------|------|
| 语言选择页面 | ✅ 完整本地化 |
| 水平测试页面 | ✅ 完整本地化 |
| 目标设置页面 | ✅ 完整本地化 |
| 首页（Home Tab） | ✅ 完整本地化 |
| 学习页（Learn Tab） | ✅ 完整本地化 |
| 我的页面（Profile Tab） | ✅ 完整本地化 |
| 字词/句子练习 | ✅ 完整本地化 |
| 高阶练习 | ✅ 完整本地化 |
| 听力练习 | ✅ 完整本地化 |
| 收藏页面 | ✅ 完整本地化 |
| 复习页面 | ✅ 完整本地化 |
| 底部导航栏 | ✅ 完整本地化 |

---

## 项目结构

```
lib/
├── main.dart                    # 应用入口，配置国际化框架
├── router.dart                  # go_router 路由配置（含淡入淡出动画）
│
├── config/
│   └── app_languages.dart       # 语言配置（AppLanguage 类，supportedLanguages 列表）
│
├── l10n/
│   └── app_localizations.dart   # 本地化类（5种语言，100+ 键值）
│
├── utils/
│   ├── rtl_utils.dart           # RTL 语言检测工具
│   └── rtl_layout.dart          # RTL 布局包装组件
│
├── providers/
│   └── app_provider.dart        # 全局状态（语言、学习进度等）
│
├── screens/
│   ├── splash_screen.dart       # 启动页
│   ├── language_selection.dart  # 语言选择（首次启动）
│   ├── level_test.dart          # 水平测试
│   ├── goal_setting.dart        # 学习目标设置
│   ├── main_layout.dart         # 底部导航栏布局
│   ├── home_tab.dart            # 首页
│   ├── learn_tab.dart           # 学习页（级别/类别选择）
│   ├── profile_tab.dart         # 我的页面
│   ├── practice_page.dart       # 字词/句子练习
│   ├── advanced_practice.dart   # 高阶练习（成语/古诗词）
│   ├── listening_practice.dart  # 听力练习
│   ├── favorites_page.dart      # 收藏
│   ├── review_page.dart         # 复习
│   └── empty_page.dart          # 占位页面
│
└── widgets/
    └── sound_wave_button.dart   # 声波喇叭按钮组件
```

---

## 快速开始

### 环境要求

- Flutter SDK 3.x（推荐最新稳定版）
- Dart 3.x
- Android Studio 或 VS Code（安装 Flutter 插件）
- Windows 系统（当前主要在 Windows Desktop 模式开发/测试）

### 安装步骤

```bash
# 1. 克隆项目
git clone https://gitee.com/linlinsh/chinese_go_app_v2.git
cd chinese_go_app_v2

# 2. 安装依赖
flutter pub get

# 3. 生成 Windows 桌面支持（首次需要）
flutter create --platforms=windows .

# 4. 运行
flutter run -d windows
```

> **详细指南** 请参阅 [`运行指南.md`](./运行指南.md)，包含 Flutter SDK 安装、PATH 配置、flutter doctor 问题排查、模拟器创建、常见报错解决等完整步骤。

### Windows 窗口说明

App 在 Windows 上以手机比例运行（390×844），由 `window_manager` 控制窗口大小，模拟真实手机体验。

---

## 页面说明

### 首次启动流程
```
SplashScreen → 语言选择 → 水平测试 → 学习目标设置 → 主界面
```

### 主界面（底部导航栏）
| Tab | 功能 |
|-----|------|
| 首页 | 每日推荐、快速进入练习 |
| 学习 | 按级别/类别浏览词汇，进入练习模式 |
| 我的 | 学习统计、成就、设置 |

### 练习模式

**字词/句子练习**（`practice_page.dart`）
- Step 1：朗读中文词卡，听 TTS 发音
- Step 2：录音解释含义，提交评分

**高阶练习**（`advanced_practice.dart`）
- 适用于成语、古诗词等高阶内容
- 同样两步骤，显示更多文化背景信息

**听力练习**（`listening_practice.dart`）
- 点击大喇叭播放中文音频
- 从多个选项中选出正确含义
- 支持单选/多选题型

---

## UI 组件

### SoundWaveButton（声波喇叭按钮）

通用的带动画喇叭按钮，点击后触发声波扩散动画，模拟正在播放音频的效果。

```dart
// 基础用法（默认蓝色，36px）
SoundWaveButton(
  onTap: () { /* 播放音频 */ },
)

// 自定义颜色和尺寸（听力练习大号橙色版）
SoundWaveButton(
  size: 88,
  color: Colors.deepOrange,  // 一键设置主色
  iconSize: 44,
  onTap: () { /* 播放音频 */ },
)
```

**参数说明**

| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| `size` | `double` | `36` | 按钮直径（px） |
| `iconSize` | `double?` | `size * 0.5` | 图标大小 |
| `color` | `Color?` | `Color(0xFF4285F4)` | 一键主色（图标 + 声波） |
| `iconColor` | `Color?` | 同 `color` | 图标颜色（优先于 color） |
| `bgColor` | `Color` | `Colors.white` | 未播放时背景色 |
| `waveColor` | `Color?` | 同 `color` | 声波颜色（优先于 color） |
| `onTap` | `VoidCallback?` | `null` | 点击回调 |

**动画效果**
- 播放中：按钮变主色，图标变白，两圈同心声波向外扩散渐隐
- 点击时：图标轻微弹起缩放效果
- 2 秒后自动停止；播放中再次点击可立即停止

---

## 开发进度

### 已完成 ✅
- [x] 完整 Flutter 项目骨架（18 个页面）
- [x] 所有页面 UI 实现（从 Figma/React 转换）
- [x] go_router 路由配置（含页面切换动画）
- [x] Provider 状态管理
- [x] Windows Desktop 运行支持
- [x] 5 种界面语言（英/俄/土/波斯/阿拉伯）
- [x] RTL 布局完整支持（波斯语/阿拉伯语）
- [x] 所有界面文本完整本地化（100+ 键值）
- [x] SoundWaveButton 声波动画组件
- [x] 喇叭按钮声波动画（字词练习/高阶练习/听力练习）
- [x] 删除国旗图标，改用语言图标
- [x] 步骤栏两行统一布局
- [x] Git 配置（.gitattributes，LF 行尾符）

### 进行中 🔄
- [ ] 后端接口对接（语音识别、评分 API）
- [ ] TTS（flutter_tts）接入
- [ ] 录音功能（record 包）实现
- [ ] 真实词汇数据库接入

### 计划中 📋
- [ ] Android / iOS 适配测试
- [ ] 用户账号系统
- [ ] 学习数据云同步
- [ ] 网页版（Web 平台）

---

## 仓库信息

- **Gitee**：https://gitee.com/linlinsh/chinese_go_app_v2
- **分支**：master
