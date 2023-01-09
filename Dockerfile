### Dockerfile 就是一个编译 Docker 镜像的脚本
### 编写 Dockerfile 时，想象自己在一台干净的基础镜像上，需要哪些：
### 1. 必要的源代码 2. 安装软件依赖的步骤
### 以构建一个可执行的应用镜像？

# 选择 node:lts-slim 作为基础镜像
FROM node:lts-slim

# 创建 app 根目录
WORKDIR /app

# 将 package.json 和 package-lock.json 添加到 app 根目录
ADD package*.json ./

# 安装 app 依赖
RUN npm ci --only=production

# 将 app 源码添加到 app 根目录
ADD index.js ./

# 启动 app
CMD [ "npm", "start" ]