module Squall
  # OnApp Transaction
  class Transaction < Base
    # Public: Lists all transactions.
    #
    # number - number of transactions returned
    #
    # Returns an Array.
    def list(number = 10)
      response = request :get, "/transactions.json/per_page/#{number}"
      response.collect { |t| t['transaction'] }
    end

    # Public: Get info for the given transaction.
    #
    # id - ID of transaction
    #
    # Returns a Hash.
    def show(id)
      response = request :get, "/transactions/#{id}.json"
      response['transaction']
    end
  end
end
