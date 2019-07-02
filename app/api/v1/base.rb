module V1
  class Base < API
    version 'v1', using: :path # version api using path

    resources :libra do
      mount Libra::Show
      mount Libra::Withdraw
    end
  end
end
