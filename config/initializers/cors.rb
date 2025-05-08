# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins "0.0.0.0:8080"  # Permite requisições de http://0.0.0.0:8080
      resource "*",
        headers: :any,
        methods: [ :get, :post, :options ]
    end
  end
