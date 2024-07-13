defmodule PhoenixdateWeb.DatePickerLive do
  use PhoenixdateWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:input_error_status_all, false)
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
          <h1 class="govuk-fieldset__heading">
            When was your passport issued?
          </h1>
        </legend>
        <div id="passport-issued-hint" class="govuk-hint">
          For example, 27 3 2007
        </div>
        <div class="govuk-date-input" id="passport-issued">
          <div class="govuk-date-input__item">
            <div class="govuk-form-group">
              <label class="govuk-label govuk-date-input__label" for="passport-issued-day">
                Day
              </label>
              <input
                class="govuk-input govuk-date-input__input govuk-input--width-2"
                id="passport-issued-day"
                name="passport-issued-day"
                type="text"
                inputmode="numeric"
                phx-blur="check_date"
              />
            </div>
          </div>
          <div class="govuk-date-input__item">
            <div class="govuk-form-group">
              <label class="govuk-label govuk-date-input__label" for="passport-issued-month">
                Month
              </label>
              <input
                class="govuk-input govuk-date-input__input govuk-input--width-2"
                id="passport-issued-month"
                name="passport-issued-month"
                type="text"
                inputmode="numeric"
                phx-blur="check_date"
              />
            </div>
          </div>
          <div class="govuk-date-input__item">
            <div class="govuk-form-group">
              <label class="govuk-label govuk-date-input__label" for="passport-issued-year">
                Year
              </label>
              <input
                class="govuk-input govuk-date-input__input govuk-input--width-4"
                id="passport-issued-year"
                name="passport-issued-year"
                type="text"
                inputmode="numeric"
                phx-blur="check_date"
              />
            </div>
          </div>
        </div>
      </fieldset>
    </div>
    """
  end

  def handle_event("check_date", _value, socket) do
    socket =
      socket
      |> assign(:input_error_status, false)

    {:noreply, socket}
  end
end
