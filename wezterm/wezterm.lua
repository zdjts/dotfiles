-- Wezterm 配置示例
-- ~/.config/wezterm/wezterm.lua

local wezterm = require 'wezterm'

-- 这将持有你的配置选项
local config = {}

-- 在较新的 wezterm 版本中，建议使用 wezterm.config_builder()
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- [[ 配置开始 ]]

-- 强制设置 DPI
-- 96.0 是 100% 缩放的基准值。
--
-- * 如果你的系统缩放是 200%, 请使用 96.0 * 2.0
-- * 如果你的系统缩放是 150%, 请使用 96.0 * 1.5
-- * 如果你的系统缩放是 125%, 请使用 96.0 * 1.25
--
-- 请根据你的实际情况修改下面的 `2.0`
config.dpi = 96.0 * 1.25

-- config.front_end = "WebGpu"
-- 强制 wezterm 使用软件渲染后端以完全绕过 GPU 驱动问题
-- config.front_end = "Software"

-- 确保 wezterm 尝试以 wayland 模式运行
config.enable_wayland = true

-- 你可以在这里添加其他配置, 例如字体大小
-- config.font_size = 12.0

-- [[ 配置结束 ]]

return config
