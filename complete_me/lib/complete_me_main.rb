require 'pry'
require_relative 'node'
require_relative 'complete_me'
require_relative 'trie'

complete_me = CompleteMe.new

dictionary = File.read("/usr/share/dict/words")

complete_me.populate(dictionary)

address_data = complete_me.read_addresses
address_data.slice!(0..13)
complete_me.populate(address_data)

puts complete_me.suggest("1956 lawrence st unit 5")