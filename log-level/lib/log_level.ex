defmodule LogLevel do

  def from_level_to_log_data(level) do
    cond do
      level == 0	->  {:trace, false}
      level == 1	->  {:debug, true}
      level == 2	->  {:info, true}
      level == 3	->  {:warning, true}
      level == 4	->  {:error,  true}
      level == 5	->  {:fatal, false}
      true -> {:unknown, false}
    end
  end

  def to_label(level, false) do
    {log_level, support_legacy?} = from_level_to_log_data(level)
    log_level
  end

  def to_label(level, legacy?) do
    {log_level, support_legacy?} = from_level_to_log_data(level)

    if legacy? == support_legacy? do
      log_level
    else
      :unknown
    end

  end

  def alert_recipient(level, legacy?) do
    log_level = to_label(level, legacy?)
    _alert_recipient(log_level, legacy?)
  end

  def _alert_recipient(:error, _legacy?) do
    :ops
  end

  def _alert_recipient(:fatal, false) do
    :ops
  end

  def _alert_recipient(:unknown, true) do
    :dev1
  end

  def _alert_recipient(:unknown, false) do
    :dev2
  end

  def _alert_recipient(_level, _legacy?) do
    false
  end

end
