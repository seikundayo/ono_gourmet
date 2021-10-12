source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'pry-byebug'
gem 'pry-doc'
gem 'pry-rails'
# ページネーション
gem 'kaminari'
gem 'redcarpet'
# 検索機能
gem 'coderay'
gem 'ransack'
# ログイン機能
gem 'devise'
gem 'omniauth-twitter'
# 日本語化
gem 'rails-i18n'
gem 'devise-i18n'
# Bootstrap
gem 'devise-bootstrap-views'
# インプレッション数
gem 'impressionist'
# 環境変数管理
gem 'dotenv-rails'
# ActionText
gem 'coffee-rails', '~> 5.0'
gem 'image_processing', '~> 1.9.3'
#　画像投稿
gem 'carrierwave'
gem 'mini_magick'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
