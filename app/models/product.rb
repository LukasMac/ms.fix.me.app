class Product < ActiveRecord::Base
  attr_accessible :description, :meta_description, :meta_keywords, :name, :published_status, :strapline, :subcode, :url_segment, :photo

  has_many :variants

  has_and_belongs_to_many :categories

  has_attached_file :photo,
  									:url  => "/assets/products/:id/:style/:basename.:extension",
                  	:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  acts_as_publishable

  def self.random_best_sellers(number)
  	find(:all, :limit => number, :order => 'RAND()')
  end

  def title_with_price_range
    variant_min_price, variant_max_price = 0, 0

    unless variants.empty?
      variant_min_price = variants.min_by { |variant| variant.price }.price
      variant_max_price = variants.max_by { |variant| variant.price }.price
    end
    
    "#{name} Prices from: #{variant_min_price} to #{variant_max_price}"
  end
end
