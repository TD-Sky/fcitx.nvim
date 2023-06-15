# fcitx.nvim

自动切换 fcitx 输入法，运行时可 **开启/关闭** 自动切换。

进入插入模式时切换至中文，返回正常模式时切换至英文。



## 前置要求

- 终端下请设置 `vim.opt.ttimeoutlen` 为较小值（如100），否则退出插入模式时会有较严重的延迟。同样会造成延迟的还有 tmux 的 `escape-time` 选项。
- 请确认 **fcitx5-configtool** 设置了英语为第一输入法，中文为第二输入法。


## 安装

使用 lazy

```lua
{ "TD-Sky/fcitx.nvim" }
```



## 示例

```lua
{
    "TD-Sky/fcitx.nvim",
    ft = { "markdown" },
    event = "VeryLazy",
    keys = {
        {
            "<leader>ux",
            "<cmd>FcitxEnableSwitch<CR>",
            desc = "开启输入法自动切换",
        },
        {
            "<leader>uX",
            "<cmd>FcitxDisableSwitch<CR>",
            desc = "关闭输入法自动切换",
        },
    },
    config = function()
        require("fcitx").enable_switch()
    end,
}
```

- `VeryLazy`事件发生时开启自动切换（**自启动必须设置触发事件**）；
- 仅为 markdown 使用；
- 设置启用/关闭自动切换的快捷键。



## 特别鸣谢

- [fcitx.vim](https://github.com/lilydjwg/fcitx.vim)
- [Fcitx#Vim - ArchWiki](https://wiki.archlinux.org/title/Fcitx#Vim)
