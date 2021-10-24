from geopy.geocoders import Nominatim
from geopy.point import Point
import json

geolocator = Nominatim(user_agent="geoapiExercises")

f = open('points_data.csv', 'r')

dic = {}

for line in f:
    splitted = line.strip().split(',')
    name = splitted[2]
    long, lat = float(splitted[-2]), float(splitted[-1])
    state = geolocator.reverse(Point(lat,long)).raw['address'].get('state', '')
    if state not in dic:
        dic[state] = set()
    dic[state].add(name)

print(dic)
f.close()

f = open('output.txt', 'w')
f.write(json.dumps(dic))
print(dic)