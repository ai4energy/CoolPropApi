# CoolPropApi CoolProp微服务


使用Oxygen.jl把CoolProp.jl封装成一个web服务。


## 创建镜像

根据 `Dockerfile` 来建立 Docker 镜像并打上 tag，你可以使用 `docker build` 命令。

1. 首先，确保你的工作目录下有 `Dockerfile`。这个文件定义了如何构建 Docker 镜像。

2. 打开终端或命令行，并进入包含 `Dockerfile` 的目录。

3. 使用下面的命令来构建 Docker 镜像：

   ```bash
   docker build -t [你的镜像名字]:[你的tag] .
   ```

   例如，如果你想给你的镜像命名为 `coolpropapi` 并使用 `1.0` 作为 tag，那么你可以使用以下命令：

   ```bash
   docker build -t coolpropapi:1.0 .
   ```

   这里的 `.` 指的是当前目录，意味着 Docker 会在当前目录中查找 `Dockerfile`。

4. 构建完成后，你可以使用下面的命令来查看新构建的镜像：

   ```bash
   docker images
   ```

   在显示的列表中，你应该可以看到你刚刚创建的镜像 `mediacoolprop` 以及对应的 tag `v1.0`。

## 启动服务

使用如下的`docker-compose.yml`文件启动服务

```yaml
version: "3.2"

services: 

  coolpropapi:
    image: coolpropapi:1.0
    container_name: coolpropapi
    build:
      context: .
    command: julia --project="/opt/coolpropapi" apiserver.jl
    ports:
      - "8081:8081"
```
然后在浏览器中输入`http://localhost:8081/water`访问，就可以看到测试函数的结果了。