# GSOC2018DOC
Major Update for Huge and SAM

## Background

In high-dimensional sparse learning problem, some recent studies have demonstrated the computational superiority of second-order methods over the traditional first-order methods.

In this project, we propose to apply efficient second-order proximal Newton solvers to high-dimensional sparse learning domain. Specifically, we will focus on high-dimensional undirected graphical model estimation and nonparametric regression models with functional penalty.


Currently, the undirected graphical model packages are also lack of inference module. An inference module containing the model significance (p-value). We propose to develop an efficient unbiased inference module for our solver. In particular, we consider the problems of testing the presence of a single edge and constructing a uniform confidence subgraph.

For nonparametric regression models, the current solver is based on proximal gradient method, which is not efficient. We expect a proximal newton method with blockwise coordinate descent could accelerate the algorithm.  Furthermore, we aim to incorporate the current with functional penalties which enjoys great statistical properties.

The new solvers and new modules will be integrated into two existing popular packages: *HUGE* and *SAM*


## Related work

R packages for solving sparse graphical model estimation using first-order methods are usually computationally inefficient. For example, the *glasso* package [1] is based on blockwise coordinate descent, which is not able to directly scale efficiently for high dimensional problems. The state-of-the-art package *QUIC* [2] is a second-order algorithms, which perform empirically better. However, it did not exploit the sparse structure. Inspired by the package *PICASSO* [3] of solving sparse generalized linear model, we aim to find a more efficient active set based Newton-type algorithms for solving this problem. In terms of inference on high-dimensional  graphical model, [4] propose a unified framework to quantify local and global inferential uncertainty for high dimensional nonparanormal graphical models. We aim to develop unbiased inference module by incorporating projection operator with the framework in [4].

Similarly, for nonparametric regression and classification models, current work, *SAM* [5] is only based on the proximal gradient method. We expect a Newton-type algorithm can also accelerate the computation. Furthermore, we aim to provide functional penalties to the current package [6] to enrich the functionality.

## Details of your coding project

The student developer will first do code refactoring. The code of the core part should be implemneted by C/C++ and under the support of *Eigen* library. At the same time extansive benchmarking code should be written to ensure the correctness thoughout the development. Next student will implement an efficient proximal Newton solver with novel active set updating strategies in R for a class of sparse learning problems, including sparse undirected graphical model estimation (*Huge*), and nonparametric regression and classification model with functional penalty (*SAM*). We aim to improve the performance of existing solvers in terms of CPU time and estimation accuracy on real and synthetic datasets. Then an unbiased statistical inference module will be implemented for *Huge*. Detailed documentation describing the algorithm and its theoretical properties will be provided in the vignettes.

## Expected impact

*Huge*(>161k downloads)  and *SAM* (>13k downloads) are popular R package for sparse learning. With the delivered solvers and function module, these two packages that can solve a wide class of sparse learning problems under the same algorithmic framework and achieve state-of-the-art performance on each individual problem in terms of CPU time and estimation error. Updated *Huge* will also be the first R package that provides inference module for sparse graphical model.


## Mentors

Students, please contact mentors below after completing at least one
of the tests below.

- Primary mentor:  
Tuo Zhao, Assistant Professor in School of Industrial and Systems Engineering at Georgia Institute of Technology.    
Email: tourzhao@gatech.edu   
Website: www2.isye.gatech.edu/~tzhao80/  
GSOC experience: 2011-2013 as student; 2014-2017 as mentor

- Secondary mentor
Xingguo Li, Postdoctoral Researcher, in the Department of Computer Science, Princeton University.  
Email: lixx1661@umn.edu  
Website: www.tc.umn.edu/~lixx1661/  
GSOC experience: 2014-2016 as student; 2017 as mentor

Both mentors are the original developer of *SAM* and *Huge*

## Tests

Students, please do one or more of the following tests before
contacting the mentors above.

- Easy: Download *Huge* and *SAM*. Test them on a synythetic data set respectively.
- Medium: Add pairwise correlation between columns in the dataset and check how the different solvers perform with highly correlated feature columns.
- Hard: Since the core code should be implemented by C/C++. Write a simple package implementing Matrix multiplication. The main code should use C/C++.

## Solutions of tests

Students, please post a link to your test results here.
