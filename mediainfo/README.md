# MEDIAINFO PARSER
## A simple script that parse mediainfo-cli file infos

This script was made for [Madeline_Lua_TG](https://github.com/giuseppeM99/madeline_lua_shim)

###Requirements
To run this script you need
- Lua
- mediainfo-cli
- some files
- a code

###Usage
The module return just a function: the mediainfo's function
Prototype:
  mediainfo(file)

Parameters:
  file: the path of the file to analize

Returns:
  MediaInfo Object

MediaInfo Object:
  * Attribues:
    - info : raw mediainfo string
  * Methods:
    - getDuration : return the duration of the file (audio/video)
    - getTitle : return the title of the song/film/whatever
    - getPerformer : return the Performer of the song
    - getWidth : return the width of the image/video
    - getHeight : return the height of the image/video
    - getMimeType : return the mime type

###Example
```
local mediainfo = require 'mediainfo' -- or loadfile or whatever you use
local fileInfo = mediainfo('tardis.png') -- load the infos of the file `tardis.png`
print("Type: " .. fileInfo:getMimeType() .. "\nWidth: " .. fileInfo:getWidth() .. "\nHeight: ".. fileInfo:getHeight())
-- Will print the infos of the file tardis.png, and i don't wanna load it so try yourself
```


NOTE:
* Inspired by [PWRTelegram](https://github.com/pwrtelegram/pwrtelegram)
* This script was born from an insane midnight test with [MadelineProto](https://github.com/danog/MadelineProto) and the Lua module
* Better regex win
* Daniil is <3
