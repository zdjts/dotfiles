#!/bin/bash

# --- 修正后的配置 ---
STATE_FILE="$HOME/.local/state/waybar_work_time.state" # 保持 XDG 规范
GRACE_PERIOD=3600
ACTION=$1

# --- 辅助函数：状态读写（内容与之前一致） ---
read_state() {
  # ... (与之前代码一致，确保读取 $STATE_FILE) ...
  # 保持一致性，如果文件不存在，则初始化
  TOTAL_SEC=0
  START_TS=0
  IS_RUNNING="false"
  LAST_END_TS=0

  mkdir -p "$(dirname "$STATE_FILE")"
  [ -f "$STATE_FILE" ] && . "$STATE_FILE" || write_state
}

write_state() {
  echo "TOTAL_SEC=$TOTAL_SEC" >"$STATE_FILE"
  echo "START_TS=$START_TS" >>"$STATE_FILE"
  echo "IS_RUNNING=$IS_RUNNING" >>"$STATE_FILE"
  echo "LAST_END_TS=$LAST_END_TS" >>"$STATE_FILE"
}

# --- 主程序逻辑 (内容与之前一致) ---

read_state
CURRENT_TS=$(date +%s)

case "$ACTION" in
"start")
  # ... (开始计时逻辑，代码与之前版本一致) ...
  # (略去具体逻辑，请使用上一轮对话中的完整代码)
  if [ "$IS_RUNNING" == "true" ]; then IS_RUNNING="false"; fi
  if [ "$IS_RUNNING" == "false" ]; then
    TIME_DIFF=$((CURRENT_TS - LAST_END_TS))
    if [ "$TIME_DIFF" -le "$GRACE_PERIOD" ] && [ "$LAST_END_TS" -ne 0 ]; then
      START_TS="$CURRENT_TS"
      IS_RUNNING="true"
    else
      START_TS="$CURRENT_TS"
      IS_RUNNING="true"
    fi
  fi
  write_state
  ;;

"stop")
  # ... (停止计时逻辑，代码与之前版本一致) ...
  # (略去具体逻辑，请使用上一轮对话中的完整代码)
  if [ "$IS_RUNNING" == "true" ]; then
    SESSION_SEC=$((CURRENT_TS - START_TS))
    TOTAL_SEC=$((TOTAL_SEC + SESSION_SEC))
    IS_RUNNING="false"
    LAST_END_TS="$CURRENT_TS"
    write_state
  fi
  ;;

*)
  exit 1
  ;;
esac
