--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.media.image.filter

-- local File = require("java.io.File")
-- local FileFilter = require("javax.swing.filechooser.FileFilter")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--TWB - replace with file visitor version
local ImageFileFilter = {}
ImageFileFilter.__index = ImageFileFilter
ImageFileFilter.className = "ImageFileFilter"
setmetatable(ImageFileFilter, {__index = FileFilter})

function ImageFileFilter.new()
    local self = setmetatable(FileFilter.new(), ImageFileFilter)
    return self
end


function ImageFileFilter:accept(f)
        if f:isDirectory() then
            return true
        end
        local s = f:getName()
        local i = s:lastIndexOf(".")
        if i > 0 and i < #s - 1 then
            local ext = string.lower(string.sub(s, (i + 1) + 1))
            if (ext == "jpg") or (ext == "jpeg") then
                return true
            end
        end
        return false
end


function ImageFileFilter:getDescription()
        return "Accepts .jpg and .jpeg files"
end

return ImageFileFilter

