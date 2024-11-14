def stock_picker(prices)
  if prices.length <= 1
    return 0
  end
  min_price, min_idx = prices[0], 0
  max_profit, res = -1, [0, 0]

  prices.each_with_index do |price, index|
    # Only need to track min price in the past, which we can try to sell
    # at the current price for max profit
    if price - min_price > max_profit
      max_profit = price - min_price
      res = [min_idx, index]
    end 

    if price < min_price
      min_price = price
      min_idx = index
    end
  end
  return res
end

p stock_picker([17,3,6,9,15,8,6,1,10])