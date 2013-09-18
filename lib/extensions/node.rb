module Berlin
  module AI
    class Node
      attr_accessor :pathfinder, :parent

      def pathfinder
        @pathfinder ||= Berlin::AI::Pathfinder.new(self)
      end

      def reset!
        self.pathfinder = nil

        super
      end
    end
  end
end
