require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe "GET #index" do
  	it "renders index" do
  		get :index
  		expect(response).to render_template(:index)
  	end

  	it "returns all tasks" do
  		user = create(:user)
  		get :index
  		expect(assigns(:tasks)).not_to be_nil
  	end
  end
  
    describe "GET #new" do
  	it "renders new template" do
  		get :new
  		expect(response).to render_template(:new)
  	end

  	it "returns all tasks" do
  		get :new
  		expect(assigns(:task)).to be_a_new(Task)
  	end
  end

  describe "GET #show" do
  	it "renders show template" do
  		task = create(:vote)
  		get :show, params: {id: task.to_param}
  		expect(response).to render_template(:show)
  	end

  	it "shows one task" do
  		task = create(:vote)
  		get :show, params: {id: task.to_param}
  		expect(assigns(:task)).to eq(task)
  	end
  end

describe "POST #create" do
	let(:user) {create(:user)}
  	let(:valid_attributes) {attributes_for(:vote, user_id: user.id)}
  	let(:invalid_attributes) { attributes_for(:invalid_task, user_id: user.id) }

	context "valid attributes" do
	  	it "creates a new task with valid inputs" do
	  		expect{
	  			post :create, params: {task: valid_attributes}
	  		}.to change(Task, :count).by(1)
  		end

		it "redirects to show page" do
			post :create, params: {task: valid_attributes}
			expect(response).to redirect_to(assigns(:task))
  		end
	end

	context "invalid attributes"  do
  	  	it "does not create a new task with invalid inputs" do
          expect{
          post :create, params: {task: invalid_attributes}
        }.to change(Task, :count).by(0)
  		end

  	  	it "remainds on same page (new page)" do
          post :create, params: {task: invalid_attributes}
          expect(response).to render_template(:new)
  		end
  	end
end


end
