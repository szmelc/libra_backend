module V1
  module Libra
    class Withdraw < Base
      desc ""
      params do
        requires :wallet_id, type: String, desc: "ID of a wallet Libras will be withdrawn to"
        requires :amount, type: Float, desc: "The amount user wants to withdraw"
      end
      post do
        data = declared(params)
        result = LibraServices::Withdraw.call(wallet_id: data[:wallet_id])
      end
    end
  end
end
