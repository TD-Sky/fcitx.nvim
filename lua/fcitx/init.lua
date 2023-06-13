local M = {}

local function switch_to_en()
    local input_status = vim.fn.system("fcitx5-remote")
    if input_status ~= 1 then
        vim.g.input_toggle = 1
        vim.fn.system("fcitx5-remote -c")
    end
end

local function switch_to_zh()
    local input_status = vim.fn.system("fcitx5-remote")
    if input_status ~= 1 and vim.g.input_toggle == 1 then
        vim.fn.system("fcitx5-remote -o")
        vim.g.input_toggle = 0
    end
end

function M.enable_switch()
    vim.g.input_toggle = 1
    local fcitx_switch_ag = vim.api.nvim_create_augroup("fcitx_switch", { clear = true })

    vim.api.nvim_create_autocmd("InsertLeave", {
        group = fcitx_switch_ag,
        callback = switch_to_en,
    })

    vim.api.nvim_create_autocmd("InsertEnter", {
        group = fcitx_switch_ag,
        callback = switch_to_zh,
    })
end

function M.disable_switch()
    vim.api.nvim_del_augroup_by_name("fcitx_switch")
end

function M.setup()
    vim.api.nvim_create_user_command("FcitxEnableSwitch", M.enable_switch, {})
    vim.api.nvim_create_user_command("FcitxDisableSwitch", M.disable_switch, {})
end

return M
