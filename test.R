
library(huge)
library(SAM)

##################HUGE#########################
# Easy test
library(huge) # Load the package huge
L = huge.generator(n=200,d=200,graph="hub") # Generate data with hub structures
X = L$data; X.pow = X^3/sqrt(15) # Power Transformation
X.npn = huge.npn(X.pow) # Nonparanormal
out.mb = huge(X.pow,nlambda=30) # Estimate the solution path
out.npn = huge(X.npn,nlambda=30)
huge.roc(out.mb$path,L$theta) # Plot the ROC curve
huge.roc(out.npn$path,L$theta)
mb.stars = huge.select(out.mb,criterion="stars", stars.thresh=0.05) # Select the graph using StARS
plot(mb.stars)
npn.stars = huge.select(out.npn,criterion="stars",stars.thresh=0.05)
plot(npn.stars)
mb.ric = huge.select(out.mb) # Select the graph using RIC
plot(mb.ric)
npn.ric = huge.select(out.npn)
plot(npn.ric)

#Medium Test
#Dense
L = huge.generator(n=200,d=200,graph="random",prob=0.8) # Generate data 
X = L$data; X.pow = X^3/sqrt(15) # Power Transformation
X.npn = huge.npn(X.pow) # Nonparanormal
out.mb = huge(X.pow,nlambda=30) # Estimate the solution path
out.npn = huge(X.npn,nlambda=30)
huge.roc(out.mb$path,L$theta) # Plot the ROC curve
huge.roc(out.npn$path,L$theta)
mb.stars = huge.select(out.mb,criterion="stars", stars.thresh=0.05) # Select the graph using StARS
plot(mb.stars)
npn.stars = huge.select(out.npn,criterion="stars",stars.thresh=0.05)
plot(npn.stars)
mb.ric = huge.select(out.mb) # Select the graph using RIC
plot(mb.ric)
npn.ric = huge.select(out.npn)
plot(npn.ric)
#Sparse
L = huge.generator(n=200,d=200,graph="random",prob=0.1) # Generate data 
X = L$data; X.pow = X^3/sqrt(15) # Power Transformation
X.npn = huge.npn(X.pow) # Nonparanormal
out.mb = huge(X.pow,nlambda=30) # Estimate the solution path
out.npn = huge(X.npn,nlambda=30)
huge.roc(out.mb$path,L$theta) # Plot the ROC curve
huge.roc(out.npn$path,L$theta)
mb.stars = huge.select(out.mb,criterion="stars", stars.thresh=0.05) # Select the graph using StARS
plot(mb.stars)
npn.stars = huge.select(out.npn,criterion="stars",stars.thresh=0.05)
plot(npn.stars)
mb.ric = huge.select(out.mb) # Select the graph using RIC
plot(mb.ric)
npn.ric = huge.select(out.npn)
plot(npn.ric)

##################SAM#########################
#Easy Test
## generating training data
n = 200
d = 100
X = 0.5*matrix(runif(n*d),n,d)
y = sign(((X[,1]-0.5)^2 + (X[,2]-0.5)^2)-0.06)
## flipping about 5 percent of y
y = y*sign(runif(n)-0.05)
y = sign(y==1)
## Training
out.trn = samLL(X,y)
out.trn
## plotting solution path
plot(out.trn)
## generating testing data
nt = 1000
Xt = 0.5*matrix(runif(nt*d),nt,d)
yt = sign(((Xt[,1]-0.5)^2 + (Xt[,2]-0.5)^2)-0.06)
## flipping about 5 percent of y
yt = yt*sign(runif(nt)-0.05)
yt = sign(yt==1)
## predicting response
out.tst = predict(out.trn,Xt)

#Median Test
## generating training data
n = 200
d = 100
X = 0.5*matrix(runif(n*d),n,d) + matrix(rep(0.5*runif(n),d),n,d)
y = sign(((X[,1]-0.5)^2 + (X[,2]-0.5)^2)-0.06)
## flipping about 5 percent of y
y = y*sign(runif(n)-0.05)
y = sign(y==1)
## Training
out.trn = samLL(X,y)
out.trn
## plotting solution path
plot(out.trn)
## generating testing data
nt = 1000
Xt = 0.5*matrix(runif(nt*d),nt,d) + matrix(rep(0.5*runif(nt),d),nt,d)
yt = sign(((Xt[,1]-0.5)^2 + (Xt[,2]-0.5)^2)-0.06)
## flipping about 5 percent of y
yt = yt*sign(runif(nt)-0.05)
yt = sign(yt==1)
## predicting response
out.tst = predict(out.trn,Xt)