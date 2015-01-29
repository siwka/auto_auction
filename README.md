Application accepts (via a form) a CSV file. We assume the columns will
always be in the same order, that there will always be data in each column, and that there will always be a header line.
2. Application parses the given file and store the information in a database.
3. After upload, application should output:
	a. A list of the auctions (name and city)
	b. The number of vehicles each auction has sold
	c. The total profit the auction made selling those vehicles
		i. profit = winning_bid ­ seller_payout
	d. The average profit the auction made per vehicle.