
#Predict the annual number fof visitors to Zion National Park for the next 5 years

#Title,Bookmark
#Zion NP,Bookmark this report: https://irma.nps.gov/Stats/SSRSReports/Park%20Specific%20Reports/Annual%20Park%20Recreation%20Visitation%20(1904%20-%20Last%20Calendar%20Year)
#Retrieved on Mon 8 Jan 2018

#create a dataframe called zion (expand below)
{
zion <- read.csv(header = TRUE, text = '
Year,RecreationVisitors,TotalRecreationVisitors
1919,"1,814","111,311,078"
1920,"3,692","111,311,078"
1921,"2,937","111,311,078"
1922,"4,109","111,311,078"
1923,"6,408","111,311,078"
1924,"8,400","111,311,078"
1925,"16,817","111,311,078"
1926,"21,964","111,311,078"
1927,"24,303","111,311,078"
1928,"30,016","111,311,078"
1929,"33,383","111,311,078"
1930,"55,297","111,311,078"
1931,"59,186","111,311,078"
1932,"51,650","111,311,078"
1933,"48,763","111,311,078"
1934,"68,801","111,311,078"
1935,"97,280","111,311,078"
1936,"124,393","111,311,078"
1937,"137,404","111,311,078"
1938,"149,075","111,311,078"
1939,"158,063","111,311,078"
1940,"165,029","111,311,078"
1941,"192,805","111,311,078"
1942,"68,797","111,311,078"
1943,"44,089","111,311,078"
1944,"42,243","111,311,078"
1945,"78,280","111,311,078"
1946,"212,280","111,311,078"
1947,"273,953","111,311,078"
1948,"297,571","111,311,078"
1949,"307,881","111,311,078"
1950,"323,402","111,311,078"
1951,"331,079","111,311,078"
1952,"352,921","111,311,078"
1953,"389,445","111,311,078"
1954,"416,800","111,311,078"
1955,"406,800","111,311,078"
1956,"421,200","111,311,078"
1957,"525,100","111,311,078"
1958,"590,700","111,311,078"
1959,"585,000","111,311,078"
1960,"575,800","111,311,078"
1961,"604,700","111,311,078"
1962,"622,100","111,311,078"
1963,"681,100","111,311,078"
1964,"705,200","111,311,078"
1965,"763,600","111,311,078"
1966,"815,200","111,311,078"
1967,"788,400","111,311,078"
1968,"877,100","111,311,078"
1969,"904,300","111,311,078"
1970,"903,600","111,311,078"
1971,"897,000","111,311,078"
1972,"889,417","111,311,078"
1973,"993,800","111,311,078"
1974,"859,300","111,311,078"
1975,"1,055,200","111,311,078"
1976,"1,090,000","111,311,078"
1977,"1,105,900","111,311,078"
1978,"1,193,212","111,311,078"
1979,"1,040,528","111,311,078"
1980,"1,123,846","111,311,078"
1981,"1,288,808","111,311,078"
1982,"1,246,290","111,311,078"
1983,"1,273,030","111,311,078"
1984,"1,377,254","111,311,078"
1985,"1,503,272","111,311,078"
1986,"1,670,503","111,311,078"
1987,"1,777,619","111,311,078"
1988,"1,948,332","111,311,078"
1989,"1,998,856","111,311,078"
1990,"2,102,400","111,311,078"
1991,"2,236,997","111,311,078"
1992,"2,390,626","111,311,078"
1993,"2,392,580","111,311,078"
1994,"2,270,871","111,311,078"
1995,"2,430,162","111,311,078"
1996,"2,498,001","111,311,078"
1997,"2,445,534","111,311,078"
1998,"2,370,048","111,311,078"
1999,"2,449,664","111,311,078"
2000,"2,432,348","111,311,078"
2001,"2,217,779","111,311,078"
2002,"2,592,545","111,311,078"
2003,"2,458,792","111,311,078"
2004,"2,677,342","111,311,078"
2005,"2,586,665","111,311,078"
2006,"2,567,350","111,311,078"
2007,"2,657,281","111,311,078"
2008,"2,690,154","111,311,078"
2009,"2,735,402","111,311,078"
2010,"2,665,972","111,311,078"
2011,"2,825,505","111,311,078"
2012,"2,973,607","111,311,078"
2013,"2,807,387","111,311,078"
2014,"3,189,696","111,311,078"
2015,"3,648,846","111,311,078"
2016,"4,295,127","111,311,078"
')
}

#Remove the commas from the numbers

zion$RecreationVisitors <- as.numeric(gsub(",","",zion$RecreationVisitors))
zion$RecreationVisitors <- zion$RecreationVisitors/10^6
tail(zion)

#EDA
#Plot the time series

plot(RecreationVisitors~Year,
     data=zion,type="b", 
     ylab = "Zion Annual Visitors (In millions)")
abline(v=2016,col="light blue")

#---Analysis---#

#Observe curvature in the time series plot which is indicative of a 
#multiplicative effect from year to year.

#Apply a log transformation so the multiplicative effect becomes additive.
#(in millions)
zion$lnvisitors <- log(zion$RecreationVisitors)

#confirm if relationship appears more additive
plot(lnvisitors~Year,
     data=zion,
     type="b", 
     ylab = "Zion Log Annual Visitors (In millions)")

#There are occurrences of non-constant mean changes from 1920 to 1950. Some possible causes for
#the curvature from 1920s to 1940s may be due to an increase in exposure, interest, and transportation. 
#The grand tour of America may be an explanation for the increase in these areas. 
#The dip seen from 1940-1950s roughly fits the time period of world war 2. 
#By filtering to the recent past, we notice a more additive model that suggests less if not any changes 
#in behavior or policy from year to year. 
#With this subsetted data, we can see a more constant mean change that reflects future Zion tourism demand.



#Take the recent additive curve of constant mean change from 1950-Present.
zion[zion$Year==1950,]
zion50 <- zion[-(1:31),]
head(zion50)
tail(zion50)

#plot to check for additive model
plot(lnvisitors~Year,
     data=zion50,
     type="b",
     ylab= "Zion Log Annual Visitors (In millions)")
#All looks well


#install.packages("devtools")
#devtools::install_github("nickpoison/astsa")
library("astsa", lib.loc="~/Library/R/3.4/library")





#Making Predictions





#Find Parameter values
zion50.out <- sarima(zion50$lnvisitors,1,1,1)
zion50.out
zion50.out$ttable[1:3,1]
#This shows the parameter estimates and the standard errors^
#ar1 is phi
#ar2 is epsilon
#ar3 is mu

# Compute predictions for the next 5 years by fitting in an ARIMA(1,1,1) and make a graph
zion50.future <- sarima.for(zion50$lnvisitors,n.ahead=5,1,1,1)
abline(v=67,col="blue")
zion50.future
#Gives us prediction and standard error, so compute 95% prediction intervals
t <- qnorm(0.975)
zion50.L <- zion50.future$pred - t* zion50.future$se
zion50.U <- zion50.future$pred + t* zion50.future$se

si <- data.frame(zion50.future$pred)

#un-transform the log data back to normal
zion50.yhat <- exp(zion50.future$pred)

#Graph of the unlogged ARIMA model
ZionVisitors <- exp(zion50$lnvisitors)

zion50.future <- sarima.for(ZionVisitors,
                           n.ahead=5,
                           1,1,1)
abline(v=67,col="blue")

zion50.yhat.L <- exp(zion50.L)
zion50.yhat.U <- exp(zion50.U)
data.frame(cbind("parameter" = zion50.yhat,"lower" = zion50.yhat.L,"upper" = zion50.yhat.U))
#This shows the parameter prediction values with 95% confidence intervals^



# Create a publication quality graphic 


plot(RecreationVisitors~Year,data=zion,type="o",
     ylab="Yearly Visitors (in millions)",
     xlim=c(1990,2021),
     ylim=c(1,6.7),
     main = "Zion National Park Annual Visitors")
lines(2017:2021,zion50.yhat.L,col="blue",lty=2)
lines(2017:2021,zion50.yhat.U,col="blue",lty=2)
polygon(c(2017:2021,rev(2017:2021)),c(zion50.yhat.L,rev(zion50.yhat.U)),
        col = "light gray", 
        border = NA)
lines(2017:2021,zion50.future$pred,col="red",type="b",pch=5)
lines(2017:2021,zion50.future$pred,col="red",type="b",pch=8)



#RESEARCH TASK AND DATA FEATURES THAT MATCH ANALYSIS STRENGTHS & WEAKNESSES

# Data features and Task Strengths
#This ARIMA(1,1,1) model is a very simple model that calulates moving averages and 
#changes them to become stationary. Also tries to remove signal from 
#noise and use it to predict the future. Doesn't give linear forecasts,
#and as this example is a time series, correlation is made by events in the past 
#which influence the future 5 years, so may help with making more accurate predictions.


#Weakness
#Forecasting is difficult because it depends on previous values. 
#If policies and behaviors change, then it is almost impossible to predict.
#If prediction is able to be made, it cannot make longer term predictions
#as it incorporates one previous time value before. Predicted values may be
#unreliable to forecast even further future values.

#-----Challenge!----

#Yosemite National Park is looking to forecast the traffic of visitors for the next 3 years
#Predict the annual number fof visitors to Yosemite National Park for the next 3 years

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
#Very similar to the zion data. Able to transform to make an additive model and performa analysis.

#---------