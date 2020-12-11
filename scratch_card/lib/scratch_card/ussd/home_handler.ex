defmodule ScratchCard.Ussd.HomeHandler do
  @behaviour ExUssd.Handler
  alias ScratchCard.Ussd.ProcessCardHandler

  @moduledoc """
  This module implements the initial USSD Menu handler logic.

  iex> menu = ScratchCard.Ussd.start_session()

  iex> ExUssd.simulate(menu: menu, text: "*141#", service_code: "*141#")
      {:ok,
      %{
        menu_string: "You have entered an incorrect format.\nPlease check and try again. For recharge dial *141*recharge voucher PIN# ok. Thank you.",
        should_close: true
      }}

  """

  @error_msg "You have entered an incorrect format.\nPlease check and try again. For recharge dial *141*recharge voucher PIN# ok. Thank you."

  def handle_menu(menu, _api_parameters) do
    menu
    |> Map.put(:error, @error_msg)
    |> Map.put(:should_close, true)
    |> Map.put(:validation_menu, ExUssd.Menu.render(name: "", handler: ProcessCardHandler))
  end
end
