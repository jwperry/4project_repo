gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'pry'
require_relative '../lib/node'
require_relative '../lib/complete_me'
require_relative '../lib/trie'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new("a")
  end

  def test_that_a_new_node_is_not_a_word_by_default
    refute @node.is_word
  end

  def test_that_a_new_node_can_be_marked_as_a_word
    @node.mark_as_word
    assert @node.is_word
  end

  def test_that_a_new_node_has_no_branches_by_default
    assert_equal @node.branches, {}
  end

  def test_that_a_new_node_correctly_inherits_data
    assert_equal "a", @node.data
  end

  def test_that_a_node_is_rank_zero_by_default
    assert_equal 0, @node.rank
  end

end