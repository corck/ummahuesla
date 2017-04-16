defmodule Ummahuesla.CLI do

  def run do
    %{}
    |> get_name
    #|> get_email
    #|> Ummahuesla.TeamQuestions.get_team
    #|> get_team_name
    #|> Ummahuesla.TeamQuestions.enough_work_for
    #|> get_project_desc
    #|> get_searching_for
    |> get_gender
    |> get_size
    |> Ummahuesla.FormsInteractor.submit
    #|> IO.inspect
  end

  defp get_name(answers) do
    Ummahuesla.QuestionFormatter.ask_question(answers, :name, "Whats your name")
  end

  defp get_email(answers) do
    Ummahuesla.QuestionFormatter.ask_question(answers, :email, "Whats your contact email")
  end

  defp get_team_name(answers) do
    Ummahuesla.QuestionFormatter.ask_question(answers, :team_name, "Whats your team name")
  end

  defp get_project_desc(answers) do
    Ummahuesla.QuestionFormatter.ask_question(answers, :project, "We are going to umma hüsla this project")
  end

  defp get_searching_for(answers) do
    alist = ["hardware", "ideas", "love"]
    question =  "We are going to umma hüsla a project and searching for?"
    answer_value = Ummahuesla.QuestionFormatter.ask_option_question(alist, question)
    Map.put(answers, :searching_for, answer_value)
  end

  defp get_gender(answers) do
    alist = ["Girl", "Dude", "neither & nor"]
    answer_value = Ummahuesla.QuestionFormatter.ask_option_question(alist, "What's your gender?")
    Map.put(answers, :gender, answer_value)
  end

  defp get_size(answers) do
    alist = ["S", "M", "L", "XL", "Don't wanna talk about it"]
    answer_value = Ummahuesla.QuestionFormatter.ask_option_question(alist, "T-Shirt Size?")
    Map.put(answers, :size, answer_value)
  end

  defp ask_option_question(alist, question) do
    Ummahuesla.QuestionFormatter.ask_option_question(alist, question)
  end
end
