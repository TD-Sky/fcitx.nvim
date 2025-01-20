local fcitx = require("fcitx")

vim.api.nvim_create_user_command("FcitxToggleSwitch", fcitx.toggle_switch, {})
