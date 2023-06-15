local fcitx = require("fcitx")

vim.api.nvim_create_user_command("FcitxEnableSwitch", fcitx.enable_switch, {})
vim.api.nvim_create_user_command("FcitxDisableSwitch", fcitx.disable_switch, {})
