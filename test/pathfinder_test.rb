require_relative '../lib/pathfinder/pathfinder'
require_relative '../lib/extensions/node'

require "berlin-ai"
require "minitest/autorun"
 
class PathfinderTest < Minitest::Test

  def setup
    @node1 = Berlin::AI::Node.new(:id => 1)
    @node2 = Berlin::AI::Node.new(:id => 2)
    @node3 = Berlin::AI::Node.new(:id => 3)
    @node4 = Berlin::AI::Node.new(:id => 4)
    @node5 = Berlin::AI::Node.new(:id => 5)

    @node1.link_to(@node2)
    @node2.link_to(@node3)
    @node3.link_to(@node4)
    @node4.link_to(@node5)

    @nodes = [@node1, @node2, @node3, @node4, @node5]
  end

  def test_calling_pathfinder_on_a_node_returns_an_instance_of_pathfinder
    assert_instance_of Berlin::AI::Pathfinder, @node1.pathfinder
  end

  def test_resetting_the_node_does_reset_the_pathfinder
    assert_nil @node1.instance_variable_get(:@pathfinder)
    @node1.pathfinder
    assert @node1.instance_variable_get(:@pathfinder)
    @node1.reset!
    assert_nil @node1.instance_variable_get(:@pathfinder)
  end

  def test_path_to_the_shortest_path_between_two_nodes
    assert_equal [@node2, @node3, @node4, @node5], @node1.pathfinder.path_to(@node5)
  end

  def test_next_node_for_returns_the_next_node_on_the_way_to_destination
    assert_equal @node2, @node1.pathfinder.next_node_for(@node5)
  end


end