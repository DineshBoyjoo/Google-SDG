# Google-SDG Project

ABOUT PROJECT:

The goal of this app is to facilitate awareness of every Communicable diseases that is trending in a country by providing relevant data like for example the number of infected people, ect. The app acts as an easy place to find the needed information and updates and it also provides and SOS feature and a tab for advices. For this demo, we used Mauritius as an example and COVID-19 as a main priority and other recently trended diseases such as Malaria and more. The app could be further improved to provide more information such as a map and more.

TO OPEN THIS PROJECT:

git clone the repository to your workspace:
```
git clone https://github.com/D-Roshan/Google-SDG.git
```

Next, open the `dinfosease` folder in android studio.
Sync project with gradle files if necessary.
Choose emulator, then click on run project and project will be opened and run.

ABOUT APP:

Navigate in the app by pressing relevant buttons to explore the functionalities.
![](https://i.imgur.com/hvzsFoC.jpg) 
![](https://i.imgur.com/1sDB7te.jpg)
![](https://i.imgur.com/Ouyyyqe.jpg)

ABOUT BACKEND:

The python script `main.py` mines data from the web then appends the data to a JSON file.
Firebase realtime database was initially used to upload the json data but the database was disabled due to billing problems, so,
a free alternate hosting service was used to host the generated json file from the python script for the app to retrieve and display. Firebase codes have been kept commented for references.

