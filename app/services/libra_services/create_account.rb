module LibraServices
  class CreateAccount < ApplicationService
    def call
      create_libra_account
    end

    private

    def create_libra_account
      # `echo "account create" | docker attach test_libra2`
      # command = "docker container run -i lszmelc/libra << EOF \n account create \n EOF"
      `echo 'account create' > libra.fifo`
      sleep(1)
      file_data = File.read("output.log").split
      wallet_id = file_data.last
      if update_users_wallet_id
        success(data: wallet_id)
      end
    end

    def update_users_wallet_id
      # UserServices::Update.call
      return true
    end
  end
end
