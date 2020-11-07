# frozen_string_literal: true

class SitesController < ApplicationController
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

  private

  def site_params
    params.require(:site).permit(:name)
  end
end
