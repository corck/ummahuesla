defmodule Ummahuesla.FormsInteractor do

  @form_ids %{
    team: :'entry.701965180',
    email: :'entry.1028970138'
  }

  def submit(data \\ %{}) do
    data
    |> map_data_to_form_ids
    |> post_data
  end

  defp post_data(data) do
    form_id = "1FAIpQLSflXpkRg2xr41IFUlmY9SKunQ4vFdQYmk50CfirfnLhd7alhg"
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
    IO.puts ""
    IO.puts ""
    IO.puts ""
    IO.puts "Erfolgreich registriert! Ihr seid beim #UH17 dabei!"
    IO.puts " "
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
  end

end
