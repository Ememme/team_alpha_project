# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  delegate_all

  def avatar_dec
    if avatar.present?
      avatar
    else
      'default_avatar.png'
    end
  end

  def name_dec
    name = "#{first_name} #{last_name}"
    if first_name.to_s.empty? && last_name.to_s.empty?
      email
    else
      name
    end
  end

  def name_dec
    name = "#{first_name} #{last_name}"
    if first_name.to_s.empty? && last_name.to_s.empty?
      email
    else
      name
    end
  end
end
