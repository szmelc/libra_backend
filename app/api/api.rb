class API < Grape::API
  default_format :json
  helpers DockerHelpers
  prefix 'api' # use prefix in api path

  mount V1::Base # mount version 1
end
