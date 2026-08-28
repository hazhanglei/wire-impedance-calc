# -*- coding: utf-8 -*-
"""
线材阻抗计算工具 - HTTP服务启动器
双击运行后，浏览器自动打开，手机/电脑同一WiFi下通过 http://<本机IP>:8765 访问
"""
import http.server
import socketserver
import os
import threading
import sys
import webbrowser
import socket
from pathlib import Path

PORT = 8765
PAGE_DIR = Path(r"E:\Hermes\00-配置档案总库\默认配置\04-成品导出目录")
INDEX_FILE = PAGE_DIR / "WireImpedanceCalc.html"


def get_local_ip():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
        s.close()
        return ip
    except Exception:
        return "127.0.0.1"


class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(PAGE_DIR), **kwargs)

    def end_headers(self):
        self.send_header("Cache-Control", "no-cache")
        super().end_headers()

    def log_message(self, format, *args):
        # 静默日志，避免刷屏
        pass


def print_banner(ip):
    url = f"http://{ip}:{PORT}"
    print("=" * 50)
    print("  线材阻抗计算工具 - 服务已启动")
    print("=" * 50)
    print(f"  本机访问:  {url}")
    print(f"  局域网访问: {url}")
    print("  手机/平板访问同一WiFi下的该地址即可使用")
    print("  按 Ctrl+C 停止服务")
    print("=" * 50)
    print()


def main():
    if not INDEX_FILE.exists():
        print(f"错误：找不到页面文件 {INDEX_FILE}")
        sys.exit(1)

    ip = get_local_ip()
    print_banner(ip)
    webbrowser.open(f"http://{ip}:{PORT}")

    with socketserver.TCPServer(("", PORT), Handler) as httpd:
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n服务已停止")


if __name__ == "__main__":
    main()
