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
    #|> get_size
    |> get_profession
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
    p = %{ q: "We are going to umma hüsla a project and searching for?",
          options: ["hardware", "ideas", "love"],
          key: :gender
        }
    ask_options(answers, p)
  end

  defp get_gender(answers) do
    p = %{ q: "What's your gender?",
          options: ["Girl", "Dude", "neither & nor"],
          key: :gender
        }
    ask_options(answers, p)
  end

  defp get_size(answers) do
    p = %{ q: "T-Shirt Size?",
          options: ["S", "M", "L", "XL", "Don't wanna talk about it"],
          key: :size
        }
    ask_options(answers, p)
  end

  defp get_profession(answers) do
    p = %{ q: "what's your profession",
          options: ["logic things", "pretty things", "neither & nor"],
          key: :profession
        }
    ask_options(answers, p)
  end

  defp ask_option_question(alist, question) do
    Ummahuesla.QuestionFormatter.ask_option_question(alist, question)
  end

  defp ask_options(answers, %{q: question, options: list, key: key}) do
    answer_value = Ummahuesla.QuestionFormatter.ask_option_question(list, question)
    Map.put(answers, key, answer_value)
  end
end
