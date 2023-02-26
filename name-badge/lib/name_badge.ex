defmodule NameBadge do

  def print(id, name, department) do
    employee_number =  if id, do: "[#{id}] - ", else: ""
    department_string = if department, do: "#{String.upcase(department)}", else: "OWNER"
    "#{employee_number}#{name} - #{department_string}"
  end

end
