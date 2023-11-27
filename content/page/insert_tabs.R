

add_tabs <- function(tab_names, tab_content, id = sample(1:10000, 1)) {
  
  text_out <- c(paste0('<ul class="nav nav-pills" id="myTab', id, '" role="tablist" style="margin-top: 18px;">\n'))
  
  tab_codes <- tolower(gsub(" ", "", tab_names))
  
  for(i in 1:length(tab_names)) {
    
    new_text <- paste0(ifelse(i == 1, '<li class="nav-item active">', '<li class="nav-item">'),
                       '<a class="nav-link" id="', paste0(tab_codes[[i]], id),
                       '-tab" data-toggle="tab" href="#', paste0(tab_codes[[i]], id),
                       '" role="tab" aria-controls="', paste0(tab_codes[[i]], id),
                       ifelse(i == 1, '" aria-selected="true">', '" aria-selected="false">'),
                       tab_names[[i]],
                       '</a></li>\n')
    
    text_out <- paste0(text_out, new_text)
  }
  
  text_out <- paste0(text_out,
                     '</ul>\n<div class="well tab-content" id="myTabContent" style="background-color: white;">\n\n')
  
  for(i in 1:length(tab_names)) {
    
    new_text <- paste0(ifelse(i == 1, '\n<div class="tab-pane fade active in" id="', '<div class="tab-pane fade" id="'),
                       paste0(tab_codes[[i]], id),
                       '" role="tabpanel" aria-labelledby="', paste0(tab_codes[[i]], id), '-tab">\n\n',
                       tab_content[[i]], '\n\n</div>\n'
    )
    
    text_out <- paste0(text_out, new_text)
  }
  
  
  text_out <- paste0(text_out, '\n</div>')
  
  text_out <- readLines(textConnection(text_out))
  
  # Sub in <code> for backticks ```
  code_starts <- grep("code_start", text_out)
  
  text_out[code_starts] <- '<pre class="sourceCode r">'
  
  code_ends <- grep("code_end", text_out)
  
  text_out[code_ends] <- '</pre>'
  
  return(text_out)
  
}
