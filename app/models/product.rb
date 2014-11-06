class Product < ActiveRecord::Base
  belongs_to :category
  scope :search, ->(term) do
    if term.present?
      where("products.name like :term or description like :term or categories.name like :term", term:"%#{term}%").references(:categories)
    end
  end
  scope :order_column, ->(column, direction){ order("products.#{column}  #{direction}")}
end
