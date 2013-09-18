module Berlin
  module AI
    class Pathfinder  
      def initialize(node)
        @node = node
        @done = []

        compute!([@node])
      end

      def path_to(node, path = [])
        # keep track of the node in the path
        path << node

        # are we there yet?
        if node.parent == @node
          path.reverse
        else
          path_to(node.parent, path)
        end
      end
      
      def next_node_for(node)
        path_to(node).first
      end

      private

      def compute!(nodes, n = 0)
        # keep track of the nodes already visited
        @done.concat(nodes)

        # get a list of adjacent nodes
        next_nodes = nodes.shuffle.map do |node|
          adjacent_nodes = node.adjacent_nodes - @done
          adjacent_nodes.each { |n| n.parent = node }
          adjacent_nodes
        end.flatten.uniq

        # continue till the end
        compute!(next_nodes, n + 1) unless next_nodes.empty?
      end
    end
  end
end
