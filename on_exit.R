# copy this inside each function

cat(paste("\n function started:",match.call()[[1]],"\n ",Sys.time(),"\n"))
on.exit({
  cat(paste("\n function finished:",match.call()[[1]],"\n ",Sys.time(),"\n"))
})
