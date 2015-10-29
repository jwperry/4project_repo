require 'pry'
require_relative "node"
require_relative "trie"

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
    format_suggestions(suggestions)
  end

  def format_suggestions(suggestions)
    sorted_suggestions = []
    suggestions.each do | word |
      sorted_suggestions << [get_rank(word), word]
    end
    sorted_suggestions.sort!.flatten!
    sorted_suggestions = sorted_suggestions.select { | n | n.class == String }
  end

  def get_rank(word)
    node = nav_to_word(word)
    node.rank
  end


  def select(input, word)
    node = nav_to_word(word)
    node.rank -= 1
  end

  def nav_to_word(word)
    nav_location = head
    word.downcase.chomp.each_char do | c |
      if nav_location.branches.has_key?(c)
        nav_location = nav_location.branches[c]
      else
        puts "Selected word is not in the dictionary!"
        return nil
      end
    end
    nav_location
  end

  def get_suggestions(input, node)
    suggestions = []
    if node.is_word && input.empty?
      suggestions << ""
    end
    first_char, input_remainder = slice_if_not_empty(input)
    if first_char.empty?
      node.branches.values.each do | branch_node |
        suggestions << get_suggestions("", branch_node)
      end
    else
      suggestions << get_suggestions(input_remainder, node.branches[first_char])
    end
    update_suggestions(suggestions, node)
  end

  def update_suggestions(suggestions, node)
    suggestions.flatten!
    suggestions.map! do | word |
      word.prepend(node.data)
    end
    suggestions
  end

  def slice_if_not_empty(input)
    if input.empty?
      first_char, input_remainder = "", ""
    else
      first_char = input.slice!(0)
      input_remainder = input
    end
    return first_char, input_remainder
  end

  def read_addresses
    addresses = ""
    address_file = ARGV[0]
    File.readlines(address_file).each do | line |
      addresses << line.split(",").last
    end
    addresses
  end
  
end