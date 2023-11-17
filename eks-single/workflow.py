import subprocess
import time

def check_stack_status(stack_name, region):
    command = f"aws cloudformation describe-stacks --stack-name {stack_name} --region {region}"
    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    stdout, stderr = process.communicate()
    return stdout.decode()

def main():
    batch_file = 'initialize.bat'
    process = subprocess.Popen(batch_file, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    stdout, stderr = process.communicate()
    print(f"stdout: {stdout.decode()}")
    print(f"stderr: {stderr.decode()}")
    success = process.returncode == 0

    if success:
        stack_name = 'eks-infrastructure'  
        region = 'ap-southeast-2'
        while True:
            stack_status_output = check_stack_status(stack_name, region)
            print(stack_status_output)

            if "CREATE_COMPLETE" in stack_status_output:
                print("\nStack creation completed successfully.")
                break
            elif "CREATE_FAILED" in stack_status_output:
                print("\nStack creation failed.")
                break

            time.sleep(30) 

if __name__ == "__main__":
    main()
