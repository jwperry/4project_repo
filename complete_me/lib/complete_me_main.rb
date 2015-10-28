require './lib/node'
require './lib/complete_me'
require './lib/trie'
require 'pry'

dictionary = File.read("/usr/share/dict/words")

x = CompleteMe.new


#x.populate(dictionary)


x.insert("a")
x.insert("an")
x.insert("and")
x.insert("andy")

puts x.count

puts x.suggest("a")