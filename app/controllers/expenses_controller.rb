class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:category_id].present?
      @expenses = current_user.expenses.where('concept like ? AND category_id = ?', "%#{params[:concept]}%", params[:category_id]).order('date DESC')
    else
      @expenses = current_user.expenses.where('concept like ?', "%#{params[:concept]}%").order('date DESC')
    end
  end
end
