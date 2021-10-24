from geopy.geocoders import Nominatim
from geopy.point import Point
import json

geolocator = Nominatim(user_agent="geoapiExercises")

f = open('points_data.csv', 'r')

d = {}

'''for line in f:
    splitted = line.strip().split(',')
    name = splitted[2]
    long, lat = float(splitted[-2]), float(splitted[-1])
    state = geolocator.reverse(Point(lat,long)).raw['address'].get('state', '')
    if state not in d:
        d[state] = set()
    d[state].add(name)'''

dict = {'Oklahoma': {'Somatochlora ozarkensis'}, 'Florida': {'Micronaspis floridana', 'Pyractomena ecostata', 'Libellula jesseana', 'Lucidota luteicollis', 'Ophiogomphus australis', 'Phanogomphus hodgesi', 'Stylurus potulentus', 'Phanogomphus westfalli', 'Nehalennia pallidula'}, 'Louisiana': {'Ophiogomphus australis', 'Cordulegaster sarracenia'}, 'Tennessee': {'Photuris walldoxeyi', 'Ophiogomphus acuminatus', 'Phanogomphus sandrius', 'Ophiogomphus edmundo'}, 'Texas': {'Photinus dimissus', 'Cordulegaster sarracenia', 'Leptobasis melinogaster'}, 'Delaware': {'Photuris mysticalampas', 'Photuris cinctipennis'}, 'Arizona': {'Bicellonycha wickershamorum'}, 'California': {'Ischnura gemina'}, 'Mississippi': {'Photuris walldoxeyi', 'Phanogomphus hodgesi', 'Stylurus potulentus', 'Ophiogomphus australis'}, 'New Jersey': {'Pyractomena ecostata'}, 'Arkansas': {'Somatochlora ozarkensis'}, 'Alabama': {'Ophiogomphus australis', 'Phanogomphus hodgesi'}, 'Indiana': {'Photuris walldoxeyi'}, 'Illinois': {'Photuris walldoxeyi'}, 'Georgia': {'Ophiogomphus edmundo'}, 'Sinaloa': {'Leptobasis melinogaster'}, 'Kansas': {'Somatochlora ozarkensis'}, 'South Carolina': {'Ophiogomphus edmundo'}, 'Maryland': {'Photuris cinctipennis'}, 'North Carolina': {'Ophiogomphus edmundo'}}
for key in dict:
    d[key] = list(dict[key])


f.close()

f = open('output.txt', 'w')
f.write(json.dumps(d))
print(d)