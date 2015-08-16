defmodule Exerciser.PageController do
  use Exerciser.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
