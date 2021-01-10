# frozen_string_literal: true

class SitesController < ApplicationController
  before_action :set_site, only: :show

  def create
    @site = Site.new(site_params)
    @organisation = @site.build_organisation(name: 'TestOrg')
    if @site.save
      flash[:notice] = "#{@site.name} has been created."
      redirect_to edit_sites_setup_details_path(@site)
    else
      redirect_to root_path
    end
  end

  def show
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:name)
  end
end
