#Challenge!


#Predict the annual number fof visitors to Yosemite National Park for the next 5 years

#Title	Bookmark
#Yosemite NP	Bookmark this report: https://irma.nps.gov/Stats/SSRSReports/Park%20Specific%20Reports/Annual%20Park%20Recreation%20Visitation%20(1904%20-%20Last%20Calendar%20Year)
#Retrieved on Fri 12 Jan 2018

#create a dataframe called Yos (expand below)
{
Yos <- read.table(header = TRUE, text = '
Year	RecreationVisitors	TotalRecreationVisitors
1906	5,414	190,404,561
1907	7,102	190,404,561
1908	8,850	190,404,561
1909	13,182	190,404,561
1910	13,619	190,404,561
1911	12,530	190,404,561
1912	10,884	190,404,561
1913	13,735	190,404,561
1914	15,145	190,404,561
1915	33,452	190,404,561
1916	33,390	190,404,561
1917	34,510	190,404,561
1918	33,527	190,404,561
1919	58,362	190,404,561
1920	68,906	190,404,561
1921	91,513	190,404,561
1922	100,506	190,404,561
1923	130,046	190,404,561
1924	105,894	190,404,561
1925	209,166	190,404,561
1926	274,209	190,404,561
1927	490,430	190,404,561
1928	460,619	190,404,561
1929	461,257	190,404,561
1930	458,566	190,404,561
1931	461,855	190,404,561
1932	498,289	190,404,561
1933	296,088	190,404,561
1934	309,431	190,404,561
1935	372,317	190,404,561
1936	431,192	190,404,561
1937	481,492	190,404,561
1938	443,325	190,404,561
1939	466,552	190,404,561
1940	506,781	190,404,561
1941	597,863	190,404,561
1942	319,816	190,404,561
1943	116,682	190,404,561
1944	120,494	190,404,561
1945	290,569	190,404,561
1946	640,483	190,404,561
1947	777,622	190,404,561
1948	745,899	190,404,561
1949	808,372	190,404,561
1950	820,953	190,404,561
1951	858,405	190,404,561
1952	973,971	190,404,561
1953	969,225	190,404,561
1954	1,008,000	190,404,561
1955	984,200	190,404,561
1956	1,114,200	190,404,561
1957	1,138,700	190,404,561
1958	1,139,300	190,404,561
1959	1,061,500	190,404,561
1960	1,150,400	190,404,561
1961	1,227,100	190,404,561
1962	1,505,500	190,404,561
1963	1,473,400	190,404,561
1964	1,547,000	190,404,561
1965	1,635,400	190,404,561
1966	1,817,100	190,404,561
1967	2,238,300	190,404,561
1968	2,281,100	190,404,561
1969	2,291,300	190,404,561
1970	2,277,200	190,404,561
1971	2,342,200	190,404,561
1972	2,190,301	190,404,561
1973	2,254,300	190,404,561
1974	2,274,600	190,404,561
1975	2,537,400	190,404,561
1976	2,682,400	190,404,561
1977	2,392,600	190,404,561
1978	2,569,268	190,404,561
1979	2,350,782	190,404,561
1980	2,490,282	190,404,561
1981	2,516,893	190,404,561
1982	2,415,587	190,404,561
1983	2,457,464	190,404,561
1984	2,738,467	190,404,561
1985	2,831,952	190,404,561
1986	2,876,717	190,404,561
1987	3,152,275	190,404,561
1988	3,216,681	190,404,561
1989	3,308,159	190,404,561
1990	3,124,939	190,404,561
1991	3,423,101	190,404,561
1992	3,819,518	190,404,561
1993	3,839,645	190,404,561
1994	3,962,117	190,404,561
1995	3,958,406	190,404,561
1996	4,046,207	190,404,561
1997	3,669,970	190,404,561
1998	3,657,132	190,404,561
1999	3,493,607	190,404,561
2000	3,400,903	190,404,561
2001	3,368,731	190,404,561
2002	3,361,867	190,404,561
2003	3,378,664	190,404,561
2004	3,280,911	190,404,561
2005	3,304,144	190,404,561
2006	3,242,644	190,404,561
2007	3,503,428	190,404,561
2008	3,431,514	190,404,561
2009	3,737,472	190,404,561
2010	3,901,408	190,404,561
2011	3,951,393	190,404,561
2012	3,853,404	190,404,561
2013	3,691,191	190,404,561
2014	3,882,642	190,404,561
2015	4,150,217	190,404,561
2016	5,028,868	190,404,561


')
}

#Remove the commas from the numbers

Yos$RecreationVisitors <- as.numeric(gsub(",","",Yos$RecreationVisitors))
Yos$RecreationVisitors <- Yos$RecreationVisitors/10^6
head(Yos)
tail(Yos)

#EDA
#Plot the time series

plot(RecreationVisitors~Year,
     data=Yos,type="b", 
     ylab = "Yosemite Annual Visitors (In millions)")
#Curvature in the time series plot indicates a multiplicative effect from year to year.
#Very similar to the zion data.

#Apply a log transformation so the multiplicative effect becomes additive.
#(in millions)
Yos$lnvisitors <- log(Yos$RecreationVisitors)

#confirm if relationship appears more additive
plot(lnvisitors~Year,
     data=Yos,
     type="b", 
     ylab = "Yosemite Log Annual Visitors (In millions)")
abline(v=1941, col="red")
abline(v=1946, col="red")
#Graph appears to be additive from 1930s to present, but has a dip between 1940-1950.


#Non-constant mean changes occur from 1941 to 1946. Some possible causes for
#the curvature from 1920s to 1946 may be due to an increase in exposure, interest, and transportation. 
#The dip seen from 1940-1946 roughly fits the time period of world war 2, so may suggest that wartime 
#may have changed opportunities or interest for individuals.

#By subsetting to after 1946, we notice a more additive model that suggests less if not any changes 
#in behavior or policy from year to year. 
#With this subsetted data, we can see a more constant mean change that reflects future Yosemite tourism demand.

#Take the recent additive curve of constant mean change from 1950-Present.
Yos[Yos$Year==1945,]
Yos46 <- Yos[-(1:40),]
head(Yos46)
tail(Yos46)


#plot again to check for additive model
plot(lnvisitors~Year,
     data=Yos46,
     type="b",
     ylab= "Yosemite Log Annual Visitors (In millions)")
#A little shaky, but all looks well: Additive model.




#Making Predictions



library("astsa", lib.loc="~/Library/R/3.4/library")

#Find Parameter values
Yos46.out <- sarima(Yos46$lnvisitors,1,1,1)
Yos46.out$ttable[1:3,1]
#This shows the parameter estimates and the standard errors^
#ar1 is phi
#ar2 is epsilon
#ar3 is mu



# Compute predictions for the next 5 years by fitting in an ARIMA(1,1,1) and make a graph
LogYosemiteVisitors <- Yos46$lnvisitors

Yos46.future <- sarima.for(LogYosemiteVisitors,n.ahead=5,1,1,1)
abline(v=71, col = "blue")
Yos46.future
#Above gives us prediction and standard error, so compute 95% prediction intervals
t <- qnorm(0.975)
Yos46.L <- Yos46.future$pred - t* Yos46.future$se
Yos46.U <- Yos46.future$pred + t* Yos46.future$se

#un-transform the log data back to normal
Yos46.yhat <- exp(Yos46.future$pred)



#Graph of the unlogged ARIMA model
YosemiteVisitors <- exp(Yos46$lnvisitors)

Yos46.future <- sarima.for(YosemiteVisitors,
                           n.ahead=5,1,1,1)
abline(v=71, col = "blue")

Yos46.yhat.L <- exp(Yos46.L)
Yos46.yhat.U <- exp(Yos46.U)
cbind("parameter" = Yos46.yhat,"lower" = Yos46.yhat.L,"upper" = Yos46.yhat.U)
#This shows the parameter prediction values with 95% confidence intervals^


# Create a publication quality graphic 


plot(RecreationVisitors~Year,data=Yos,type="o",
     ylab="Yearly Visitors (in millions)",
     xlim=c(1980,2021),
     ylim=c(0,7),
     main = "Yosemite National Park Annual Visitors")
lines(2017:2021,Yos46.yhat.L,col="blue",lty=2)
lines(2017:2021,Yos46.yhat.U,col="blue",lty=2)
polygon(c(2017:2021,rev(2017:2021)),c(Yos46.yhat.L,rev(Yos46.yhat.U)),
        col = "light gray", 
        border = NA)
lines(2017:2021,Yos46.future$pred,col="red",type="b",pch=5)
lines(2017:2021,Yos46.future$pred,col="red",type="b",pch=3)
