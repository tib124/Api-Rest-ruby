class JsonWebToken
    JWT_SECRET = Rails.application.credentials.secret_key_base

    def self.encode(payload, exp = 12.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, JWT_SECRET)
    end

    def self.decode(token)
      body = JWT.decode(token, JWT_SECRET)[0]
      HashWithIndifferentAccess.new(body)
    end
end
