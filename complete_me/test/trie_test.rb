gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require './lib/node'
require './lib/complete_me'
require './lib/trie'
require 'pry'

class TrieTest < Minitest::Test

  def test_that_head_node_exists_when_trie_is_created
    trie = Trie.new
    assert trie.head
  end

  def test_that_adding_a_word_creates_a_branch_on_head
    trie = Trie.new
    trie.add("a")
    refute trie.head.branches.empty?
  end


end