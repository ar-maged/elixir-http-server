defmodule SimpleServer.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger

  plug(Plug.Logger, log: :debug)

  plug(:match)
  plug(:dispatch)

  get "/hello" do
    send_resp(conn, 200, "World!")
  end

  match _ do
    send_resp(conn, 404, "404: Not Found")
  end
end
