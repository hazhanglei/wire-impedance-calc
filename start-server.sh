#!/bin/bash
# 启动本地HTTP服务器
# 手机和电脑在同一WiFi下可访问

PORT=8765
DIR="/e/Hermes/00-配置档案总库/默认配置/04-成品导出目录"

echo "=================================="
echo "  线材阻抗计算工具 - 本地服务"
echo "=================================="
echo ""

# 获取本机IP
IP=$(ip addr show 2>/dev/null | grep "inet " | grep -v "127.0.0.1" | awk '{print $2}' | cut -d'/' -f1 | head -1)
IP=${IP:-"127.0.0.1"}

echo "本机IP: $IP"
echo "访问地址: http://$IP:$PORT"
echo ""
echo "手机访问步骤："
echo "  1. 确保手机和电脑在同一WiFi"
echo "  2. 打开手机浏览器"
echo "  3. 输入: http://$IP:$PORT"
echo ""
echo "按 Ctrl+C 停止服务"
echo "=================================="
echo ""

cd "$DIR"
python3 serve_wire_calc.py
