FROM rocker/r-ver:4.2.2

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
  curl \
  elinks \
  git \
  hugo \
  libgdal-dev \
  libglpk-dev \
  libigraph-dev \
  libproj-dev \
  libudunits2-dev \
  r-cran-crosstalk \
  r-cran-htmltools \
  r-cran-lubridate \
  r-cran-rmarkdown \
  r-cran-testthat

RUN R -e "install.packages('dplyr')"
RUN R -e "install.packages('DT')"
RUN R -e "install.packages('readr')"
RUN R -e "install.packages('sf')"
RUN R -e "install.packages('tidyverse')"
RUN R -e "install.packages('viridis')"

RUN R -e "install.packages('leaflet')"
RUN R -e "install.packages('leaflet.extras')"
RUN R -e "install.packages('leaflet.extras2')"
RUN R -e "install.packages('osmdata')"

RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install('graph')"
RUN R -e "install.packages('ggm')"

RUN R -e "install.packages('remotes')"
RUN R -e "library(remotes); install_version('spatstat.core', '2.4-4')"
RUN R -e "library(remotes); install_version('osmplotr', '0.3.3')"

RUN R -e "install.packages('blogdown')"
RUN R -e "install.packages('patchwork')"
RUN R -e "install.packages('kableExtra')"
RUN R -e "install.packages('ggmap')"

RUN R -e "install.packages('rgdal')"
RUN R -e "install.packages('leaflegend')"

RUN mkdir ~/.R \
  && echo _R_CHECK_FORCE_SUGGESTS_=FALSE > ~/.R/check.Renviron \
  && cd /usr/local/bin \
  && ln -s /usr/lib/R/site-library/littler/examples/render.r .

CMD ["bash"]
