from bs4 import BeautifulSoup
import requests
import json
from firebase import firebase
import pypopulation as p
import os


#mines data from website
url = "https://www.worldometers.info/coronavirus/country/mauritius"
req = requests.get(url)
bsObj = BeautifulSoup(req.text, "html.parser")
data = bsObj.find_all("div",class_ = "maincounter-number")
    
totalcases = int(data[0].text.strip().replace(',',''))
deaths = int(data[1].text.strip().replace(',',''))
recovered = int(data[2].text.strip().replace(',',''))
current_active = totalcases - recovered

population = (p.get_population_a2("MU"))

#dictionary for json
dataformat = {
   "d1":{
      "name":"COVID-19",
      "Total Cases":totalcases,
      "Deaths":deaths,
      "Recovered":recovered,
      "Current-Active":current_active,
      "symptome":"headache, loss of smell and taste",
      "Population":population,
      "ico":"https://www.foundationhealth.org/.api2/binaries/0PhOWfdecz/thumbnails/Icon-germ-04.png?width=300"
   },
   "d2":{
      "name1":"Malaria",
      "tcases1":18,
      "death1":0,
      "rec1":3,
      "actcases1":15,
      "sympt1":"shaking chills, headache, muscle aches, tiredness",
      "ico1":"https://thumbs.dreamstime.com/b/malaria-mosquito-icon-vector-outline-illustration-malaria-mosquito-icon-vector-outline-malaria-mosquito-sign-isolated-contour-168860447.jpg"
   },
   "d3":{
      "name2":"Tuberculosis",
      "tcases2":18,
      "death2":0,
      "rec2":3,
      "actcases2":5,
      "sympt2":"Fever, Night sweats, Loss of appetite, unintentional weight loss",
      "ico2":"https://image.flaticon.com/icons/png/512/773/773895.png"
   },
   "d4":{
      "name3":" ",
      "tcases3":0,
      "death3":0,
      "rec3":0,
      "actcases3":0,
      "sympt3":"0",
      "ico3":"https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Solid_white.svg/768px-Solid_white.svg.png"
   }
}


#create temp json file to act as a data source
with open('dataex.json', 'a') as outfile:
    outfile.write(json.dumps(dataformat))
    outfile.close()


#connection
firebase = firebase.FirebaseApplication("https://covdata.firebaseio.com/", None)

with open("dataex.json", "r") as f:
	data = json.load(f)

#update each variable in the database
action0 = firebase.put('/-MXAV-gyzLTaTAz9yzXG', 'Population', population)
action1 = firebase.put('/-MXAV-gyzLTaTAz9yzXG', 'Current-Active', current_active)
action2 = firebase.put('/-MXAV-gyzLTaTAz9yzXG', 'Deaths', deaths)
action3 = firebase.put('/-MXAV-gyzLTaTAz9yzXG', 'Recovered', recovered)
action4 = firebase.put('/-MXAV-gyzLTaTAz9yzXG', 'Total Cases', totalcases)

#for debugging
action = firebase.post('/', data)

#print(action0, action1, action2, action3, action4)
print(action)


#remove temp json file
os.remove("dataex.json")
