defmodule Pi do
  @moduledoc false
  def calculate(num_iter) do
    list = Enum.map(1..num_iter, fn x -> in_or_out(:random.uniform, :random.uniform) end)
    inside = Enum.count(list, fn x -> x and true end )

    IO.puts "Done!  I think the value of Pi is #{4*inside / num_iter}"
  end

  def square(x) do
    x*x
  end

  def in_or_out(x,y) do
   :math.sqrt(:math.pow(x,2) + :math.pow(y,2)) < 1
  end

  def calc2(numIters) do
    calc2(numIters, numIters,0)
  end

  def calc2(0, iter_total, count) do
    IO.puts "Done!  I think the value of Pi is #{4*count / iter_total}"
  end

  def calc2(iter_left, iter_total, count) do
    if in_or_out(:random.uniform, :random.uniform) do
      calc2(iter_left-1, iter_total, count+1)
    else
      calc2(iter_left-1, iter_total, count)
    end
  end

  def compare_calcs() do
    startTime = :calendar.universal_time()
    calculate(10000000)
    endTime = :calendar.universal_time()

    {_, {_, _, difference}} = :calendar.time_difference(startTime, endTime)

    IO.puts "Calc1 took #{difference} seconds"

    startTime = :calendar.universal_time()
    calc2(10000000)
    endTime = :calendar.universal_time()

    {_, {_, _, difference}} = :calendar.time_difference(startTime, endTime)
    IO.puts "Calc2 took #{difference} seconds"
  end
  
end
