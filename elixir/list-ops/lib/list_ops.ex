defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l) do
    do_count(l, 0)
  end
  defp do_count([first | rest], sum), do: do_count(rest, sum+1)
  defp do_count([], sum), do: sum

  @spec reverse(list) :: list
  def reverse(l) do
    do_reverse(l, [])
  end
  defp do_reverse([first | rest], result), do: do_reverse(rest, [first | result])
  defp do_reverse([], result), do: result

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    do_map(l, f, [])
  end
  defp do_map([], _, result), do: reverse(result)
  defp do_map([first | rest], f, result), do: do_map(rest, f, [f.(first) | result])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    do_filter(l, f, [])
  end
  defp do_filter([], f, result), do: reverse(result)
  defp do_filter([first | rest], f, result) do
    if f.(first) do
        do_filter(rest, f, [first | result])
    else
        do_filter(rest, f, result)
    end
  end
  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl(l, acc, f) do
    do_foldl(l, acc, f)
  end
  def do_foldl([first | rest], acc, f), do: foldl(rest, f.(first, acc), f)
  def do_foldl([], acc, _), do: acc

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr(l, acc, f) do
    do_foldr(l, acc, f)
  end
  defp do_foldr([], acc, _), do: acc
  defp do_foldr([first | last], acc, f), do: f.(first, foldr(last, acc, f))

  @spec append(list, list) :: list
  def append(a, b) do
    do_append(a, b, [])
  end
  defp do_append([first | last], b, result), do: do_append(last, b, [first | result])
  defp do_append([], [first | last], result), do: do_append([], last, [first | result])
  defp do_append([], [], result), do: reverse(result)

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    do_concat(ll, [])
  end
  defp do_concat([]), do: []
  defp do_concat([], result), do: result
  defp do_concat([first | last], result), do: do_concat(last, append(result, first))
end
