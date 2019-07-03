module LibraServices
  class CreateAccount < ApplicationService
    def call
      create_libra_account
    end

    private

    def create_libra_account
      # `echo "account create" | docker attach test_libra2`
      # command = "docker container run -i lszmelc/libra << EOF \n account create \n EOF"
      binding.pry
      command = "echo 'account create' | docker attach test_libra2"
      response = system(command)
      wallet_id = response.match(/address \w+/).to_s.split(' ')[1]
      write_command = "docker container run -i lszmelc/libra << EOF \n account write #{wallet_id} \n EOF"
      write = `#{command}`
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
