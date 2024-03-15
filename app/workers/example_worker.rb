class ExampleWorker 
  include Sidekiq::Worker 

  def perform 
    puts 'I am performing'
  end
end