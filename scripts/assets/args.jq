def arg:
  if type == "array" then
    . | join(",")
  else
    .
  end;

.[] | "-\($v) \(arg)"
