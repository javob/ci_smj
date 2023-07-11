
# Working directory
library(rstudioapi); setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
rm(list = ls())

library(KoboconnectR)

if (file.exists("estacionesDB.csv")) {file.remove("estacionesDB.csv")}
if (file.exists("medicionesDB.csv")) {file.remove("medicionesDB.csv")}

# Get data
estacionesDB <- kobo_df_download(
  url = "kf.kobotoolbox.org", uname = "javierbrolo", pwd = "Dreams4u1!",
  assetid = "a3Y6xW8265pJWXSUwX4qfK")

medicionesDB <- kobo_df_download(
  url = "kf.kobotoolbox.org", uname = "javierbrolo", pwd = "Dreams4u1!",
  assetid = "aRjyGaDFmeXMG3akSBvYzh")

write.csv(estacionesDB, file = "estacionesDB.csv")
write.csv(medicionesDB, file = "medicionesDB.csv")
