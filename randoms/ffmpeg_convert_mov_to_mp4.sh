# The script converts .MOV files to .mp4 format using FFmpeg, going through through directories and subdirectories.
# It stores the converted files in an mp4 directory
#!/bin/bash

# Code to install ffmpeg
# sudo apt-get install ffmpeg

# Function to convert .MOV files to .mp4 using ffmpeg
convert_videos() {
  #Assigns the first argument (directory path) to the variable dir
  local dir="$1"
  
  # Find all .MOV files in the directory and subdirectories
  # and pipe the output of find to the while loop which reads each file path into the variable file
  find "$dir" -type f -name "*.MOV" | while read -r file; do
    # Create the mp4 directory inside the current file's directory
    file_dir=$(dirname "$file")
    mkdir -p "$file_dir/mp4_ffmpeg"
    
    # Get the base name of the file (without extension)
    base_name=$(basename "$file" .MOV)
    
    # Convert .MOV to .mp4 using FFmpeg
    # -c:v libx265: Sets the video codec to H.265 (libx265).
    # -crf 18: Sets the Constant Rate Factor (CRF) to 18, which controls the quality. Lower values result in higher quality.
    # -preset medium: Specifies the encoding speed vs. compression efficiency trade-off. medium is a balanced option.
    # -c:a aac: Sets the audio codec to AAC.
    # -b:a 192k: Sets the audio bitrate to 192 kbps.
    ffmpeg -i "$file" -c:v libx265 -crf 18 -preset medium -c:a aac -b:a 192k "$file_dir/mp4_ffmpeg/${base_name}.mp4"
    
    # Check if the conversion was successful
    if [[ $? -ne 0 ]]; then
        echo "Error converting $file"
    else
        echo "Successfully converted $file"
    fi
  done
}

# Function to handle script termination
trap 'echo "Script interrupted."; exit' INT

# Directory to start searching for .MOV files
root_directory="./"

# Call function
convert_videos "$root_directory"
