# frozen_string_literal: true

class YoutubeWebhookVerificationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    if params['hub.challenge']
      render(plain: params['hub.challenge'])
    end

    video_id = Hash.from_xml(request.body.read).dig('feed', 'entry', 'videoId')
  end
end
