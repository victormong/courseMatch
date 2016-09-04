
#!/usr/bin/env python
# Implementation of collaborative filtering recommendation engine

from sys import argv
from ast import literal_eval
from math import sqrt


def pearson_correlation(person1,person2):

	# To get both rated items
	both_rated = {}
	for item in dataset[person1]:
		if item in dataset[person2]:
			both_rated[item] = 1

	number_of_ratings = len(both_rated)

	# Checking for number of ratings in common
	if number_of_ratings == 0:
		return 0

	# Add up all the preferences of each user
	person1_preferences_sum = sum([dataset[person1][item] for item in both_rated])
	person2_preferences_sum = sum([dataset[person2][item] for item in both_rated])

	# Sum up the squares of preferences of each user
	person1_square_preferences_sum = sum([pow(dataset[person1][item],2) for item in both_rated])
	person2_square_preferences_sum = sum([pow(dataset[person2][item],2) for item in both_rated])

	# Sum up the product value of both preferences for each item
	product_sum_of_both_users = sum([dataset[person1][item] * dataset[person2][item] for item in both_rated])

	# Calculate the pearson score
	numerator_value = product_sum_of_both_users - (person1_preferences_sum*person2_preferences_sum/number_of_ratings)
	denominator_value = sqrt((person1_square_preferences_sum - pow(person1_preferences_sum,2)/number_of_ratings) * (person2_square_preferences_sum -pow(person2_preferences_sum,2)/number_of_ratings))
	if denominator_value == 0:
		return 0
	else:
		r = numerator_value/denominator_value
		return r

def most_similar_users(person,number_of_users):
	# returns the number_of_users (similar persons) for a given specific person.
	scores = [(pearson_correlation(person,other_person),other_person) for other_person in dataset if  other_person != person ]

	# Sort the similar persons so that highest scores person will appear at the first
	scores.sort()
	scores.reverse()
	return scores[0:number_of_users]

def user_recommendations(person):

	# Gets recommendations for a person by using a weighted average of every other user's rankings
	totals = {}
	simSums = {}
	rankings_list =[]
	for other in dataset:
		if other == person:
			continue
		sim = pearson_correlation(person,other)


		if sim <=0:
			continue
		for item in dataset[other]:
			if item not in dataset[person] or dataset[person][item] == 0:

			# Similrity * score
				totals.setdefault(item,0)
				totals[item] += dataset[other][item]* sim
				# sum of similarities
				simSums.setdefault(item,0)
				simSums[item]+= sim



	rankings = [(total/simSums[item],item) for item,total in totals.items()]
	rankings.sort()
	rankings.reverse()
	# returns the recommended items
	recommendations_list = [recommend_item for score,recommend_item in rankings]
	return recommendations_list

def convert_hash_to_dict(ruby_hash):
    dict_str = ruby_hash.replace(":",'"')    # Remove the ruby object key prefix
    dict_str = dict_str.replace("=>",'" : ') # swap the k => v notation, and close any unshut quotes
    dict_str = dict_str.replace('""','"')    # strip back any double quotes to singles
    return json.loads(dict_str)

#command line arguments => ratings dictionary and the user(to whom recommendations have to be generated)
try:
	dict_string = convert_hash_to_dict(argv[1])
	username = argv[2]
except:
	print "Wrong number of arguments"
	quit()
dataset = literal_eval(dict_string)
print "Writing..."
input_file = open('recommendations.txt',"w")
if(len(user_recommendations(username)) == 0):
	print "No recommendations for you :("
for course in user_recommendations(username):
    input_file.write(course + "\n")
input_file.close()
