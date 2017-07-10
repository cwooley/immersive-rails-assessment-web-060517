class Appearance < ApplicationRecord
  belongs_to :guest
  belongs_to :episode

  validates_uniqueness_of :guest_id, :scope => :episode_id
end
