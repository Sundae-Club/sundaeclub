# frozen_string_literal: true

class SitesSetup::BaseController < ApplicationController
  before_action :set_site

  private

  def set_site
    @site = Site.find(params[:site_id])
  end
end
