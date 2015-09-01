module UsersHelper
  def show_expenditures(object)
    if !object.expenditures || object.expenditures.empty?
      "<h3>No expenditures recorded</h3>".html_safe
    else
      render partial: "expenditures/table", locals: {expenditures: object.expenditures.last(20)}
    end
  end
end
