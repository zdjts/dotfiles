#!/bin/bash

# --- 修正后的配置 ---
STATE_FILE="$HOME/.local/state/waybar_work_time.state" # 保持 XDG 规范

# --- 辅助函数：状态读取 (与之前代码一致) ---
read_state() {
  TOTAL_SEC=0
  START_TS=0
  IS_RUNNING="false"
  if [ -f "$STATE_FILE" ]; then
    . "$STATE_FILE"
  fi
}

# --- 辅助函数：时间格式化 (与之前代码一致) ---
format_time() {
  local total_seconds=$1
  local H=$((total_seconds / 3600))
  local M=$(((total_seconds % 3600) / 60))
  local S=$((total_seconds % 60))
  printf "%02d:%02d:%02d" $H $M $S
}

# --- 主程序 ---

read_state

CURRENT_TS=$(date +%s)
TOTAL_DISPLAY_SEC="$TOTAL_SEC"

# 如果计时器正在运行，加上本次会话的时间
if [ "$IS_RUNNING" == "true" ] && [ "$START_TS" -ne 0 ]; then
  SESSION_SEC=$((CURRENT_TS - START_TS))
  TOTAL_DISPLAY_SEC=$((TOTAL_SEC + SESSION_SEC))
fi

# 输出最终的格式化时间给 Waybar
echo "$(format_time "$TOTAL_DISPLAY_SEC")"
