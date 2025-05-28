function Meta(meta)
    if meta.date then
      local date = pandoc.utils.stringify(meta.date)
      local y, m, d = date:match("(%d+)%-(%d+)%-(%d+)")
      local months = {
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
      }
      if y and m and d then
        meta.date = months[tonumber(m)] .. " " .. tonumber(d) .. ", " .. y
      end
    end
    return meta
  end