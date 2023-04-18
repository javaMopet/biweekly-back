# frozen_string_literal: true

module Registrable
  extend ActiveSupport::Concern

  included do
    has_one :registro, as: :registrable, dependent: :destroy, touch: true
  end
end
