defmodule FreelancerRates do
  @hours_by_day 8.0
  @billiable_days_by_month 22

  def daily_rate(hourly_rate) do
    @hours_by_day * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * (discount/100)
  end

  def monthly_rate(hourly_rate, discount) do
   trunc(ceil(apply_discount(daily_rate(hourly_rate) *@billiable_days_by_month, discount)))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    budget / apply_discount(daily_rate(hourly_rate), discount)
    |> Float.floor(1)
  end
end
