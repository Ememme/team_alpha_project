# frozen_string_literal: true
class UserDecorator < ApplicationDecorator
  delegate_all

  def avatar_dec
    if avatar.present?
      avatar
    else
      avatar = "default_avatar.png"
    end
  end
end
