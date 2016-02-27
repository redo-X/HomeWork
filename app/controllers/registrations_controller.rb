class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :authenticate_scope!

  prepend_before_filter :require_no_authentication, only: []

  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Benutzer wurde erfolgreich angelegt.' }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|

      if user_params[:password].empty?
        if @user.update_without_password(user_params)
          format.html { redirect_to users_path, notice: 'Benutzer wurde erfolgreich aktualisiert.' }
        else
          format.html { render :edit }
        end
      else
        if user_params[:password] == user_params[:password_confirmation]
          if @user.update(user_params)
            format.html { redirect_to root, notice: 'Benutzer wurde erfolgreich aktualisiert, Sie müssen sich neu anmelden.' }
          else
            format.html { render :edit }
          end
        else
          format.html {
            flash.now[:alert] = 'Die Passwörter stimmen nicht überein.'
            render :edit
          }
        end
      end

    end

  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end

end
