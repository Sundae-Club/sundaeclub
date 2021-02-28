# frozen_string_literal: true

class SitesSetup::UsersController < SitesSetup::BaseController
  before_action :set_site

  def new
  end

  def create
    @user = User.new(user_params)
    @user.organisation = @site.organisation
    if @user.save
      flash[:notice] = "Your user account has been created!"
      sign_in @user
      redirect_to site_path(@site)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_site
    @site = Site.find(params[:site_id])
  end
end
