defmodule ScratchCard.Ussd.ProcessCardHandler do
  @behaviour ExUssd.Handler

  def success_menu(menu) do
    menu
    |> Map.put(:title, "Recharge sucessful, thank you.")
    |> Map.put(:should_close, true)
  end

  def error_menu(menu) do
    menu
    |> Map.put(
      :error,
      "Sorry we are unable to complete your request at the moment. Please try again later. Thank you\n"
    )
    |> Map.put(:should_close, true)
  end

  def handle_menu(menu, api_parameters) do
    case api_parameters.text |> Integer.parse() do
      {voucher_number, _} ->
        with {:ok, _} <- process_voucher_validity(voucher_number) do
          success_menu(menu)
        else
          _ -> error_menu(menu)
        end

      :error ->
        error_menu(menu)
    end
  end

  def process_voucher_validity(voucher_number) do
    cond do
      voucher_number == 123_456_789 ->
        {:ok, "recharge_successful"}

      true ->
        case String.length("#{voucher_number}") != 9 do
          true -> {:error, "invalid card"}
          _ -> {:error, "expired card"}
        end
    end
  end
end
