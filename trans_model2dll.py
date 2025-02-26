import os
import shutil
import subprocess

def run_cmd(cmd):
    cmd_lsit = cmd.split(' ')
    ret = subprocess.run(cmd_lsit, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    for line in ret.stdout.decode('utf-8').split('\n'):
        print(line)

os.system('mkdir dlls')

dir_path = os.listdir('models')
for item in dir_path:
    print(f'processing {item}')
    name = item.split('.')[0]
    shutil.copy(f'models/{item}', 'model.onnx')
    os.system('powershell .\convertor.ps1')
    run_cmd('mkdir build')
    os.chdir('build')
    run_cmd('cmake -DCMAKE_BUILD_TYPE=Release ..')
    run_cmd('cmake --build . --config Release')
    os.chdir('..')
    shutil.copy('build/model/Release/model.dll', f'dlls/{name}.dll')
    shutil.rmtree('build')
    os.remove('model.onnx')
    print(f'{item} done')

print('all done')
