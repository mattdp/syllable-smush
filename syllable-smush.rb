#!/usr/bin/ruby

require 'rubygems'
require 'json/ext'

# return a number of syllables to use, based on probabilities in the JSON
def get_length(probs) #tested, works OK

  counter = 0
  dice = 0

  for p in probs
    dice = 1 + rand(100)
    break if dice > p #entered p's are from 0-100
    counter += 1
  end

  return counter

end

def create_word(length, sylls)

  word = ""

  for l in (0..length)
    word += sylls[rand(sylls.size)]
  end

  return word

end

how_many_words = 30
results = Array[]

json_data = File.open("./assets/initial_rules.json","rb").read
data = JSON.parse(json_data)

probs = data['probabilities']
sylls = data['syllables']

for i in (0..how_many_words)
  results[i] = create_word(get_length(probs),sylls)
end

puts results
