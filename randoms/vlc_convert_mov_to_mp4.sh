# Code to convert .mov files to .mp4 files using vlc
#!/bin/bash

# install vlc before process
sudo apt-get update
sudo apt-get install vlc


# Function to convert .MOV files to .mp4
convert_videos() {
    local dir="$1"
    
    # Find all .MOV files in the directory and subdirectories
    find "$dir" -type f -name "*.MOV" | while read -r file; do
        # Create the mp4 directory inside the current file's directory
        file_dir=$(dirname "$file")
        mkdir -p "$file_dir/mp4"
        
        # Get the base name of the file (without extension)
        base_name=$(basename "$file" .MOV)
        
        # Convert .MOV to .mp4 using VLC
        cvlc -I dummy -q "$file" --sout "#transcode{vcodec=h265,acodec=mp4a}:standard{access=file,mux=mp4,dst=$file_dir/mp4/${base_name}.mp4}" vlc://quit
        
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
root_directory="./"  # Replace with your root directory

# Convert videos in the root directory and its subdirectories
convert_videos "$root_directory"
