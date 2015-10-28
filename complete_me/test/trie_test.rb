gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'pry'
require_relative '../complete_me/lib/node'
require_relative '../complete_me/lib/complete_me'
require_relative '../complete_me/lib/trie'

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