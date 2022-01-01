# <center>我使用的 [NeoVim](https://neovim.io) 配置文件</center>

**持续更新中**

以下为使用说明

---

<!-- TOC Marked -->

* [安装此配置需要做的事](#安装此配置需要做的事)
* [安装此配置后可能想做的事](#安装此配置后可能想做的事)
    - [首先](#首先)
    - [配置 `Python` 路径](#配置-`python`-路径)
    - [标签表](#标签表)
    - [FZF](#fzf)
    - [其它...](#其它...)
* [快捷键](#快捷键)
    - [1 基本编辑器特性](#1-基本编辑器特性)
        + [1.1 最基本的键位](#1.1-最基本的键位)
        + [1.2 其它在普通模式下有用的键位](#1.2-其它在普通模式下有用的键位)
        + [1.3 与系统剪贴板交互](#1.3-与系统剪贴板交互)
        + [1.4 调用终端](#1.4-调用终端)
        + [1.5 markdown 自定义快捷键(插入模式)](#1.5-markdown-自定义快捷键(插入模式))
    - [2 窗口管理](#2-窗口管理)
        + [2.1 通过分裂屏幕创造窗口](#2.1-通过分裂屏幕创造窗口)
        + [2.2 切换不同的窗口](#2.2-切换不同的窗口)
        + [2.3 为不同的窗口调整大小](#2.3-为不同的窗口调整大小)
        + [2.4 关闭窗口](#2.4-关闭窗口)
    - [3 标签页管理](#3-标签页管理)
* [插件快捷键 (暂时没有截图/动图)](#插件快捷键-(暂时没有截图/动图))
    - [自动补全](#自动补全)
        + [COC (自动补全)](#coc-(自动补全))
    - [翻译](#翻译)
        + [coc-translator](#coc-translator)
    - [文字编辑](#文字编辑)
        + [goyo（更简洁的编辑环境）](#goyo（更简洁的编辑环境）)
        + [vim-table-mode](#vim-table-mode)
        + [vim-markdown-toc（生成markdown目录）](#vim-markdown-toc（生成markdown目录）)
        + [nerdcommenter（注释）](#nerdcommenter（注释）)
        + [xtabline（精致的顶栏）](#xtabline（精致的顶栏）)
        + [tabular（文本对齐）](#tabular（文本对齐）)
    - [Git](#git)
        + [GitGutter（文本内git提示）](#gitgutter（文本内git提示）)
        + [undotree（对比各版本文件信息）](#undotree（对比各版本文件信息）)
    - [拓展环境](#拓展环境)
        + [vim-floaterm（浮动终端）](#vim-floaterm（浮动终端）)
        + [vista（函数和变量等信息）](#vista（函数和变量等信息）)
        + [nerdtree（文件浏览）](#nerdtree（文件浏览）)

<!-- /TOC -->

## 安装此配置需要做的事

- [ ] 安装 `pynvim` (使用 `pip`)
- [ ] 安装 `nodejs`, 然后在终端输入 `npm install -g neovim`
- [ ] 安装 `nerd-fonts` (尽管它是可选的，但是安装之后看上去十分的酷)

## 安装此配置后可能想做的事

### 首先
- [ ] 执行 `:checkhealth`

### 配置 `Python` 路径
- [ ] 确保你安装了 Python
- [ ] 查看 `_machine_specific.vim` 文件

### 标签表
- [ ] 安装 `ctags` 以获得类/函数/变量的三重支持

### FZF
- [ ] 安装 `fzf`

### 其它...
- [ ] 安装 `figlet` 以输入 ASCII 艺术字
- [ ] 安装 `xclip` 或 `xsel` 以获得系统剪切板访问支持 (仅 `Linux` 与 `xorg` 需要)

## 快捷键

### 1 基本编辑器特性

#### 1.1 最基本的键位

`<LEADER>` as `<SPACE>`

(普通模式) `;` as `:`

(插入模式) `jk` as `<Esc>`

#### 1.2 其它在普通模式下有用的键位
| 快捷键          | 行为                     |
|-----------------|--------------------------|
| `r`             | **编译/运行当前文件**    |
| `SPACE` `s` `c` | 开关拼写检查             |
| `\` `p`         | 显示当前文件的路径       |
| `\` `s`         | 寻找对应单词并替换       |
| `t` `x`         | 使用 `figlet` 写出大字图 |
| `M`           | 提示选中的行信息         |

#### 1.3 与系统剪贴板交互
| 快捷键 | 行为                         |
|--------|------------------------------|
| `,y`   | 复制选中文本至**系统剪切板**     |
| `,p`   | **系统剪切板**粘贴至对应位置     |

#### 1.4 调用终端
| 快捷键     | 行为                         |
|--------    |------------------------------|
| `SPACE` `/`| 打开终端(默认输入)           |
| `Ctrl` `n` | 退出终端输入模式             |
| `Ctrl` `o` | 退出终端并返回当前文件       |

#### 1.5 markdown 自定义快捷键(插入模式)
| 快捷键  | 行为                                  |
|---------|---------------------------------------|
| `,f`    | 替换`<++>`,并继续输入，没有限制       |
| `,w`    | 消除`<++>`, 并换行,只能找其当行之后的 |
| `,n`    | 分隔线                                |
| `,l`    | 高亮字体                              |
| `,i`    | 斜体                                  |
| `,b`    | 加粗                                  |
| `,s`    | 划线字体                              |
| `,d`    | 代码包裹字体                          |
| `,c`    | 代码块                                |
| `,m`    | 数学公式                              |
| `,M`    | 数学公式块                            |
| `,数字` | 多级标题                              |
| `,t`    | 任务列表                              |
| `,p`    | 插入图片                              |
| `,a`    | 超链接                                |

### 2 窗口管理

#### 2.1 通过分裂屏幕创造窗口
| 快捷键      | 行为                                   |
|-------------|----------------------------------------|
| `s` `k`     | 新建一个分屏并把它放置在当前窗口的上面 |
| `s` `j`     | 新建一个分屏并把它放置在当前窗口的下面 |
| `s` `l`     | 新建一个分屏并把它放置在当前窗口的左边 |
| `s` `h`     | 新建一个分屏并把它放置在当前窗口的右边 |
| `s` `h`     | 将两个分屏垂直放置                     |
| `s` `v`     | 将两个分屏水平放置                     |
| `s` `r` `v` | 将所有分屏垂直放置                     |
| `s` `r` `h` | 将所有分屏水平放置                     |

#### 2.2 切换不同的窗口
| 快捷键        | 行为           |
|---------------|----------------|
| `SPACE` + `w` | 移至下一个窗口 |
| `SPACE` + `h` | 移至左边的窗口 |
| `SPACE` + `l` | 移至右边的窗口 |
| `SPACE` + `k` | 移至上面的窗口 |
| `SPACE` + `j` | 移至下面的窗口 |

#### 2.3 为不同的窗口调整大小

(普通模式)用方向键更改当前窗口的大小

#### 2.4 关闭窗口
| 快捷键      | 行为                                                        |
|-------------|-------------------------------------------------------------|
| `q` `f`      | 关闭除当前窗口以外的所有窗口                                                |
| `SPACE` `q` | 关闭当前窗口下面的窗口 (如果下面没有窗口，则当前窗口将关闭) |

### 3 标签页管理
| 快捷键      | 行为                           |
|-------------|--------------------------------|
| `t` `n`     | 新建一个标签页                 |
| `t` `m`     | 新建一个标签页分出当前工作界面 |
| `t` `h`     | 移至左侧标签页                 |
| `t` `l`     | 移至右侧标签页                 |
| `t` `s` `h` | 将当前标签页向左移动一格       |
| `t` `s` `l` | 将当前标签页向右移动一格       |


## 插件快捷键 (暂时没有截图/动图)

### 自动补全
#### [COC (自动补全)](https://github.com/neoclide/coc.nvim)
| 快捷键          | 行为             |
|-----------------|------------------|
| `gd`            | 列出定义列表     |
| `gr`            | 列出参考列表     |
| `gi`            | 待办事项清单     |
| `gy`            | 转至类型定义     |
| `Space` `r` `n` | 重命名变量       |
| `K`             | 查看详细信息     |
| `[` `g`         | 查找前面的错误   |
| `]` `g`         | 查找后面的错误   |
| `Space` `f`     | 格式化选中的代码 |

### 翻译
#### [coc-translator](https://github.com/voldikss/coc-translator)
| 快捷键  | 行为           |
|---------|----------------|
| `t` `s` | 翻译选中的单词 |

### 文字编辑
#### [goyo（更简洁的编辑环境）](https://github.com/junegunn/goyo)
| 快捷键          | 行为 |
|-----------------|------|
| `Space` `g` `y` | 打开 |
| `Space` `g` `q` | 关闭 |

#### [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)
| 快捷键          | 行为         |
|-----------------|--------------|
| `SPACE` `t` `m` | 开关表格模式 |
| `SPACE` `t` `r` | 重组表格     |

#### [vim-markdown-toc（生成markdown目录）](https://github.com/dhruvasagar/vim-table-mode)
| 快捷键  | 行为 |
|---------|------|
| `g` `t` | 生成 |
| `r` `t` | 删除 |

#### [nerdcommenter（注释）](https://github.com/preservim/nerdcommenter)
| 快捷键          | 行为     |
|-----------------|----------|
| `Space` `c` `c` | 注释     |
| `Space` `c` `u` | 取消注释 |

#### [xtabline（精致的顶栏）](https://github.com/mg979/vim-xtabline)
| 快捷键  | 行为               |
|---------|--------------------|
| `\` `p` | 显示当前文件的路径 |

#### [tabular（文本对齐）](https://github.com:godlygeek/tabular)
| 快捷键  | 行为                                             |
|---------|--------------------------------------------------|
| `g` `a` | Tabularize <regex> to align (按照输入的标志对齐) |

### Git
#### [GitGutter（文本内git提示）](https://github.com/airblade/vim-gitgutter)
| 快捷键          | 行为                     |
|-----------------|--------------------------|
| `Space` `g` `f` | 折叠所有除代码块以外的行 |
| `H`             | 在当前行显示 Git 代码块  |
| `g-`            | 去往上一个 git 代码块    |
| `g+`            | 去往下一个 git 代码块    |

#### [undotree（对比各版本文件信息）](https://github.com/mbbill/undotree)
| 快捷键 | 行为       |
|--------|------------|
| `L`    | 开启和关闭 |

### 拓展环境
#### [vim-floaterm（浮动终端）](https://github.com/voldikss/vim-floaterm)
| 快捷键          | 行为 |
|-----------------|------|
| `Space` `f` `t` | 打开 |
| `Space` `f` `k` | 关闭 |

#### [vista（函数和变量等信息）](https://github.com/liuchengxu/vista.vim)
| 快捷键      | 行为         |
|-------------|--------------|
| `Space` `v` | 开启和关闭   |
| `F`         | 函数变量搜索 |

#### [nerdtree（文件浏览）](https://github.com/preservim/nerdtree)
| 快捷键     | 行为             |
|------------|------------------|
| `Ctrl` `t` | 开启或关闭       |
| `Ctrl` `f` | 返回当前文件路径 |
| `q`        | 关闭             |

