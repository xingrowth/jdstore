# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  total            :integer          default(0)
#  billing_name     :string
#  billing_address  :string
#  shipping_name    :string
#  shipping_address :string
#  token            :string
#  is_paid          :boolean          default(FALSE)
#  payment_method   :string
#

class Order < ApplicationRecord
  before_create :generate_token
  belongs_to :user
  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true
  has_many :product_lists

  def generate_token
    self.token = SecureRandom.uuid
  end
end
