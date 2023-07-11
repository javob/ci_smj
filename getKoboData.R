
# Working directory
library(rstudioapi); setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
rm(list = ls())

# Libraries
library(KoboconnectR)
library(git2r)

# Run in R-Studio Terminal
# git config --global http.followRedirects true

# Delete previous files 
if (file.exists("estacionesDB.csv")) {file.remove("estacionesDB.csv")}
if (file.exists("medicionesDB.csv")) {file.remove("medicionesDB.csv")}

# Get data
estacionesDB <- kobo_df_download(
  url = "kf.kobotoolbox.org", uname = "javierbrolo", pwd = "Dreams4u1!",
  assetid = "a3Y6xW8265pJWXSUwX4qfK")

medicionesDB <- kobo_df_download(
  url = "kf.kobotoolbox.org", uname = "javierbrolo", pwd = "Dreams4u1!",
  assetid = "aRjyGaDFmeXMG3akSBvYzh")

# Save files
write.csv(estacionesDB, file = "estacionesDB.csv")
write.csv(medicionesDB, file = "medicionesDB.csv")

# Open local repository
repo <- repository(".")

# Stage changes
add(repo, "*")

# Commit changes
commit(repo, "Update CSV files")

# Push changes to online repository
push(repo, "origin", "main")





# Stage changes
system("git add *")

# Commit changes
system('git commit -m "Update CSV files"')

# Push changes to online repository
system("git push origin main")  # Use the appropriate names for your remote and branch














