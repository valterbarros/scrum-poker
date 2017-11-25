module Services
  module Votes
    class ProcessVoteQueue
      include Singleton

      attr_reader :queue

      def initialize 
        @queue = []
      end

      def <<(other)
        remove_already_voted(other)
        #process_queue(other)
        require 'pry'; binding.pry
        queue << other
      end

      def process_queue vote_job
        session_vote_id = vote_job.session_vote_id
        users_count = SessionVote.find(session_vote_id).users.count
        expected_votes = users_count * SessionVote.find(session_vote_id).steps.count
        votes_count = queue.count{|e| e.session_vote_id == session_vote_id }
        require 'pry'; binding.pry
        return if users_count > expected_votes
        queue.each do |job|
          job.perform_now if job.session_vote_id == session_vote_id
        end
      end

      def remove_already_voted other
        unique_vote_token = generate_unique_vote_token(other)
        other_step_id = other.step_id
        queue.delete_if do |job| 
          require 'pry'; binding.pry
          valid_unique_vote(other, job)
        end
      end

      private 
      def valid_unique_vote first, other
        first_token = generate_unique_vote_token(first)
        other_token = generate_unique_vote_token(other)
        first_token == other_token
      end

      def generate_unique_vote_token job
        "1478c57f-#{job.user_id}399-4080-bf0c-#{job.step_id}b01e39bb883"
      end
    end
  end
end
