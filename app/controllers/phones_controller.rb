class PhonesController < ApplicationController
  before_action :set_user
  before_action :set_phone, only: [:edit, :update, :destroy]

  def index
    @phones = @user.phones
  end

  def new
    @phone = @user.phones.new
  end

  def create
    @phone = @user.phones.new(phone_params)
    return redirect_to user_phones_path(@user), notice: 'Telefone adicionado com sucesso!' if @phone.save

    render :new, status: :unprocessable_entity
  end

  def edit; end

  def update
    return redirect_to user_phones_path(@user), notice: 'Telefone atualizado com sucesso!' if @phone.update(phone_params)

    render :edit, status: :unprocessable_entity
  end

  def destroy
    @phone.destroy
    redirect_to user_phones_path(@user), notice: 'Telefone removido com sucesso!'
  end

  private

  def set_user
    @user = User.find(params[:user_id]) || (redirect_to root_path, alert: 'Usuário não encontrado')
  end

  def set_phone
    @phone = @user.phones.find(params[:id]) || (redirect_to user_phones_path(@user), alert: 'Telefone não encontrado')
  end

  def phone_params
    params.require(:phone).permit(:number, :phone_type)
  end
end
