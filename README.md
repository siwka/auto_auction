<ol>
<li><p>Application accepts (via a form) a CSV file. We assume the columns will always be in the same order, that there will always be data in each column, and that there will always be a header line.</p></li>
<li><p>Application parses the given file and store the information in a database.</p></li>
<li><p>After upload, application should output:</p>

<p>a. A list of the auctions (name and city)</p>

<p>b. The number of vehicles each auction has sold</p>

<p>c. The total profit the auction made selling those vehicles</p>

<pre><code>i. profit = winning_bid ­ seller_payout
</code></pre>

<p>d. The average profit the auction made per vehicle.</p></li>
</ol>

<p>Run:</p>

<p>On main page load cvs file to see results.</p>

