require 'spec_helper'

describe Administration::PagesController do
  fixtures :pages
  
  describe "GET 'index'" do
    it "returns and array of pages" do
      get :index
      assigns(:pages).should eq(Page.all)
    end

    it "renders :index view" do
      get 'index'
      response.should render_template :index
    end
  end

  describe "GET 'show'" do
    it "assigns the requested page to page" do
      requested_page = pages(:valid_page)
      get 'show', id: requested_page.id
      assigns(:page).should eq(requested_page)
    end

    it "renders :show view" do
      get 'show', id: pages(:valid_page).id
      response.should render_template :show
    end
  end

  describe "GET 'new'" do
    it "instantiates the empty page" do
      get 'new'
      assigns(:page).id.should == Page.new.id
    end

    it "renders :new view" do
      get 'new'
      response.should render_template :new
    end
  end

  describe "GET 'edit'" do
    let (:edit_page) { pages(:valid_page) }

    before(:each) do
      get 'edit', id: edit_page.id
    end

    it "finds and asigns page for editing" do
      assigns(:page).should eq(edit_page)
    end

    it "renders :edit view" do
      response.should render_template :edit
    end
  end

  describe "POST 'create'" do
    context "with valid attributes" do
      let(:page_with_valid_attributes) do
        {
          title: pages(:valid_page).title,
          body: pages(:valid_page).body,
          is_front_page: pages(:valid_page).is_front_page
        }
      end

      it "creates new page" do
        expect{
          post :create, page: page_with_valid_attributes
        }.to change(Page, :count).by(1)
      end

      it "redirects to the new page" do
        post :create, page: page_with_valid_attributes
        response.should redirect_to administration_page_path(Page.last)
      end
    end

    context "with invalid attributes" do
      let(:page_with_invalid_attributes) do
        {
          title: pages(:invalid_page).title,
          body: pages(:invalid_page).body,
          is_front_page: pages(:invalid_page).is_front_page
        }
      end

      it "does not save page without title" do
        expect {
          post :create, page: page_with_invalid_attributes
        }.to_not change(Page, :count)
      end

      it "render new methow again" do
        post :create, page: page_with_invalid_attributes
        response.should render_template :new
      end
    end
  end

  describe "PUT 'update'" do
    context "with valid attributes" do
      let(:page_with_valid_attributes) do
        {
          title: pages(:valid_page).title,
          body: pages(:valid_page).body,
          is_front_page: pages(:valid_page).is_front_page
        }
      end

      it "locates the requested page" do
        put :update, id: pages(:valid_page), page: page_with_valid_attributes
        assigns(:page).should eq(pages(:valid_page))
      end

      it "changes page's attributes" do
        put :update, id: pages(:valid_page), page: { title: "New title", body: "New body", is_front_page: true}
        pages(:valid_page).reload
        pages(:valid_page).title.should eq("New title")
        pages(:valid_page).body.should eq("New body")
        pages(:valid_page).is_front_page.should eq(true)
      end

      it "redirects to updated page" do
        post :update, id: pages(:valid_page), page: page_with_valid_attributes
        response.should redirect_to administration_page_path(pages(:valid_page))
      end
    end

    context "with invalid attributes" do
      let(:page_with_invalid_attributes) do
        {
          title: pages(:invalid_page).title,
          body: pages(:invalid_page).body,
          is_front_page: pages(:invalid_page).is_front_page
        }
      end

      it "locates the requested page" do
        put :update, id: pages(:valid_page), page: page_with_invalid_attributes
        assigns(:page).should eq(pages(:valid_page))
      end

      it "does NOT change page's attributes" do
        put :update, id: pages(:valid_page), page: page_with_invalid_attributes
        pages(:valid_page).reload
        pages(:valid_page).title.should_not eq(page_with_invalid_attributes[:title])
        pages(:valid_page).body.should_not eq(page_with_invalid_attributes[:body])
      end

      it "render update template again" do
        post :update, id: pages(:valid_page), page: page_with_invalid_attributes
        response.should render_template :edit
      end
    end
  end

  describe "DELETE 'destroy'" do
    it "deletes the page" do
      expect {
        delete :destroy, id: pages(:valid_page)
      }.to change(Page, :count).by(-1)
    end

    it "redirects to administration pages" do
      delete :destroy, id: pages(:valid_page)
      response.should redirect_to administration_pages_url
    end
  end

end
