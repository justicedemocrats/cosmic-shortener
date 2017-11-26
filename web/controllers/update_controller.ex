defmodule Shorten.UpdateController do
  use Shorten.Web, :controller

  def cosmic(conn, _params) do
    Cosmic.update()

    json(conn, %{
      "unnecessary" => "Ben implemented webhooks! No need to visit hit this link any more, but an update just happened just in case. If it's not updating, contact Ben. Thanks!"
    })
  end
end
