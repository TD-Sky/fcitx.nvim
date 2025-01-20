# fcitx.nvim

自动切换 fcitx 输入法，运行时可 **开启/关闭** 自动切换。

进入插入模式时切换至中文，返回正常模式时切换至英文。



## 前置要求

- 终端下请设置 `vim.opt.ttimeoutlen` 为较小值（如100），否则退出插入模式时会有较严重的延迟。同样会造成延迟的还有 tmux 的 `escape-time` 选项。
- 请确认 `fcitx5-configtool` 设置了关闭输入法时切换成英文，开启输入法时切换成中文。



## 安装

使用 lazy

```lua
{ "TD-Sky/fcitx.nvim" }
```



## 配置示例

```lua
{
    "TD-Sky/fcitx.nvim",
    keys = {
        {
            "<leader>ux",
            "<cmd>FcitxToggleSwitch<CR>",
            desc = "开关输入法自动切换",
        },
    },
}
```



## 特别鸣谢

- [fcitx.vim](https://github.com/lilydjwg/fcitx.vim)
- [Fcitx#Vim - ArchWiki](https://wiki.archlinux.org/title/Fcitx#Vim)
