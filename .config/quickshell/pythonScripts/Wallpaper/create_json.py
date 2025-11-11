import json
import get_image

pict_dict = {}

for i in range(len(get_image.pictures)):
    pict_dict[i] = get_image.pictures[i]

with open("pictures.json", "w") as file:
    json.dump(pict_dict, file)
