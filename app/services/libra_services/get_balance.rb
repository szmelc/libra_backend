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

      command = "echo 'query balance #{wallet_id}' > libra.fifo"
      system(command)
      sleep(0.5)
      file_data = File.read("output.log").split
      balance = file_data.last.to_f
      success(data: balance)
    end
  end
end
