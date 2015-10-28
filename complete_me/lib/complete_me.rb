require './lib/node'
require './lib/trie'
require 'pry'

class CompleteMe

  def initialize
    @trie = Trie.new
  end

  def trie
    @trie
  end

  def head
    @trie.head
  end

  def location
    @trie.location
  end

  def insert(word)
    @trie.insert(word.downcase)
  end

  def populate(words)
    @trie.populate(words)
  end

  def count
    @trie.count
  end

  def suggest(input, node=@trie.head)
    suggestions = []
    if node.is_word && input.length == 0
      suggestions << ""
    end
    if input == ""
      string2, char1 = "", ""
    else
      char1 = input.slice!(0)
      string2 = input.slice!(0..-1)#
    end
    if char1 == ""
      node.branches.values.each do | branch_node |
        suggestions << suggest("", branch_node)
      end
    else
      suggestions << suggest(string2, node.branches[char1])
    end
    #suggestions.flatten! temp fix
    suggestions = suggestions.map do | word |
      word = node.data.to_s.concat(word)
    end
      return suggestions
  end

end
