#### NOTE: you will have to rebuild the package to make a local file visible ####

linkout = function(fileName) {
  theFile = system.file(
  package="T15lumpsplit",
  'T15lumpsplit/', fileName)
  theCommand = paste0(
    "browseURL('", theFile, "')")
  eval(parse(text=theCommand))
#  "system('open ", theFile, "')")
}

linkoutLink = function(fileName, linkouttext) {
  # For opening a file in the package
  thisNumber = nextNumber(sequenceType = "linkoutLink")
  IdThisLinkout = paste0('linkoutLink', thisNumber)
  observeEvent(input[[IdThisLinkout]], linkout(fileName)
  )
  actionLink(IdThisLinkout,
             label=HTML(
               paste0('<font color=blue>', linkouttext, '</font>'))
  )
}


# NOTE: for local anchors, the name is prepended with 'section-'
# at the target, but not at the clickbait.
linkinLink = function(anchorName, linktext) {
  # For going to a local anchor
  thisNumber = nextNumber(sequenceType = "linkinLink")
  IdThisLinkin = paste0('linkinLink', thisNumber)

  onclickAction = paste0(
    "savedYposition=window.scrollY; ",
    "Shiny.onInputChange('savedYposition',
    savedYposition);",

    "currentLocationId='", IdThisLinkin, "';
    Shiny.onInputChange('currentLocationId',
    currentLocationId);"
    )
  labelString = HTML(
    paste0('<font color=blue style="text-decoration: underline">',
           linktext,
           '</font>'))
  a(id=IdThisLinkin,
    onclick=onclickAction,
                   href=paste0('#section-',
                               anchorName),
                   labelString)
}

#From session help:
#url_protocol, url_hostname, url_port, url_pathname, url_search,
#url_hash_initial and url_hash can be used to get the components of the URL that
#was requested by the browser to load the Shiny app page. These values are from
#the browser's perspective, so neither HTTP proxies nor Shiny Server will affect
#these values. The url_search value may be used with parseQueryString to access
#query string parameters.

