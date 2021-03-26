require 'pry'
class ExpensesController < ApplicationController
  #create (render form)
  get '/expenses/new' do
    erb :'expenses/new'
  end
  #create (save in db)
  post '/expenses' do
    binding.pry
    @expense = Expense.create(params["expense"])
    redirect "expenses/#{@expense.id}"
  end
  #create (save in db)
  # post '/expenses' do
  #   expense = Expense.new (params["expense"])
  #   if expense.save
  #     redirect '/expenses/#{expense.id}'
  #   else
  #     redirect '/expenses/new'
  #   end
  # end
  #read all
  get '/expenses' do
    @expenses = Expense.all
    erb :'expenses/index'
  end
  #read one
  get '/expenses/:id' do
    @expense = Expense.find_by_id(params[:id])
    erb :'expenses/show'
  end
  #update (render form)
  get 'expenses/:id/edit' do
    @expense = Expense.find_by_id(params[:id])
    erb :'expenses/edit'
  end
  #update (save in db)
  patch '/expenses/:id' do
    expense = Expense.find_by_id(params[:id])
    if expense.update(params["expense"])
      redirect "/expenses/#{@expense.id}"
    else
      redirect "/expenses/#{@expense.id}/edit"
    end
  end
  #delete expense
  delete '/expenses/:id' do
    expense = Expense.find_by_id(params[:id])
    expense.destroy

    redirect '/expenses'
  end
  # delete expense (save in db)
  patch '/expenses/:id' do
    expense = Expense.find_by_id(params[:id])
    if expense.update(params["expense"])
      redirect "/expenses/#{@expense.id}"
    else
      redirect "/expense/#{@expense.id}/edit"
    end
  end
end
