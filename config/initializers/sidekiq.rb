# Sidekiq.configure_server do |config|
#     config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}/0"}
# end

# Sidekiq.configure_client do |config|
#     config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}/0"}
# end

Sidekiq.configure_client do |config|
  config.redis = {url: ENV['REDIS_URL']}
end

Sidekiq.configure_server do |config|
  config.redis = {url: ENV['REDIS_URL']}
end
