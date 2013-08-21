require 'spec_helper'

describe Administration::ProductsController do
	describe 'GET #index' do
		before(:each) do			
			ActsAsPublishable::STATUS_NAMES.each_with_index do |item, index|
				Product.create(name: 'item', published_status: index) unless item.empty?
			end
		end

		it "should return all products when no filter applied" do			
			get :index

			assigns(:products).should eq(Product.all)
		end

		it "should return all published products" do
			get :index, published_status: ActsAsPublishable::PUBLISHED

			assigns(:products).count.should eq(Product.where(published_status: ActsAsPublishable::PUBLISHED).count)
		end

		it "should return all drafted products" do
			get :index, published_status: ActsAsPublishable::DRAFT

			assigns(:products).count.should eq(Product.where(published_status: ActsAsPublishable::DRAFT).count)
		end

		it "should return all submited products" do
			get :index, published_status: ActsAsPublishable::SUBMITTED

			assigns(:products).count.should eq(Product.where(published_status: ActsAsPublishable::SUBMITTED).count)
		end

		it "should return all published products" do
			get :index, published_status: ActsAsPublishable::PUBLISHED

			assigns(:products).count.should eq(Product.where(published_status: ActsAsPublishable::PUBLISHED).count)
		end

		it "should return all archived products" do
			get :index, published_status: ActsAsPublishable::ARCHIVED

			assigns(:products).count.should eq(Product.where(published_status: ActsAsPublishable::ARCHIVED).count)
		end

		it "should return all removed products" do
			get :index, published_status: ActsAsPublishable::REMOVED

			assigns(:products).count.should eq(Product.where(published_status: ActsAsPublishable::REMOVED).count)
		end
	end
end