# frozen_string_literal: true

class JoinTablePotinTag < ApplicationRecord
  belongs_to :potin
  belongs_to :tag
end