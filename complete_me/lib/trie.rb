require 'pry'
require_relative "complete_me"
require_relative "node"

class Trie
  attr_accessor :head

  def initialize
    @head = Node.new("")
  end

  def insert(word)
    location = @head
    word.downcase.chomp.each_char do | c |
      if location.branches.has_key?(c)
        location = location.branches[c]
      else
        hash_entry = { c => Node.new(c) }
        location.branches.merge!(hash_entry)
        location = location.branches[c]
      end
    end
    location.mark_as_word
  end

  def populate(words)
    words.each_line do | line |
      insert(line)
    end
  end

  def count(node=@head)
    counter = 0
    node.branches.each do | k , v |
      counter = counter + count(v)
    end
    node.is_word ? counter +=1 : counter
  end

end