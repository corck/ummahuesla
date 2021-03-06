defmodule Ummahuesla.CLI do

  def main(_argv) do
    welcome()
    %{}
    |> get_name
    |> get_email
    |> Ummahuesla.TeamQuestions.get_team
    |> get_team_name
    |> Ummahuesla.TeamQuestions.enough_work_for
    |> get_project_desc
    |> get_searching_for
    |> get_gender
    |> get_size
    |> get_profession
    |> get_diet
    |> get_sleep
    |> get_make_it_sentence
    |> get_further_questions
    |> Ummahuesla.FormsInteractor.submit
    #|> IO.inspect
  end

  defp get_name(answers) do
    Ummahuesla.QuestionFormatter.ask_question(answers, :name, "Whats your name")
  end

  defp get_email(answers) do
    Ummahuesla.Email.get_email(answers)
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
          key: :searching_for
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

  defp get_diet(answers) do
    p = %{ q: "Diet?",
          options: ["kosher", "veggie", "vegan", "no pig", "meat, pasta, chicken"],
          key: :diet
        }
    ask_options(answers, p)
  end

  defp get_sleep(answers) do
    p = %{ q: "Sleep",
          options: ["I will sleep at home", "sleep is for donkeys", "I will sleep at the location"],
          key: :sleep
        }
    ask_options(answers, p)
  end

  defp get_make_it_sentence(answers) do
    Ummahuesla.MakeIt.get_make_it(answers)
  end

  defp ask_options(answers, %{q: question, options: list, key: key}) do
    answer_value = Ummahuesla.QuestionFormatter.ask_option_question(list, question)
    Map.put(answers, key, answer_value)
  end

  defp get_further_questions(answers) do
      Ummahuesla.QuestionFormatter.ask_question(answers, :questions, "Hä? Like super Hä?\nFor any further questions, drop us a line now.\n")
  end

  defp welcome do
    str = """
     __    __  __    __    __    ________
   |  \\  |  \\|  \\  |  \\ _/  \\  |        \\
   | $$  | $$| $$  | $$|   $$   \\$$$$$$$$
   | $$  | $$| $$__| $$ \\$$$$      /  $$
   | $$  | $$| $$    $$  | $$     /  $$
   | $$  | $$| $$$$$$$$  | $$    /  $$
   | $$__/ $$| $$  | $$ _| $$_  /  $$
     \\$$    $$| $$  | $$|   $$ \\|  $$
      \\$$$$$$  \\$$   \\$$ \\$$$$$$ \\$$

    """
    IO.puts "\nRegistration for\n"
    IO.puts str
    IO.puts "\nGreat to have you with us!!\n"
  end
end
