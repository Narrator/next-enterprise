#!/bin/bash

# Get the number of CPU cores
NUM_CORES=$(nproc)

# Function to perform CPU-intensive calculations
cpu_stress() {
  echo "Starting task on process $$"
  start_time=$(date +%s.%N)
  echo "scale=5000; a(1)*4" | bc -l > /dev/null
  end_time=$(date +%s.%N)
  duration=$(echo "$end_time - $start_time" | bc)
  echo "Task on process $$ completed in $duration seconds"
}

# Launch a CPU-intensive process for each core
for ((i=0; i<NUM_CORES; i++)); do
  cpu_stress &
done

# Wait for all tasks to complete
wait

# Notify user of completion
echo "All tasks completed."
