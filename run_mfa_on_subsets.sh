#Prepare the Script: Copy the above script into a text file. Save it with a .sh extension, for #example, run_mfa_on_subsets.sh.
#Make the Script Executable: Open a terminal, navigate to the directory where you saved the #script, and make it executable with the command chmod +x run_mfa_on_subsets.sh.
#Run the Script: Still in the terminal, execute the script by typing ./run_mfa_on_subsets.sh. #Ensure that you have modified the script paths to reflect your directory structure and resource files.

#!/bin/bash


# Define the base directory of your corpus subsets
CORPUS_BASE_DIR="/Users/rosalee/Documents/MFA/PPP3_pilot2/MFA_input_subfolders"

# Base output directory where aligned TextGrids will be stored
OUTPUT_BASE_DIR="/Users/rosalee/Documents/MFA/PPP3_pilot2/MFA_output_subfolders"


# Path to your pronunciation dictionary
DICTIONARY_PATH="/Users/rosalee/Documents/MFA/pretrained_models/dictionary/english_us_arpa.dict"

# Path to the acoustic model you want to use
ACOUSTIC_MODEL_PATH="/Users/rosalee/Documents/MFA/pretrained_models/acoustic/english_us_arpa.zip"


# Loop through each subset directory in the corpus base directory
for SUBSET_DIR in "$CORPUS_BASE_DIR"/*; do
  if [ -d "$SUBSET_DIR" ]; then
    # Extract the name of the subset directory
    SUBSET_NAME=$(basename "$SUBSET_DIR")
    
    # Specify the output directory for this subset
    OUTPUT_DIR="$OUTPUT_BASE_DIR/$SUBSET_NAME"

    # Create the output directory if it doesn't already exist
    mkdir -p "$OUTPUT_DIR"

    # Run Montreal Forced Aligner on the subset
    # mfa align "$SUBSET_DIR" "$DICTIONARY_PATH" "$ACOUSTIC_MODEL_PATH" "$OUTPUT_DIR"
    mfa align -s 4 --use_mp --clean "$SUBSET_DIR" "$DICTIONARY_PATH" "$ACOUSTIC_MODEL_PATH" "$OUTPUT_DIR"
    echo "Finished processing $SUBSET_NAME"
  fi
done

echo "All subsets processed."
