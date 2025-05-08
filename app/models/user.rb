class User < ApplicationRecord
    # Adiciona a validação de presença para os campos necessários
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true, length: { minimum: 6 }, on: :create

    has_many :posts
    # Isso irá automaticamente adicionar métodos de senha e validações
    has_secure_password

    # Callback para garantir que o email esteja em formato adequado
    before_save :downcase_email

    def as_json(opts = {})
        super(opts.merge(only: [ :id, :first_name, :last_name, :username ]))
    end

    private

    # Método para deixar o email em minúsculo antes de salvar
    def downcase_email
      self.email = email.downcase
    end
end
