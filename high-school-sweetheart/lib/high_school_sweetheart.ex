defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim(name)
      |> String.at(0)
  end


  def initial(name) do
    initial =
        first_letter(name)
        |> String.upcase()
    "#{initial}."
  end

  def initials(full_name) do
    names = String.split(full_name, " ", trim: true)
    Enum.map(names, fn(name)-> initial(name) end)
      |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(full_name1)}  +  #{initials(full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
