local M = {}

local function inactivate_input_method()
    -- 静默处理异常
    local input_status = tonumber(vim.fn.system("fcitx5-remote")) or 1
    -- 关闭为1
    if input_status ~= 1 then
        vim.fn.system("fcitx5-remote -c")
    end
end

local function activate_input_method()
    -- 静默处理异常
    local input_status = tonumber(vim.fn.system("fcitx5-remote")) or 2
    -- 激活为2
    if input_status == 1 then
        vim.fn.system("fcitx5-remote -o")
    end
end

function M.enable_switch()
    local fcitx_switch_ag = vim.api.nvim_create_augroup("fcitx_switch", { clear = true })

    vim.api.nvim_create_autocmd("InsertLeave", {
        group = fcitx_switch_ag,
        callback = inactivate_input_method,
    })

    vim.api.nvim_create_autocmd("InsertEnter", {
        group = fcitx_switch_ag,
        callback = activate_input_method,
    })

    vim.g.fcitx_able_switch = true
end

function M.disable_switch()
    vim.api.nvim_del_augroup_by_name("fcitx_switch")
    vim.g.fcitx_able_switch = false
end

function M.toggle_switch()
    if not vim.g.fcitx_able_switch then
        M.enable_switch()
    else
        M.disable_switch()
    end
end

return M
