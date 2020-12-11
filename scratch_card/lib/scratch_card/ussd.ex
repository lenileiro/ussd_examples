defmodule ScratchCard.Ussd do
  alias ScratchCard.Ussd.HomeHandler

  @doc """
  start ussd session

  Returns the initial USSD menu struct

  ## Example

      iex> ScratchCard.Ussd.start_session()
      %ExUssd.Menu{
        callback: #Function<1.52584401/1 in ExUssd.Menu.render/1>,
        data: nil,
        default_error_message: "Invalid Choice\n",
        display_style: ":",
        error: nil,
        handle: false,
        handler: ScratchCard.Ussd.HomeHandler,
        menu_list: [],
        name: "Home",
        next: %{display_style: ":", input_match: "98", name: "MORE"},
        parent: nil,
        previous: %{display_style: ":", input_match: "0", name: "BACK"},
        should_close: false,
        show_navigation: true,
        split: 7,
        success: false,
        title: nil,
        validation_menu: nil
      }
  """

  def start_session do
    ExUssd.Menu.render(name: "Home", handler: HomeHandler)
  end
end
