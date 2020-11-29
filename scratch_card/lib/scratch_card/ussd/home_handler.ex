defmodule ScratchCard.Ussd.HomeHandler do
  @behaviour ExUssd.Handler
  alias ScratchCard.Ussd.ProcessCardHandler

  def handle_menu(menu, _api_parameters) do
    menu
    |> Map.put(
      :error,
      "You have entered an incorrect format.\nPlease check and try again. For recharge dial *141*recharge voucher PIN# ok. Thank you."
    )
    |> Map.put(:validation_menu, ExUssd.Menu.render(name: "", handler: ProcessCardHandler))
  end
end
