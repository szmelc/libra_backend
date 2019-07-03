module V1
  module Libra
    class Show < Base
      desc 'Shows wallet or creates one if it does not exist'
      params do
        requires :wallet_id, type: String, desc: "User's wallet ID"
      end
      get do
        # return unless container_running?("test_libra2")
        data = declared(params)
        if data[:wallet_id].present?
          result = LibraServices::GetBalance.call(wallet_id: data[:wallet_id])
          { balance: result.data }
        else
          result = LibraServices::CreateAccount.call
          { wallet_id: result.data }
        end
      end
    end
  end
end
