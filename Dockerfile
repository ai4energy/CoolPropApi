FROM julia:1.9.2

# Install Julia packages

ENV JULIA_NUM_THREADS=2

WORKDIR /opt/coolpropapi/

COPY . .

RUN julia --project="." -e 'ENV["JULIA_PKG_SERVER"] = "https://mirrors.pku.edu.cn/julia"; import Pkg; Pkg.instantiate();'

RUN julia --project="." precompile.jl

EXPOSE 8081

CMD ["bash"]