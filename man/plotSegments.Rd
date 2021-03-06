% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotSegments.R
\name{plotSegments}
\alias{plotSegments}
\title{plot (families of) line segments.}
\usage{
plotSegments(segment, segPar = list(col = par("fg"), lty = par("lty"), lwd =
  par("lwd")), add = FALSE, win = NULL, wincol = par("fg"),
  winlty = par("lty"), ...)
}
\arguments{
\item{segment}{is a list of groups (maybe just one) of line segments(x0=x0,y0=y0,x1=x1,y1=y1). See =?segments for "x0", "y0", "x1" and "y1".
"x0" and "y0" coordinates of points from which to draw.
"x1" and "y1" coordinates of points to which to draw}

\item{segPar}{is a list of vectors (1D arrays) with segment graphical parameters.}

\item{add}{are the segments to be added to the current plot?}

\item{win}{a window}

\item{wincol}{window color}

\item{winlty}{window line type}

\item{...}{further arguments passed to "plot.default"}
}
\value{
a plot.
}
\description{
Plot line segments.
}
\details{
Number of (maybe but not mandatory) different colors. It must equal the number of groups of line segments
If other line segments or points are to be plotted over, the "points.default" and "segments" functions after this plot are useful. See examples.
plot.default is the equivalent to this function for plotting points
This function can be useful to plot several groups of line segments in different colors
This funciton can be useful to plot a subset of line segments over the set of all the segments (in different color)
}
\examples{
## Example 1
x0<-c(1,-3,4); y0<-c(5,-4,-2)
x1<-c(1,-3,5); y1<-c(2,0,4)
plotSegments(
  segment = data.frame(x0, y0, x1, y1),
  segPar = list(col = "blue", lty = 1, lwd = 5),
  main = "Segments")
points.default( (x0+x1)/2, (y0+y1)/2, pch=20, cex=3) # adding the midpoints to the current plot
# if the line segemets have a property, it can be distinguished with the width or with a color or with both as in the next code line:
segments(x0,y0,x1,y1, col=c("green","red","blue"), lwd=c(1,4,8))
segments(-4,-3,5,0) # adding other line segment from (-4,-3) to (5,0)

## Example 1A. Use Example 1 instead. Kept for backward compatibility
x0<-c(1,-3,4); y0<-c(5,-4,-2)
x1<-c(1,-3,5); y1<-c(2,0,4)
plotSegments(
  segment=list( g1= list(x0 = x0, y0 = y0, x1 = x1, y1 = y1 )),
  segPar=list(col = "blue", lty = 3, lwd = 5),
  main="Segments")

## Example 1B. Attribute
x0<-c(1,-3,4); y0<-c(5,-4,-2)
x1<-c(1,-3,5); y1<-c(2,0,4)
plotSegments(
  segment=data.frame(x0, y0, x1, y1),
  segPar=list(col = "blue", lty = 1, lwd =  list(a=c(1,5,10))),
  main="Segments")

## Example 2A: Plot of a subgroup.
plotSegments(
  segment=list(
    All=list( # Note that the complete set of line segments must be supplied first to let the subgroup be over it.
      x0 = c(1,-3,4,-5,8), y0 = c(5,-4,-2,6,-7),
      x1 = c(1,-3,5,0,3), y1 = c(2,0,4,6,-7)),
    g1=list(
      x0 = c(1,-3,4), y0 = c(5,-4,-2),
      x1 = c(1,-3,5), y1 = c(2,0,4))
  ),
  segPar=list(col =c("grey70","black"), lty = 1, lwd = c(5,1)), # segments plot edit
  main="Segments")

## Example 2B: Plot of subgroups with different attributes
# You can color every segment with a different color, line type or line width in order to highligth one
# or more covariates (as fracture apperture and/or permeability)
plotSegments(
  segment=list(
    All=list( # Note that the complete set of line segments must be supplied first to let the subgroup be over it.
      x0 = c(1,-3,4,-5,8), y0 = c(5,-4,-2,6,-7),
      x1 = c(1,-3,5,0,3), y1 = c(2,0,4,6,-7)),
    g1=list(
      x0 = c(1,-3,4), y0 = c(5,-4,-2),
      x1 = c(1,-3,5), y1 = c(2,0,4))
  ),
  segPar=list(col =list(a=heat.colors(5), b=c("lightblue","green","black")), lty = 1, lwd = c(5,1)),
  main="Segments")

## Example 3: Plot of different sets of line segments
plotSegments(
  segment=list(
    g1=list(x0=c(-3,5),y0=c(2,-6),x1=c(5,10),y1=c(7,-4)),
    g2=list(x0=c(0,-9),y0=c(-2,-7),x1=c(3,-8),y1=c(5,4)),
    g3=list(x0=c(-1,0),y0=c(3,0),x1=c(5,-3),y1=c(7,3))
  ),
  segPar=list(col = c("blue","orange","grey"), lty = 1, lwd = 5),
  main="Segments")
## Example 4: It also works for named data.frame objects
x0<-c(-3,5); y0<-c(2,-6)
x1<-c(5,10); y1<-c(7,-4)
G1 <- data.frame(x0,y0,x1,y1)
G2<-0.3*G1
plotSegments(
  segment=list( G1= G1,G2=G2),
  segPar=list(col = c("blue","grey"), lty = 1, lwd = 2),
  main="Segments")
points.default(G1$x0,G1$y0, col="blue", cex=2) # ploting end points of group 1 (G1)

}
\author{
Francisco Mendoza-Torres (\email{mentofran@gmail.com})
}
