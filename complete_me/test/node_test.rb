gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require './lib/node'
require './lib/complete_me'
require './lib/trie'
require 'pry'

class NodeTest < Minitest::Test

  def test_that_a_new_node_is_not_a_word_by_default
    node = Node.new("a")
    refute node.is_word
  end

  def test_that_a_new_node_can_be_marked_as_a_word
    node = Node.new("a")
    node.mark_as_word
    assert node.is_word
  end

  def test_that_a_new_node_has_no_branches_by_default
    node = Node.new("a")
    assert_equal node.branches, {}
  end

  def test_that_a_new_node_correctly_inherits_data
    node = Node.new("a")
    assert_equal "a", node.data
  end

end