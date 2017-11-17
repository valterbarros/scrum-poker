class RoomsController < ApplicationController
  def index
    @session_votes = SessionVote.all
  end
end
