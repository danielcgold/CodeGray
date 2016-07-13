# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  url               :string(255)
#  description       :text(65535)
#  image_uid         :string(255)
#  published         :boolean          default(FALSE)
#  featured          :boolean          default(FALSE)
#  featured_position :integer
#  company_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Project < ActiveRecord::Base
  include Publishable

  belongs_to :company
  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true
  validates :image_uid, presence: true
  validates_inclusion_of :published, :in => [true, false]

  dragonfly_accessor :"image"

  def self.published
    where(published: true)
  end

end
