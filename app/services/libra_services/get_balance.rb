# frozen_string_literal: true

module LibraServices
  class GetBalance < ApplicationService
    attr_reader_initialize(%i[wallet_id])
    def call
      get_balance
    end

    private

    def get_balance
      return false if wallet_id.empty?

      binding.pry
      command = "docker container run -i lszmelc/libra << EOF \n query balance #{wallet_id} \n EOF"
      response = `#{command}`
      balance_string = response.match(/Balance is: \d+\.\d+/).to_s
      balance = balance_string.match(/\d+\.\d+/).to_s.to_f
      puts "Balance is #{balance}"
      success(data: balance)
    end
  end
end
