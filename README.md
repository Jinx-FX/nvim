# <center>我使用的 [NeoVim](https://neovim.io) 配置文件</center>

> lua 迁移

食用说明：vim 是一款很好的文本编辑器，但我不会把它当成 IDE 去用，以下所有的配置都是为了提高编辑体验而做，不会有 Debug 等功能。

# 快捷键说明

### 1 基本编辑器特性

#### 1.1 最基本的键位

- `<LEADER>` as `<SPACE>` 
- (普通模式) `;` as `:` : 用于进入命令模式
- (普通模式) **`** as **~** : 用于切换大小写

#### 1.2 其它在普通模式下有用的键位
| 快捷键            | 行为                       |
| ----------------- | -------------------------- |
| `Ctrl` `[`        | Esc                        |
| `*`               | 在关键字之间跳转           |

### 1.3 markdown 自定义快捷键(插入模式)
| 快捷键     | 行为                                  |
|------------|---------------------------------------|
| `,` `f`    | 替换`<++>`,并继续输入，没有限制       |
| `,` `w`    | 消除`<++>`, 并换行,只能找其当行之后的 |
| `,` `n`    | 分隔线                                |
| `,` `l`    | 高亮字体                              |
| `,` `i`    | 斜体                                  |
| `,` `b`    | 加粗                                  |
| `,` `s`    | 划线字体                              |
| `,` `d`    | 代码包裹字体                          |
| `,` `c`    | 代码块                                |
| `,` `m`    | 数学公式                              |
| `,` `M`    | 数学公式块                            |
| `,` `数字` | 多级标题                              |
| `,` `t`    | 任务列表                              |
| `,` `p`    | 插入图片                              |
| `,` `a`    | 超链接                                |

### 2 窗口管理

#### 2.1 通过分裂屏幕创造窗口
| 快捷键      | 行为                                   |
|-------------|----------------------------------------|
| `<leader>` `s` `k`     | 新建一个分屏并把它放置在当前窗口的上面 |
| `<leader>` `s` `j`     | 新建一个分屏并把它放置在当前窗口的下面 |
| `<leader>` `s` `l`     | 新建一个分屏并把它放置在当前窗口的左边 |
| `<leader>` `s` `h`     | 新建一个分屏并把它放置在当前窗口的右边 |


#### 2.2 切换不同的窗口
| 快捷键          | 行为             |
| --------------- | ---------------- |
| `<leader>` `w`     | 移至下一个窗口   |
| `<leader>` `h`     | 移至左边的窗口   |
| `<leader>` `l`     | 移至右边的窗口   |
| `<leader>` `k`     | 移至上面的窗口   |
| `<leader>` `j`     | 移至下面的窗口   |

#### 2.3 为不同的窗口调整大小

(普通模式)用方向键更改当前窗口的大小

#### 2.4 关闭窗口
| 快捷键      | 行为                                                        |
|-------------|-------------------------------------------------------------|
| `q` `f`     | 关闭除当前窗口以外的所有窗口                                |

### 3 标签页管理
| 快捷键      | 行为                           |
|-------------|--------------------------------|
| `t` `n`     | 新建一个标签页                 |
| `t` `N`     | 新建一个标签页分出当前工作界面 |
| `t` `h`     | 移至左侧标签页                 |
| `t` `l`     | 移至右侧标签页                 |
| `t` `m` `h` | 将当前标签页向左移动一格       |
| `t` `m` `l` | 将当前标签页向右移动一格       |
