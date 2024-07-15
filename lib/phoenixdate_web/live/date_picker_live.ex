defmodule PhoenixdateWeb.DatePickerLive do
  use PhoenixdateWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:inputs_overall_error, false)
      |> assign(:input_error_status_day, false)
      |> assign(:input_error_status_month, false)
      |> assign(:input_error_status_year, false)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="govuk-form-group">
      <fieldset class="govuk-fieldset" role="group" aria-describedby="passport-issued-hint">
        <legend class="govuk-fieldset__legend govuk-fieldset__legend--l">
          <h1 class="text-3xl">
            When was your passport issued?
          </h1>
        </legend>
        <div id="passport-issued-hint" class="text-sm text-slate-500">
          For example, 27 3 2007
        </div>
        <div class="govuk-date-input" id="passport-issued">
          <.form for={@form} phx-change="validate" phx-submit="save">
            <div class="govuk-date-input__item">
              <div class="govuk-form-group">
                <label class="govuk-label govuk-date-input__label" for="passport-issued-day">
                  Day
                </label>
                <.input
                  class="govuk-input govuk-date-input__input govuk-input--width-2"
                  id="passport-issued-day"
                  name="passport-issued-day"
                  type="text"
                  inputmode="numeric"
                  field={@form[:day]}
                />
              </div>
            </div>
            <div class="govuk-date-input__item">
              <div class="govuk-form-group">
                <label class="govuk-label govuk-date-input__label" for="passport-issued-month">
                  Month
                </label>
                <.input
                  class="govuk-input govuk-date-input__input govuk-input--width-2"
                  id="passport-issued-month"
                  name="passport-issued-month"
                  type="text"
                  inputmode="numeric"
                  field={@form[:month]}
                />
              </div>
            </div>
            <div class="govuk-date-input__item">
              <div class="govuk-form-group">
                <label class="govuk-label govuk-date-input__label" for="passport-issued-year">
                  Year
                </label>
                <.input
                  class="govuk-input govuk-date-input__input govuk-input--width-4"
                  id="passport-issued-year"
                  name="passport-issued-year"
                  type="text"
                  inputmode="numeric"
                  field={@form[:year]}
                />
              </div>
            </div>
          </.form>
        </div>
      </fieldset>
    </div>
    """
  end

  def add_error_tailwind_classes(%{status: "active"}), do: "bg-green-300"

  def handle_event("validate", %{"form_data" => form_data}, socket) do
    # socket =
    #   socket
    #   |> assign(:input_error_status, false)

    # {:noreply, socket}

    case validate_form_data(form_data) do
      :ok ->
        socket = assign(socket, :inputs_overall_error, false)
        {:noreply, socket}

      {:error, _error_msg} ->
        # Update socket to reflect error state
        socket = assign(socket, :inputs_overall_error, true)
        {:noreply, socket}
    end
  end

  defp validate_form_data(_form_data) do
    # Implement validation logic
    # Return :ok or {:error, error_msg} based on validation
  end
end
