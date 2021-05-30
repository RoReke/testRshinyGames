reportUi <- function(id) {
  downloadButton(NS(id,"report"),"Descargar Reporte")
  }

reportServer <- function(id,df) {
  moduleServer(id, function(input, output, session) {
    
    output$report <- downloadHandler(
      filename = function() {
        'reporte.pdf'
      },
      
      content = function(file) {
        src <- normalizePath('report.Rmd')
        owd <- setwd(tempdir())
        on.exit(setwd(owd))
        file.copy(src, 'report.Rmd', overwrite = TRUE)
        
        library(rmarkdown)
        out <- render('report.Rmd',
                      pdf_document()
        )
        file.rename(out, file)
      }
    )
  
  })
}

