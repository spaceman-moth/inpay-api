source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.5"

gem "rails", "~> 7.0.3"
gem "pg"
gem "puma", "~> 5.0"
gem "redis", "~> 4.0"
gem "bootsnap", require: false
gem "httparty"
gem "lograge"
gem "active_model_serializers"
gem "sidekiq"

group :development, :test do
  gem "pry"
  gem "rspec-rails"
end

group :test do
  gem "factory_bot_rails"
end
