# Model2dll
## 主要功能
将模型文件转换为dll文件方便对模型进行加密（加密方法就自己选择吧，太多了），防止自己的劳动成果被窃取

## 使用方法
### 下载仓库
```powershell
git clone https://github.com/zaixia108/model2dll.git
cd model2dll
```
## 转换模型
把你的模型文件放到根目录<br>
并且改名为`model.onnx`（以Yolo的onnx为例，其他模型没尝试过，但是感觉应该差不多）<br>
使用 powershell 运行 convertor.ps1<br>
依据你的模型大小消耗的时间也不一样，时间会比较长，耐心等待<br>
等待运行结束后，model.h文件将生成到本地<br>

## 编译为DLL
确保你的电脑已经安装了cmake
```powershell
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --config Release
```
执行完毕之后<br>
文件将在 `build\model\Release`中 `model.dll`


## 添加了python的自动转换脚本
将要转换的模型文件放到models文件夹后<br>
运行以下命令<br>
```powershell
python trans_model2dll.py
```
等待运行结束后，模型文件将在dlls文件夹