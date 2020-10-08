FROM rapporteket/rap-dev-data:nodata

LABEL maintainer "Are Edvardsen <are.edvardsen@helse-nord.no>"

# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libxml2-dev \
    libssl-dev \
    libmariadbclient-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# basic R functionality
RUN R -e "install.packages(c('remotes'), repos='https://cloud.r-project.org/')"

# install package dependencies
RUN R -e "install.packages(c('covr', 'dplyr', 'kableExtra', 'knitr', 'lintr', 'magrittr', 'revealjs', 'shiny', 'shinyalert', 'shinycssloaders', 'testthat'))"

RUN R -e "remotes::install_github(c('Rapporteket/rapbase@*release', 'Rapporteket/raplog@*release'))"
