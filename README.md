# 👋 Windows WSL2 部署

## 安装 docker
[下载](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module&_gl=1*11n59s3*_gcl_au*NjUyNTEwNTg3LjE3Njg4NzgzMjg.*_ga*MTc3NTM5MzAwMS4xNzY4ODc4MzI5*_ga_XJWPQMJYHQ*czE3Njg4NzgzMjgkbzEkZzEkdDE3Njg4NzgzNTEkajM3JGwwJGgw)

安装验证命令：
- docker version
- docker compose version

启动
- 启动wsl wsl
- 文件授权：chmod +x scripts/*.sh
- 启动：docker compose --env-file .env.local up -d

关闭
- docker compose --env-file .env.local up -d

重新初始化
- docker compose --env-file .env.local down -v

# 👋 云服务器部署