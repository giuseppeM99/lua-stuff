-- Original author https://bitbucket.org/simbiose/lua-mimetypes
local io = require('io')
local string = require('string')

local len, format, match, gmatch, rep, popen, lines, open =
  string.len, string.format, string.match, string.gmatch, string.rep, io.popen, io.lines, io.open

local apache_mimetypes_url = "http://svn.apache.org/repos/asf/httpd/httpd/trunk/docs/conf/mime.types"

local function exec(command)
  local cmd = popen(command, 'r')
  cmd:read('*all')
  return cmd:close()
end

if not exec(format("curl %s --silent -o _tmp_ && sed '/^#/d' <_tmp_ >> mimetypes && rm _tmp_", apache_mimetypes_url)) then
  error('fail to get mimetypes')
end

print('processing mimetypes file')

local mime_types = {}

for line in lines('./mimetypes') do
  local _type, extensions = match(line, '([^%s]+)%s*([^$]+)')
  for extension in gmatch(extensions, '%s*([^%s]+)%s*') do
    mime_types[extension] = _type
  end
end

if not exec('rm mimetypes') then
  error('fail to remove mimetypes')
end

local mime = open('mimetype.lua', 'w')
mime:write('local mimetype = {}\n\n')
mime:write('local types = {\n')
for extension, _type in pairs(mime_types) do
  mime:write(format("  ['%s'] = '%s',\n", _type,  extension))
end
mime:write('}\n')
mime:write([[
-- Returns the common file extension from a content-type
function mimetype.get_mime_extension(content_type)
  return types[content_type]
end

-- Returns the mimetype and subtype
function mimetype.get_content_type(extension)
  for k,v in pairs(types) do
    if v == extension then
      return k
    end
  end
end

-- Returns the mimetype without the subtype
function mimetype.get_content_type_no_sub(extension)
  for k,v in pairs(types) do
    if v == extension then
      -- Before /
      return k:match('([%w-]+)/')
    end
  end
end

return mimetype
]])

if not mime:close() then
  error('fail to compile mimetypes')
end


print('done')
