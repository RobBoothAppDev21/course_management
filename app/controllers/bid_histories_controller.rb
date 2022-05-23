class BidHistoriesController < ApplicationController
  def index
    @bid_histories = BidHistory.all
  end
end