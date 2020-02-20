library(devtools)   
install_github("ahmohamed/lipidr")
library(lipidr)
use_interactive_graphics(interactive = TRUE)

mydf <- read.csv("C:/Users/baolongsu/Desktop/Scripts/R/lipidr/20200108BenChris_Exp1_BMDM TLR panel 24h_lipidr.csv", 
                 header = TRUE, row.names = 1)
a <- mydf
#names(a) <- as.character(unlist(a[1,]))
#a<-a[-1,]
#names(a)<-paste(names(a),1:24)


a <- log(a)

mylip <- as_lipidomics_experiment(a, logged = TRUE, normalized = TRUE)

mylip<-add_sample_annotation(mylip, "C:/Users/baolongsu/Desktop/Scripts/R/lipidr/annot.csv")


mymva <- mva(mylip, measure = "Area", method = c("PCA"), group_col = "Group", groups = NULL)

#use_interactive_graphics(interactive = TRUE)

plot_mva(mymva, color_by = "Group")


plot_lipidclass(mylip)

myderesult <- de_analysis(mylip,  TLR2-NT, measure = "Area")

plot_results_volcano(myderesult, show.labels = TRUE)

















```{r warning=FALSE, message=FALSE, echo=FALSE}
library(lipidr)
use_interactive_graphics(interactive = TRUE)

mydf <- read.csv("C:/Users/baolongsu/Desktop/Scripts/R/lipidr/20200108BenChris_Exp1_BMDM TLR panel 24h_lipidr.csv", 
                 header = TRUE, row.names = 1)
a <- mydf

a <- log(a)

mylip <- as_lipidomics_experiment(a, logged = TRUE, normalized = TRUE)

mylip<-add_sample_annotation(mylip, "C:/Users/baolongsu/Desktop/Scripts/R/lipidr/annot.csv")

myderesult <- de_analysis(mylip,  TLR3-NT, measure = "Area")

plot_results_volcano(myderesult, show.labels = TRUE)
```