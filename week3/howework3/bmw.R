library(dplyr)
Sys.setlocale("LC_CTYPE", "chs")

txtData = readLines("https://secure.bmw.com.cn/cn/_common/_js/dealer_locator/dealer_locator.json",encoding="UTF-8")
writeLines(txtData, "origin.txt", useBytes = T)
txtData = readLines("origin.txt", encoding="UTF-8")
txtData = paste(txtData, collapse = "")
txtData = strsplit(txtData,"var provinces=")
txtData = txtData[[1]][2]
txtData = strsplit(txtData,";var dealerCities=")

table1 = jsonlite::fromJSON(txtData[[1]][1])




txtData = txtData[[1]][2]
txtData = strsplit(txtData,";var branchTypes=")

table2 = jsonlite::fromJSON(txtData[[1]][1])



txtData = txtData[[1]][2]
txtData = strsplit(txtData,";var branches=")

table3 = jsonlite::fromJSON(txtData[[1]][1])



txtData = txtData[[1]][2]
txtData = strsplit(txtData,";var branchTypeMaps=")
table4 = jsonlite::fromJSON(txtData[[1]][1])

txtData = sub(";","",txtData[[1]][2])
table5 = jsonlite::fromJSON(txtData)

cityAmount = table4 %>% 
  group_by(ct) %>% 
  summarise(amount = n())

pasteService = function(x){
  return(paste(x,collapse=" "))
}
service =  table5 %>% 
  left_join(table3, by=c("tp"="id")) %>%
  group_by(br) %>% 
  summarise(service = pasteService(nz))


output = table4 %>% left_join(cityAmount, by="ct") %>%
  left_join(table2, by=c("ct"="id")) %>%
  left_join(table1, by=c("pv.x"="id")) %>%
  left_join(service, by=c("id"="br")) %>%
  select(city = nz.y,
         pvid = nz,
         shortName = dnz,
         fullName = nz.x,
         address = az,
         url = ws,
         lon = lnb,
         lat = ltb,
         service = service)
head(output)
