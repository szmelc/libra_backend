module V1
  module Libra
    class Withdraw < Base
      desc 'Shows wallet or creates one if it does not exist'
      params do
        requires :wallet_id, type: String, desc: "User's wallet ID"
        requires :amount, type: Float, desc: "The amount user wants to withdraw"
      end
      post do
        # return unless container_running?("test_libra2")
        data = declared(params)
        result = LibraServices::Withdraw.call(wallet_id: data[:wallet_id])
      end
    end
  end
end
