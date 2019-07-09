class API < Grape::API
  default_format :json
  helpers DockerHelpers
  prefix 'api'

  mount V1::Base
  add_swagger_documentation \
  mount_path: '/docs'
end
