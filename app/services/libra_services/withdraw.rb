# frozen_string_literal: true

module LibraServices
  class Withdraw < ApplicationService
    attr_reader_initialize(%i[amount wallet_id])
    def call
      withdraw_libras
    end

    private

    def withdraw_libras
      command = "echo 'transfer #{Account::MAIN_WALLET_ID} #{wallet_id} 100' > libra.fifo"
      `#{command}`      # success(data: balance)
    end
  end
end
