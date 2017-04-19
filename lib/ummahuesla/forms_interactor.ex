defmodule Ummahuesla.FormsInteractor do

  @form_ids %{
    name: :'entry.1650680323',
    email: :'entry.1458164473',
    team: :'entry.1855903074',
    team_name: :'entry.1161251632',
    work_for: :'entry_1248925610',
    project: :'entry.1092327792',
    searching_for: 'entry.2014663631',
    gender: 'entry.272567456',
    size: 'entry.2095975789',
    profession: 'entry.1670056304',
    diet: 'entry.1855741580',
    sleep: 'entry.1933676789',
    sentence: 'entry.825156911',
    questions: 'entry.1152090245'
  }

  def form_ids, do: @form_ids

  def submit(data \\ %{}) do
    data
    |> map_data_to_form_ids
    |> post_data
  end

  defp post_data(data) do
    form_id = "1FAIpQLSclEHeh8A0o5WYPhthD5FKwDmuQReqkzn-ZFjH9BDACJxbNnQ"
    url = "https://docs.google.com/forms/d/e/#{form_id}/formResponse"
    say_thanks HTTPoison.post url, {:form, data}, []
  end

  def map_data_to_form_ids(data) do
    keys = Map.keys(data)
    Enum.map(keys, fn (key) ->
      new_key = Map.get(@form_ids, key)
      {new_key, Map.get(data, key)}
    end)
  end

  defp say_thanks { :ok, response } do
    IO.puts inspect response.body
    if String.match?(response.body, ~r/thank you/) do
      IO.puts "\n\n"
      IO.puts "Registration successful!\n"
      IO.puts """
      On behalf of the Umma hüsla crew, this formular wants to say thank you for joining us.
      We are looking forward to seeing you on the 09. and 10. of june.
      For the saftey of the event please don’t forget to share the word. Then the word is the bird.
      """
      IO.puts "... please remember that every team member has to register on his own"
      str = """
       __       __   ______   __    __  ________        ______  ________
     |  \\     /  \\ /      \\ |  \\  /  \\|        \\      |      \\|        \\
     | $$\\   /  $$|  $$$$$$\\| $$ /  $$| $$$$$$$$       \\$$$$$$ \\$$$$$$$$
     | $$$\\ /  $$$| $$__| $$| $$/  $$ | $$__            | $$     | $$
     | $$$$\\  $$$$| $$    $$| $$  $$  | $$  \\           | $$     | $$
     | $$\\$$ $$ $$| $$$$$$$$| $$$$$\\  | $$$$$           | $$     | $$
     | $$ \\$$$| $$| $$  | $$| $$ \\$$\\ | $$_____        _| $$_    | $$
     | $$  \\$ | $$| $$  | $$| $$  \\$$\\| $$     \\      |   $$ \\   | $$
       \\$$      \\$$ \\$$   \\$$ \\$$   \\$$ \\$$$$$$$$       \\$$$$$$    \\$$

      """
      IO.puts str
    else
      IO.puts "\nUnfortunately saving your data failed. Please try again.\n"
    end
  end

end
