# 定义输入和输出文件路径
$inputFilePath = "E:\SynologyDrive\code\yolo\model\atkfp16.onnx"  # 你的模型文件路径
$outputFilePath = "E:\SynologyDrive\code\yolo\model\model.h"     # 输出的 C++ 头文件路径

# 读取文件内容为字节数组
$bytes = [System.IO.File]::ReadAllBytes($inputFilePath)

# 生成 C++ 字节数组代码
$byteArray = $bytes | ForEach-Object { "0x{0:X2}," -f $_ }
$byteArray = $byteArray -join "`n"

# 生成最终的头文件内容
$headerContent = @"
#pragma once

const unsigned char yolomodel[] = {
$byteArray
};

const size_t yolomodel_size = $($bytes.Length);
"@

# 将内容写入头文件
[System.IO.File]::WriteAllText($outputFilePath, $headerContent)

Write-Host "模型文件已转换为 C++ 字节数组，并保存到 $outputFilePath"