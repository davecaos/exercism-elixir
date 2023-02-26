defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational

  def add({num_a, den_a}, {num_b, den_b}) do
    reduce({num_a* den_b + num_b * den_a, den_a * den_b})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({num_a, den_a}, {num_b, den_b}) do
    reduce({num_a* den_b - num_b * den_a, den_a * den_b})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({num_a, den_a}, {num_b, den_b}) do
    reduce({num_a * num_b, den_a * den_b})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({num_a, den_a}, {num_b, den_b}) do
    reduce({num_a * den_b, den_a * num_b})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({num, den}) do
    reduce({Kernel.abs(num), Kernel.abs(den)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({num, den}, n) when n < 0 do
    reduce({Integer.pow(den, -n), Integer.pow(num, -n)})
  end

  def pow_rational({num, den}, n) do
    reduce({Integer.pow(num, n), Integer.pow(den, n)})
  end
  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {num, den}) do
    :math.pow(x, num/den)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({num, den}) do
    gcd = Integer.gcd(num, den)
    fix_sign({div(num, gcd), div(den, gcd)})
  end

  @spec fix_sign(a :: rational) :: rational()
  def fix_sign({num, den}) when den < 0, do: {-num, -den}
  def fix_sign(rational), do: rational
end
