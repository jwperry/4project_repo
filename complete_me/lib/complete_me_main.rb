require './lib/node'
require './lib/complete_me'
require './lib/trie'
require 'pry'

dictionary = File.read("/usr/share/dict/words")

x = CompleteMe.new


x.populate(dictionary)

puts x.count

puts x.suggest("aard")