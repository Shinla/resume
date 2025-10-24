# =====================================
# Stage 1: Build static website (可选)
# 如果你的项目是纯 HTML/CSS/JS，无需 npm 构建，可直接跳过
# =====================================
FROM nginx:1.29.2 AS production

# 安装常用工具（可调试或网络测试）
RUN apt update && apt install -y curl iputils-ping && rm -rf /var/lib/apt/lists/*

# 复制网站文件到 Nginx Web Root
COPY ./index.html /usr/share/nginx/html/
COPY ./assets /usr/share/nginx/html/assets

# =====================================
# 优化 Nginx 配置（gzip / 缓存 / 安全头）
# =====================================
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露 80 端口（Cloudflare 会代理到这里）
EXPOSE 80

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]
