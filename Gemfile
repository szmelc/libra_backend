source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.3'

gem 'attr_extras', require: 'attr_extras/explicit'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'grape'
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem 'hashie-forbidden_attributes'
gem 'jbuilder', '~> 2.5'
# gem 'pg', '~> 1.1.4'
gem 'pry', '~> 0.12.2'
gem 'puma', '~> 3.11'
gem 'rb-readline'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
