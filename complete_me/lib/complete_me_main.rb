require 'pry'
require_relative 'node'
require_relative 'complete_me'
require_relative 'trie'

dictionary = File.read("/usr/share/dict/words")

x = CompleteMe.new

x.populate(dictionary)

puts x.count

x.select("aard", "aardwolf")
puts x.suggest("aard")