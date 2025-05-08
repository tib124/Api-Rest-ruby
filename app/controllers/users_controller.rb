class UsersController < ApplicationController
  skip_before_action :authenticate # Permite criar usuários sem autenticaçã
  def create
    @user = User.new(user_params)  # Cria a instância sem salvar no banco de dados ainda

    if @user.save  # Agora tenta salvar e verifica se foi bem-sucedido
      render json: @user.as_json
    else
      render json: { message: "User was not created", errors: @user.errors.full_messages }
    end
  end

  def index
    render json: { users: User.all.map(&:as_json) }
  end
  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :username)
  end
end
