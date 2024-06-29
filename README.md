# Speech Data Processing Pipeline
A pipeline for pre-processing speech data obtained from psycholinguistic experiments

Main steps:

1. Convert speech data into .wav files
2. Get transcriptions
3. Get timing measures
4. Manually check transcriptions and timing alignments
5. Export and analyze results
  
**The processing pipeline below is also written in: pipeline_manual.pdf**  

## Step 1. Prepare speech data

### 1.1 Retrieve speech data from the server

Open terminal.

Log into server computer:  
**ssh server address**  
e.g., ssh webexperiments@hjpatt-136.umd.edu  

Type in password (nothing will appear when you type):  
(type in server password)

Access the folder that contains your speech data  
**cd path/to/your_folder**  
e.g., cd Sites/Web_Experiments/Phillips/Rosa/uploads

Check that the folder contains your speech data  
**ls**

Go back to the main folder  
**cd ..**

Compress the folder containing speech files to zip:  
**zip -r name_of_zip ~/path/to/folder/containing/recording_files/**  
e.g., zip -r uploads.zip uploads/  
→ compresses ‘uploads’ folder and name the zipped folder ‘uploads.zip’

Check that the zip file is created in the main folder:  
**ls**

Exit the server:  
**exit**

Download the zip file from the server to your local computer (requires server password):  
**scp -r server_address:~/path/to/zip_in_the_server ~/path/to/local_destination_folder**  
(type in server password)  
e.g., scp -r webexperiments@hjpatt-136.umd.edu:Sites/Web_Experiments/Phillips/Rosa/recordings.zip ~/PlanetCloze/data/backup  
→ downloads ‘recordings.zip’ to a local folder ‘backup’

Output of this section: a zip file containing speech files saved locally on your computer

### 1.2 Convert .webm files into .wav files

Unzip all individual speech files using terminal:  
**cd path_to_folder**  
**unzip \*.zip**

Convert the .webm files into .wav files:  
(This step requires having ffmpeg installed. You can install it using Homebrew, following the suggestion here: https://superuser.com/questions/624561/install-ffmpeg-on-os-x)  
**for i in *.webm; do ffmpeg -i "$i" "${i%.*}.wav"; done**

Rename the original folder to “webm_wav”

Make a new folder “wav” and copy-paste only the .wav files into the folder

**Output of Step 1: “wav” folder containing all speech files in .wav format**




## Step 2. Get transcriptions

Download the get_transcriptions.zip file, unzip, and upload it to your Google Drive (under My Drive)

Replace the wav folder with your local wav folder containing all .wav speech files

Open and run get_transcriptions.ipynb using Google Colaboratory

**Output of Step 2: “tg_transc” folder containing textgrid files with transcriptions**




## Step 3. Get timing data

Download the tg_transc folder to your local computer

Run Montreal Forced Aligner: https://montreal-forced-aligner.readthedocs.io/en/latest/

Store results in a folder and name it tg_raw

How to run the Montreal Forced Aligner:

(to be added)

**Output of Step 3: “tg_raw” folder containing textgrid files with transcriptions + timing data**




## Step 4. Manual inspection

Prepare tg_raw and wav folders

Download the Check_and_Edit script from the Github repository

Open Praat

Praat --> Open Praat script --> Check_and_Edit --> Run

Designate paths:  
- tg_path: path to tg_raw folder
- wav_path: path to wav folder 

Check and edit transcriptions and alignments (changes are automatically saved)

Rename tg_raw to tg_checked

Upload tg_checked folder to the get_transcriptions folder in Google Drive

**Output of Step 4: “tg_checked” folder in your “get_transcriptions” folder in Google Drive; containing textgrid files with transcriptions + timing data that have been manually inspected**




## Step 5. Generate results file

Open and run process_results.ipynb using Google Colaboratory

**Output of Step 5: a csv file containing transcriptions + timing measures from all textgrid files**
