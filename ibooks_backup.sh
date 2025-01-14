#! /bin/bash
cd "/Users/rahimhashim/Library/Mobile Documents/iCloud~com~apple~iBooks/Documents/"
echo "Current directory is:"
echo "  $PWD"
# count the number of files in the directory and align the output
num_files=$(ls -1 | wc -l)
printf "%-2s\t%-2s\n" "Number of books found:" $num_files
# count number of folders in the directory that end in .epub
num_dirs=$(find . -type d -name '*.epub' | wc -l)
epubs=$(find . -type d -name '*.epub')
printf "%-2s\t%-2s\n" "  Number of .epubs:" $num_dirs
# count number of .pdf files in the directory
num_pdf=$(ls -1 *.pdf | wc -l)
pdfs=$(ls -1 *.pdf)
printf "%-2s\t%-2s\n" "  Number of .pdfs:" $num_pdf

target_dir="/Users/rahimhashim/Library/CloudStorage/GoogleDrive-rh2898@columbia.edu/.shortcut-targets-by-id/0B-7bnvTD8Ld2NmlOQVBZS3RsSGc/Ot./her/Books"

# iterate through the folders and print the name of each folder
for dir in $epubs; do
    printf "%s\n" "$dir"
    # zip the folder
    zip -r "$dir.zip" "$dir"
    # move the zip file to the target folder using rysnc
    rsync -a "$dir.zip" "$target_dir"
done

# iterate through the files and print the name of each file
for file in *.pdf; do
    printf "%s\n" "$file"
    # copy and paste the file to the target folder using rysnc
    rsync -a "$file" "$target_dir"
done

# ls -l 

#rsync -a "/Users/rahimhashim/Library/Mobile Documents/iCloud~com~apple~iBooks/Documents/" "/Users/rahimhashim/Library/CloudStorage/GoogleDrive-rh2898@columbia.edu/.shortcut-targets-by-id/0B-7bnvTD8Ld2NmlOQVBZS3RsSGc/Other/Books"