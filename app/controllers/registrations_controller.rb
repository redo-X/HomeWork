class RegistrationsController < Devise::RegistrationsController
  load_and_authorize_resource :user

  prepend_before_action :authenticate_scope!
  prepend_before_filter :require_no_authentication, only: []

  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    if @user.is_system_admin
      redirect_to users_path, alert: "System-Admin kann nicht geändert werden"
    end
  end

  def create
    @user = User.new(user_params)

    if params[:user][:role_id].presence
      selected_role = Role.find(params[:user][:role_id])

      @user.set_new_role(selected_role)
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: t('helpers.flashes.created', :model => User.model_name.human.titleize) }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|

      selected_role = Role.find(params[:user][:role_id])

      @user.set_new_role(selected_role)

      if user_params[:password].empty?
        if @user.update_without_password(user_params)
          format.html { redirect_to users_path, notice: t('helpers.flashes.updated', :model => User.model_name.human.titleize) }
        else
          format.html { render :edit }
        end
      else
        if user_params[:password] == user_params[:password_confirmation]
          if @user.update(user_params)
            format.html { redirect_to users_path, notice: t('helpers.flashes.updated', :model => User.model_name.human.titleize) }
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
      format.html { redirect_to users_url, notice: t('helpers.flashes.destroyed', :model => User.model_name.human.titleize) }
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
