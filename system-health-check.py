
import os

THRESHOLD = 85

# Disk usage
disk = int(os.popen("df / | awk 'NR==2 {print $5}' | tr -d '%'").read())

# Memory usage
memory = int(float(os.popen("free | awk '/Mem:/ {print $3/$2 * 100}'").read()))

# CPU usage
cpu = int(os.popen("top -bn1 | grep 'Cpu(s)' | awk '{print $2}'").read())

if disk > THRESHOLD:
    print("Disk usage is high:", disk, "%")

if memory > THRESHOLD:
    print("Memory usage is high:", memory, "%")

if cpu > THRESHOLD:
    print("CPU usage is high:", cpu, "%")
