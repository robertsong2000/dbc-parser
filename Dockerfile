FROM nginx:alpine

# 设置工作目录
WORKDIR /usr/share/nginx/html

# 复制项目文件到Nginx的默认网站目录
COPY . /usr/share/nginx/html/

# 将dbc-parser.html重命名为index.html
RUN mv /usr/share/nginx/html/dbc-parser.html /usr/share/nginx/html/index.html

# 暴露80端口
EXPOSE 80

# 健康检查
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

# 启动Nginx
CMD ["nginx", "-g", "daemon off;"]