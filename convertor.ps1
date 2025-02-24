try {
    rm model.h
    Write-Host "Delete old model.h"
} catch {
    Write-Host "Can't find old model.h"
} finally {
    Write-Host "Start Trans..."
}

#获取当前目录
$pwd = Get-Location

$inputFilePath = Join-Path $pwd "model.onnx"  # 你的模型文件路径
$outputFilePath = Join-Path $pwd "model.h"     # 输出的 C++ 头文件路径

$bytes = [System.IO.File]::ReadAllBytes($inputFilePath)

$byteArray = $bytes | ForEach-Object { "0x{0:X2}," -f $_ }
$byteArray = $byteArray -join "`n"

$headerContent = @"
#pragma once

const unsigned char yolomodel[] = {
$byteArray
};

const size_t yolomodel_size = $($bytes.Length);
"@

[System.IO.File]::WriteAllText($outputFilePath, $headerContent)

Write-Host "Model has been trans to C++ byteArray, saved at $outputFilePath"