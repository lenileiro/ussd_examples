defmodule ScratchCard.Ussd do
  alias ScratchCard.Ussd.HomeHandler

  def start_session do
    ExUssd.Menu.render(name: "Home", handler: HomeHandler)
  end
end
