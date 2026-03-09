<div align="center">

# 🎓 国防科技大学学位论文 LaTeX 模板

**适用于硕士、博士学位论文的标准化排版模板**

[![License](https://img.shields.io/badge/License-LaTeX%20Project-blue.svg)](https://www.latex-project.org/lppl/)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey.svg)](https://www.latex-project.org/)

</div>

---

## 📖 目录

- [功能特性](#-功能特性)
- [环境要求](#-环境要求)
- [快速开始](#-快速开始)
- [项目结构](#-项目结构)
- [配置说明](#-配置说明)
- [使用指南](#-使用指南)
- [常见问题](#-常见问题)
- [贡献指南](#-贡献指南)

---

## ✨ 功能特性

- 📝 **符合规范** - 严格按照国防科技大学学位论文格式要求设计
- 🔤 **中英文支持** - 完善的中英文混排支持，自动处理字体切换
- 📚 **参考文献** - 支持 biblatex + biber，符合 GB/T 7714 标准
- 🎨 **自动排版** - 封面、目录、摘要、章节等自动生成规范格式
- 📊 **图表支持** - 完善的表格、图片、公式排版能力
- 🔒 **盲审模式** - 一键切换盲审模式，自动隐藏个人信息
- 🛠️ **一键编译** - 提供自动化编译脚本，简化编译流程

---

## 💻 环境要求

| 组件         | 要求                    |
| :----------- | :---------------------- |
| TeX 发行版   | TeX Live (完整安装)     |
| 编译引擎     | XeLaTeX                 |
| 参考文献工具 | Biber                   |
| 操作系统     | Windows / macOS / Linux |

> 💡 **提示**：推荐使用 TeX Live 完整安装，确保所有依赖包可用

---

## 🚀 快速开始

### 1️⃣ 克隆项目

```bash
git clone https://github.com/yuruofeng/nudt_thesis_template.git
cd nudt_thesis_template
```

### 2️⃣ 编译论文

**Windows 用户：**

```powershell
.\build.bat
```

**macOS / Linux 用户：**

```bash
# 设置环境变量
export TEXINPUTS=./cls//:$TEXINPUTS
export BSTINPUTS=./cls//:$BSTINPUTS

# 编译流程
xelatex thesis
biber thesis
xelatex thesis
xelatex thesis

# 清理中间文件（可选）
rm -f *.aux *.log *.toc *.out *.bbl *.blg *.bcf *.run.xml
```

### 3️⃣ 查看结果

编译完成后，生成 `thesis.pdf` 文件。

---

## 📁 项目结构

```
nudt_thesis_template/
├── 📄 thesis.tex              # 主文件（唯一入口）
├── 📄 build.bat               # Windows 编译脚本
├── 📄 README.md               # 项目说明文档
│
├── 📂 cls/                    # 样式文件目录
│   ├── nudtpaper.cls          # 文档类（请勿修改）
│   ├── nudtpaper.cfg          # 配置文件
│   ├── mynudt.sty             # 用户自定义宏包
│   ├── slashbox.sty           # 斜线表头支持
│   ├── bstutf8.bst            # BibTeX 样式
│   └── nomencl.ist            # 符号索引样式
│
├── 📂 chapters/               # 章节内容目录
│   ├── 📄 abstract.tex        # 中英文摘要
│   ├── 📄 denotation.tex      # 符号表
│   ├── 📄 ack.tex             # 致谢
│   ├── 📄 resume.tex          # 个人简历与成果
│   ├── 📄 appendix01.tex      # 附录
│   │
│   ├── 📂 chap01/             # 第一章
│   │   ├── chap01.tex         # 章节入口
│   │   ├── sec_01_introduction.tex
│   │   ├── sec_02_model.tex
│   │   ├── sec_03_algorithm.tex
│   │   ├── sec_04_experiment.tex
│   │   └── sec_05_summary.tex
│   │
│   ├── 📂 chap02/ ~ 📂 chap06/ # 第二至六章
│   └── ...
│
├── 📂 figures/                # 图片资源目录
│   └── ...
│
├── 📂 ref/                    # 参考文献目录
│   ├── refs.bib               # 正文参考文献
│   └── resume.bib             # 简历成果文献
│
├── 📂 a3cover/                # A3 封面生成工具
│   └── ...
│
└── 📂 extras/                 # 扩展资源（不参与编译）
    └── ...
```

---

## ⚙️ 配置说明

### 文档类选项

在 `thesis.tex` 中修改 `\documentclass` 参数：

```latex
\documentclass[doctor,twoside,biber,resumebib,ttf]{nudtpaper}
```

| 选项          | 说明                     |
| :------------ | :----------------------- |
| `master`    | 硕士学位论文             |
| `doctor`    | 博士学位论文             |
| `twoside`   | 双面打印模式             |
| `ttf`       | 使用 TrueType 字体       |
| `otf`       | 使用 OpenType 字体       |
| `fz`        | 使用方正字体             |
| `fandol`    | 使用 Fandol 字体         |
| `biber`     | 使用 biblatex + biber    |
| `resumebib` | 简历文献由 biblatex 生成 |
| `anon`      | 盲审模式（隐藏个人信息） |

### 论文元信息

在 `thesis.tex` 中填写论文基本信息：

```latex
\classification{TPxxx}                    % 分类号
\serialno{000000}                         % 学号
\title{论文中文题目}                       % 中文题目
\author{作者姓名}                          % 作者
\entitle{English Title}                   % 英文题目
\subject{学科专业}                         % 专业
\supervisor{导师姓名\quad{}职称}           % 导师
```

---

## 📚 使用指南

### 添加新章节

1. **创建章节目录**

   ```bash
   mkdir chapters/chap07
   ```
2. **创建章节入口文件** `chapters/chap07/chap07.tex`：

   ```latex
   \chapter{章节标题}\label{chap07}

   \input{chapters/chap07/sec_01_introduction}
   \input{chapters/chap07/sec_02_model}
   \input{chapters/chap07/sec_03_algorithm}
   \input{chapters/chap07/sec_04_experiment}
   \input{chapters/chap07/sec_05_summary}
   ```
3. **创建各小节文件**
4. **在 `thesis.tex` 中添加引用**：

   ```latex
   \input{chapters/chap07/chap07}
   ```

### 自定义命令

在 `cls/mynudt.sty` 中添加自定义宏包和命令：

```latex
% 加载宏包
\usepackage{algorithm2e}    % 算法
\usepackage{listings}       % 代码

% 自定义命令
\newcommand{\R}{\mathbb{R}}  % 实数域
\newcommand{\vect}[1]{\boldsymbol{#1}}  % 向量
```

### 插入图片

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.8\textwidth]{figures/example.pdf}
  \caption{图片标题}
  \label{fig:example}
\end{figure}
```

### 添加参考文献

在 `ref/refs.bib` 中添加：

```bibtex
@article{reference-key,
  author  = {Author, First and Author, Second},
  title   = {Article Title},
  journal = {Journal Name},
  year    = {2024},
  volume  = {1},
  pages   = {1-10},
}
```

在正文中引用：

```latex
\cite{reference-key}
```

---

## ❓ 常见问题

<details>
<summary><b>🔧 编译错误：File 'nudtpaper.cls' not found</b></summary>

**原因**：未正确设置环境变量，LaTeX 无法找到样式文件

**解决方案**：使用 `build.bat` 脚本编译，或手动设置 `TEXINPUTS` 环境变量

```powershell
$env:TEXINPUTS=".\cls//;$env:TEXINPUTS"
```

</details>

<details>
<summary><b>🔧 交叉引用显示为问号</b></summary>

**原因**：编译不完整，交叉引用信息未生成

**解决方案**：运行完整编译流程（xelatex → biber → xelatex → xelatex）

</details>

<details>
<summary><b>🔧 参考文献未显示</b></summary>

**原因**：bib 文件格式错误或引用键不存在

**解决方案**：

1. 检查 `ref/refs.bib` 文件格式
2. 确认 `\cite{}` 中的引用键与 bib 文件一致
3. 运行完整编译流程

</details>

<details>
<summary><b>🔧 字体缺失警告</b></summary>

**原因**：系统未安装所需字体

**解决方案**：

1. 安装 TeX Live 完整版
2. 或修改文档类选项为 `fandol`（使用开源字体）

</details>

---

## 🤝 贡献指南

欢迎提交 Issue 和 Pull Request 帮助改进模板！

### 提交规范

- 🐛 **Bug 修复**：描述问题现象和修复方案
- ✨ **功能增强**：说明新增功能和适用场景
- 📝 **文档改进**：修正错误或补充说明

### 代码风格

- LaTeX 代码保持清晰缩进
- 新增功能需添加注释说明
- 遵循现有命名规范

---

## 📄 许可证

本项目基于 LaTeX Project Public License 发布。
