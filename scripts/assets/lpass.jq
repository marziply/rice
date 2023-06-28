def getpw:
  .user //
  if .url == "http://sn" then
    "gpg"
  else
    "password"
  end;

.table | map(setpath(["user"]; getpw))
