class Vote < ApplicationRecord
  belongs_to :user, validate: true
  belongs_to :link, validate: true
end
