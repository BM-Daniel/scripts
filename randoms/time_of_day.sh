# Script to group images into time of day based on time creation
# Since the videos were recorded on phone and copied to PC, it will be best to access the modification_time instead of the creation_time. Creation time may change during copy
# Morning (8am- 11am) 
# Afternoon (12pm - 3pm) 
# Evening( 4pm- 6pm) 
# Night (7pm -11pm)

#!/bin/bash

# Install packages needed; jq and ffprobe from ffmpeg
# sudo apt-get update
# sudo apt-get install ffmpeg jq


#!/bin/bash

# Create directories for morning, afternoon, evening, and night
mkdir -p morning
mkdir -p afternoon
mkdir -p evening
mkdir -p night

# Function to extract the modification time from video file metadata
get_timestamp() {
  local file="$1"
  # Using ffprobe to get the modification time from video metadata
  timestamp=$(ffprobe -v quiet -print_format json -show_format "$file" | jq -r '.format.tags.creation_time')
  echo "$timestamp"
}

# Loop through all video files in the current directory
for file in *.MOV; do
  if [[ -f "$file" ]]; then
    # Get the timestamp from the file
    timestamp=$(get_timestamp "$file")
    
    # Extract the hour from the timestamp
    hour=$(date -d "$timestamp" +%H)
    
    # Determine the time period and move the file
    if [ "$hour" -ge 7 ] && [ "$hour" -lt 12 ]; then
      mv "$file" morning/
    elif [ "$hour" -ge 12 ] && [ "$hour" -lt 16 ]; then
      mv "$file" afternoon/
    elif [ "$hour" -ge 16 ] && [ "$hour" -lt 19 ]; then
      mv "$file" evening/
    else
      mv "$file" night/
    fi
  fi
done
