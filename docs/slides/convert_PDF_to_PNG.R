
# convert the charts from tikz (a pdf)
# into single `png`s, one per page


library(magick)
library(pdftools)


path <- "tikz_charts/jmp.pdf"

nr_pages <-  pdftools::pdf_info(path)$pages  

for (i in seq_along(1:nr_pages)) {
    
    file_name <- paste0("images/jmp/tikz_", LETTERS[i], ".png")

    image_read_pdf(path, pages = i) %>% 
        image_trim() %>%
        image_convert("png") %>% 
        image_crop("2550x2350") %>% 
        image_transparent("white") %>% 
        image_write(path = file_name, format = "png")
    

}



