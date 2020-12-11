defmodule ScratchCard.Endpoints do
  use Plug.Router

  alias ScratchCard.Ussd

  require Logger

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["text/*"],
    json_decoder: Jason
  )

  plug(:match)
  plug(:dispatch)

  # Africa talking callback URL
  post "v1/ussd" do
    request = conn.params

    %{"text" => text, "sessionId" => session_id, "serviceCode" => service_code} = request

    menu = Ussd.start_session()

    {:ok, response} =
      ExUssd.goto(
        internal_routing: %{text: text, session_id: session_id, service_code: service_code},
        menu: menu,
        api_parameters: request
      )

    send_resp(conn, 200, response)
  end

  match(_, do: send_resp(conn, 404, "404 error not found"))
end
