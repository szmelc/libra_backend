# frozen_string_literal: true

module LibraServices
  class Withdraw < ApplicationService
    attr_reader_initialize(%i[amount wallet_id])
    def call
      withdraw_libras
    end

    private

    def withdraw_libras
      command = "docker container run -i lszmelc/libra << EOF \n transfer #{Account::MAIN_WALLET_ID} #{wallet_id} 100 \n EOF"
      response = `#{command}`
      binding.pry
      # balance_string = response.match(/Balance is: \d+\.\d+/).to_s
      # balance = balance_string.match(/\d+\.\d+/).to_s.to_f
      # success(data: balance)
    end
  end
end
