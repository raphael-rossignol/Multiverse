import subprocess
subprocess.run(["git", "pull"], check=True, stdout=subprocess.PIPE).stdout
while True:
    time.sleep(300)