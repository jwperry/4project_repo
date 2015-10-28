require 'pry'
require_relative "node"
require_relative "trie"

class CompleteMe

  def initialize
    @trie = Trie.new
    @nav_location
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

  def suggest(input)
    suggestions = get_suggestions(input, @trie.head)
    sorted_suggestions = []
    suggestions.each do | word |
      sorted_suggestions << [get_rank(word), word]
    end
    sorted_suggestions.sort!.flatten!
    sorted_suggestions = sorted_suggestions.select { | n | n.class == String }
    return sorted_suggestions
  end

  def get_suggestions(input, node)
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
        suggestions << get_suggestions("", branch_node)
      end
    else
      suggestions << get_suggestions(string2, node.branches[char1])
    end
    suggestions.flatten!
    suggestions.map! do | word |
      word.prepend(node.data)
    end
      return suggestions
  end

  def get_rank(word)
    @nav_location = head
    word.each_char do | c |
      @nav_location = @nav_location.branches[c]
    end
    return @nav_location.rank
  end


  def select(input, word)
    @nav_location = head
    word.downcase.chomp.each_char do | c |
      if @nav_location.branches.has_key?(c)
        @nav_location = @nav_location.branches[c]
      else
        puts "Selected word is not in the dictionary!"
        return nil
      end
    end
    @nav_location.rank -= 1
  end
end