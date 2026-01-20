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

# 👋 云服务器部署（CentOS 7）
## Docker 环境安装（若没有）
删除旧 docker 
- sudo yum remove -y docker docker-common docker-selinux docker-engine
```bash
sudo yum install -y docker
sudo systemctl enable docker
sudo systemctl start docker
```

安装官方 Docker CE 仓库
```bash
sudo yum install -y yum-utils
sudo yum-config-manager \
  --add-repo \
  https://download.docker.com/linux/centos/docker-ce.repo
```
若无法使用，使用阿里的镜像：

清理可能残留的 docker repo（安全）
```bash
sudo rm -f /etc/yum.repos.d/docker-ce.repo
```
配置阿里云 Docker CE 镜像源
```bash
sudo yum-config-manager \
  --add-repo \
  https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
```

更新 yum 缓存
```bash
sudo yum makecache fast
```

安装 Docker CE + Compose 插件
```bash
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

启动并设置开机自启
```bash
docker version
docker compose version
```
## RabbitMQ 部署

安装 git（如果没有）
```bash
git clone https://github.com/cyb911/rabbitmq-deploy.git
```