from datetime import datetime
import subprocess

# Bash commands to get convstarts and convends
bash_command_starts = "last | grep \"$(date | awk '{print $1,$2, \" \" $3}')\" | awk '{print $8}' | tail -1"
#bash_command_ends = "last | grep \"$(date | awk '{print $1,$2, \" \" $3}')\" | grep -o -E '\\b[0-2]?[0-9]:[0-5][0-9]\\b' | head -n 1"
bash_command_ends = "date +%H:%M"

# Execute Bash commands to get the values
convstarts = subprocess.getoutput(bash_command_starts)
convends = subprocess.getoutput(bash_command_ends)

# Check if convstarts and convends are not empty
if not convstarts or not convends:
    print("Error: Unable to retrieve valid start and end times.")
else:
    # Convert the times to datetime objects
    convstarts = datetime.strptime(convstarts, "%H:%M")
    convends = datetime.strptime(convends, "%H:%M")

    # Calculate the time difference
    time_difference = convends - convstarts

    # Extract hours and minutes from the time difference
    hours, seconds = divmod(time_difference.total_seconds(), 3600)
    minutes = seconds // 60

    print(f"Uptime {int(hours)}:{int(minutes)}")

