class ExpensesController < ApplicationController
  #create (render form)
  get '/expenses/new' do
    redirect_if_not_logged_in

    erb :'expenses/new'
  end

  #create (save in db)
  post '/expenses' do
    redirect_if_not_logged_in
    expense = current_user.expenses.build(params[:expense])
      if expense.save
        redirect "/expenses/#{expense.id}"
      else
        redirect "/expenses/new"
      end
  end

  #read all
  get '/expenses' do
    redirect_if_not_logged_in

    @expenses = current_user.expenses
    erb :'expenses/index'
  end

  #read one
  get '/expenses/:id' do
    redirect_if_not_logged_in
    redirect_if_not_authorized

    erb :'expenses/show'
  end

  # update (render form)
  get '/expenses/:id/edit' do
    redirect_if_not_logged_in
    redirect_if_not_authorized

    erb :'expenses/edit'
  end

  #update (save in db)
  patch '/expenses/:id' do
    redirect_if_not_logged_in
    redirect_if_not_authorized

    if @expense.update(params["expense"])
      redirect "/expenses/#{@expense.id}"
    else
      redirect "/expenses/#{@expense.id}/edit"
    end
  end

  #delete
  delete '/expenses/:id' do
    redirect_if_not_logged_in
    redirect_if_not_authorized

    @expense.destroy
    redirect "/expenses"
  end

  #methods only to be used in expenses_controller.rb
  private
  def redirect_if_not_authorized
    @expense = Expense.find_by(id: params[:id])
      if @expense.user_id != session[:user_id]
        redirect"/expenses"
      end
  end
end
