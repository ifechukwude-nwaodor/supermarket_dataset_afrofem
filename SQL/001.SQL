with product_totals as (
                      select transactions.location, transactions.product, products.category, prices.price, sum(quantity) as total_quantity
                      from transactions

                      left join prices on transactions.product=prices.product and transactions.location=prices.location
                      left join products on transactions.product=products.product

                      group by 1, 2, 3, 4
                      )
select category, sum(price*total_quantity) as revenue
from product_totals
group by category
order by revenue desc
      


          
          