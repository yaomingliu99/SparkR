#https://edumine.wordpress.com/2015/06/18/working-with-apache-sparkr-1-4-0-in-rstudio/

#http://sbartek.github.io/sparkRInstall/installSparkReasyWay.html

jsonlite::fromJSON("https://api.github.com/repos/apache/spark/tags")$name

#Installing of SparkR

rm(list=ls())

if (!require('devtools')) install.packages('devtools')
devtools::install_github('apache/spark@v2.2.0', subdir='R/pkg')

Sys.setenv(SPARK_HOME='C:/Spark')
.libPaths(c(file.path(Sys.getenv('SPARK_HOME'), 'R', 'lib'), .libPaths()))

.libPaths()

library(SparkR)


sparkR.session.stop()
#sparkR.session()

sparkR.init()

sparkRSQL.init()

sc<-sparkR.init(master="local")
sqlContest<-sparkRSQL.init(sc)


sc<-sparkR.session(master="local")

df<-as.DataFrame(faithful)

df

head(select(df, df$eruptions))
head(select(df,"eruptions"))

head(filter(df,df$waiting<50))

head(summarize(groupBy(df, df$waiting), count = n(df$waiting)))

waiting_counts<-summarize(groupBy(df,df$waiting), count=n(df$waiting))
head(arrange(waiting_counts, desc(waiting_counts$count)))

df$waiting_secs<-df$waiting *60
head(df)


