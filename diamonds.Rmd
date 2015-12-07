

library(ggplot2);

data(diamonds);
help(diamonds);
dim(diamonds);
names(diamonds);
head(diamonds);
rm(diamonds)

diamonds <- diamonds[sample(1:nrow(diamonds),1000,replace=F),]

# qplot() or ggplot() can be used
# qplot() comes with some default values
qplot(data=diamonds, x=carat, y=price, color=color, geom="point");

# ggplot() provides more control than qplot()
# ggplot() gives basic plot. Layers should be added. No default values
ggplot(data=diamonds, aes(x=carat, y=price)) + 
      geom_point(aes(color=color))


# returns the previously closed plot 
last_plot();

# save the plot as a jpeg or png or bmp file
ggsave("diamonds.tiff", height=5, width=5);


#--------------------------------------------------------------------------
ggplot(data=diamonds, aes(x=carat, y=price)) + 
      geom_point(aes(color=color, size=carat))

ggplot(data=diamonds, aes(x=carat, y=price)) + 
      geom_point(aes(color=color, shape=cut))

# Factes for subsetting the data:  formula: row variables ~ column variables

g <- ggplot(data=diamonds, aes(x=carat, y=price));
g <- g + geom_point(aes(color=color))

# columnwise subsets
g + facet_grid(.~cut)

# rowwise subsets
g + facet_grid(cut~.)

# rowwise and columnwise subsets
g + facet_grid(cut~clarity)
g + facet_grid(cut~clarity, labeller=label_both)


g + facet_wrap(~cut)
g + facet_wrap(~clarity)

# Labels
g + ggtitle("Diamonds")
g + ggtitle("Diamonds") + xlab("Carat Size") + ylab("Price in $")

# Themes
g + theme_bw();
g + theme_classic();
g + theme_grey();         # default
g + theme_minimal();

# Legends
g + theme(legend.position="left")



# -----------------------------------------------------------
# with iris data
g <- ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width)) +
    geom_point(aes(color=Species))
g


g + geom_point(aes(color=Species, size=Petal.Width))

g + geom_point(aes(color=Species, shape=Species))

# columnwise subsets
g + facet_grid(.~Species)

# columnwise subsets
g + facet_grid(Species~.)

# columnwise subsets
g + facet_grid(Species~.)

# rowwise, columnwise subsets
g + facet_grid(Species~Species)

g + facet_wrap(~Species)

#-------------------------------------

     






















