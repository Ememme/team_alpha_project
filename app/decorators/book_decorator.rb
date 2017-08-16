# frozen_string_literal: true

class BookDecorator < ApplicationDecorator
  delegate_all

  def cover_dec
    if cover.present?
      cover
    else
      cover = "default_cover.jpg"
    end
  end
end
