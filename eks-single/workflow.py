import subprocess
batch_file = 'initialize.bat'
result = subprocess.run(batch_file, shell=False)
print(f"Return Code: {result.returncode}")