cdir <- choose.dir()

dir.create(paste0(cdir, '/MrBean_exe'))

cdir <- paste0(cdir, '/MrBean_exe')

setwd(cdir)

writeLines( c("@echo off",
              paste0('start /min "Running MrBean" "',
                     paste0(R.home(), '/bin/Rscript'),
                     '" -e "library(MrBean) ; run_app() ; quit(save = FALSE)" ')),
            con = paste0( file.path(cdir, '/MrBean.bat' ) ) )

download.file(url = 'https://raw.githubusercontent.com/AparicioJohan/Starting_MrBean/main/images/icon.ico',
              destfile = paste0(cdir, '/icon.ico'), mode = 'wb')

download.file(url = 'https://raw.githubusercontent.com/AparicioJohan/Starting_MrBean/main/docs/link.vbs',
              destfile = paste0(cdir, '/link.vbs'), mode = 'wb')

shell( '.\\link.vbs .\\MrBean.lnk .\\MrBean.bat .\\icon.ico' )

file.remove('link.vbs')
