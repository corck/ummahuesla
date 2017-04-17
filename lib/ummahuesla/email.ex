defmodule Ummahuesla.Email do
  @regex ~r/(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)/

  def get_email(answers) do
    email = IO.gets "\nWhats your contact email\n"
    do_get_email(answers, email, valid_email(email))
  end

  defp do_get_email(answers, email, true) do
    Map.put(answers, :email, String.trim(email))
  end

  defp do_get_email(answers, _email, false) do
    IO.puts ""
    email = IO.gets "Please enter a valid email address" <> "\n"
    do_get_email(answers, email, valid_email(email))
  end

  defp valid_email(email) do
    String.match?(email, @regex)
  end
end
