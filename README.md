# Safe Yelli in Bengaluru?

[Blog](https://blog.safeyelli.in) | [Twitter](https://twitter.com/SafeYelli/) | [Instagram](https://instagram.com/safeyelli) | [Email](mailto:safeyelli@gmail.com) | [GitHub](https://github.com/Safe-Yelli)

The code in this repository is what builds into the main [Safe Yelli site](https://safeyelli.in). 


## Overview

* [Rmarkdown](https://rmarkdown.rstudio.com/): The content on the site is written in Rmarkdown
* [Blogdown](https://bookdown.org/yihui/blogdown/): The `.rmd` files are built into the initial HTML using Blogdown
* [Netlify](https://netlify.com/): This GitHub repository is linked with a Netlify site that automatically builds and deploys the blogdown generated HTML onto the [Safe Yelli site](https://safeyelli.in)
* [GitHub Actions](https://github.com/features/actions): This GitHub repository has a GitHub Action workflow defined to periodically pull the latest reports from Google Sheets as a CSV and do the site build with blogdown.


## Flowchart

```mermaid

flowchart TB

    subgraph Reporting 
    Rep([Reporting User]) --> Net[(Netlify Forms)]
    Net -- Zapier ---> GSheets[(Google Sheets)]
    end

    subgraph Build
    GHA(GitHub Actions (custom Docker image)) --> GSheetsPull[Pull CSV from Google Sheets] 
    GSheetsPull --> Dock(Build site using blogdown::build_site) --> Commit[Update CSV and site changes in repository]
    Commit --> Netlify(Netlify Build and Deploy)
    end   

```
 

## Recreatable Framework

The tools used to create Safe Yelli are to be simple, fully featured services that can be quickly adapted for other use cases. 
- Static form powered by [Netlify](https://netlify.com) to collect and categorise reports. 
- Visualizing data onto a map, using the R programming language, and then generating a website using [Hugo](https://gohugo.io/), a static site generator.
- Zapier for linking Netlify Forms and Google Sheets.


## Future

- Alternative to Netlify Forms, to avoid depending on a service provided by a single vendor
  - Possibly use a webhook to directly push to Google Sheets
-  Google Sheets
  - Template for reusing with other use cases
  - Type checking and validation of data
  - Column configuration for building CSV with Rmarkdown
