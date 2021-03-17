Super Easy, but may come with caveats.

The attached paper (DaEng2013_Ver3.pdf) proposes a simple way to reduce model sparsity when doing something along the lines of association rule mining.
Just group each product purchase (rows) by month/week on the columns. Then run a clustering model. Pretty simple, right?
The clustering model should output products that are purchased at similar intervals (complement goods).

Although I think this may be an extremely helpful analysis especially when the variability of items is consistent throughout time and vendor, this approach fails to consider seasonality and other operating characteristics that could affect placed orders. It also fails to consider potential substitute goods.

Thought 1) To override the complexity of seasonality or vendor affecting the placed orders, I propose to normalize the products sold using some seasonality index and other vendor factors. Essentially creating a regression where y is the units sold and x is: seasonality index, sales channel, sales vendor, product attributes, etc. This predicted y will eventually be replacing the order count by month. This will ensure that the noise associated with these orders are properly accounted for.

Thought 2) Clustering is a completely feasible and novel method. However, it doesn't necessarily need to be used to find complement goods. It also does not weed out potential cannibalization. Hence, I believe that a a simple row-by-row correlation or regression coefficient would suffice. This will identify items that could be cross-sold and also substitute each other's purchases. Also, along the lines of a correlation or regression: Flagging debut timings is crucial. If a product/service wasn't sold at the same time as another, you CANNOT compare it based on the time series. The non-overlapping timings must be omitted (NA) for analysis. This brings a challenge of statistical power. A row-by-row regression is most likely favored for this type of analysis if there is not enough time-based overlap.

Thought 3) Another challenge that we might face is computational efficiency. This is where the k-means triumphs over row by row regressions. In this case, clustering probably should be used, but anticlustering could probably weed out any substitutes. This might still be a challenge, as anticlustering only reverses the objective function. However, this is where my brain stops!
