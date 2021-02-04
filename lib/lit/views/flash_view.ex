defmodule Lit.FlashView do
  @moduledoc """
  Contains functions for dealing with flash messages.
  """

  use Phoenix.View, root: "lib/lit/templates"
  use Phoenix.HTML

  import Phoenix.Controller, only: [get_flash: 2]

  @doc """
  Returns a formatted flash message of the given type.

  ## Parameters

  - `conn`: The current `Plug.Conn`.
  - `type`: The flash type, such as `:error`.

  ## Example

      iex> conn = %Plug.Conn{private: %{phoenix_flash: %{"error" => "Error Message"}}}
      ...> flash_message(conn, "error") |> safe_to_string()
      "<p class=\\"lit-flash error\\">Error Message <button class='lit-flash-close'>x</button></p>"
  """
  @spec flash_message(Plug.Conn.t(), type :: atom | String.t()) :: Phoenix.HTML.safe()
  def flash_message(conn, type) do
    get_flash(conn, type)
  end
end
