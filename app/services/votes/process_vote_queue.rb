module Services
  module Votes
    class ProcessVoteQueue
      attr_reader :queue

      def initialize 
        @queue = []
      end

      def <<(other)
        queue << other
      end

      def process_queue session_vote_id
        queue.each do |job|
          job.perform_now if job.session_vote_id == session_vote_id
        end
      end
    end
  end
end
