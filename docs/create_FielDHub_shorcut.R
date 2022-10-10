cdir <- choose.dir()

dir.create(paste0(cdir, '/FielDHub_exe'))

cdir <- paste0(cdir, '/FielDHub_exe')

setwd(cdir)

writeLines( c("@echo off",
              paste0('start /min "Running FielDHub" "',
                     paste0(R.home(), '/bin/Rscript'),
                     '" -e "library(FielDHub) ; run_app() ; quit(save = FALSE)" ')),
            con = paste0( file.path(cdir, '/FielDHub.bat' ) ) )

download.file(url = 'https://raw.githubusercontent.com/DidierMurilloF/FielDHub/master/inst/app/www/favicon.ico',
              destfile = paste0(cdir, '/icon.ico'), mode = 'wb')

download.file(url = 'https://raw.githubusercontent.com/AparicioJohan/Starting_MrBean/main/docs/link.vbs',
              destfile = paste0(cdir, '/link.vbs'), mode = 'wb')

shell( '.\\link.vbs .\\FielDHub.lnk .\\FielDHub.bat .\\icon.ico' )

file.remove(paste0(cdir, '/link.vbs'))
