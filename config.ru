require "sidekiq"
require "sidekiq/web"

require './app'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  password == ENV["SIDEKIQ_PASSWORD"]
end

run Rack::URLMap.new(
  '/' => Sinatra::Application,
  '/sidekiq' => Sidekiq::Web
)
