gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require './lib/node'
require './lib/complete_me'
require './lib/trie'
require 'pry'

class CompleteMeTest < Minitest::Test

  def test_that_declaring_CompleteMe_creates_new_trie
    complete = CompleteMe.new
    assert complete.trie
  end


end