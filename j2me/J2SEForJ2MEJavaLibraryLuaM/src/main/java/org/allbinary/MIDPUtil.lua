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
-- package org.allbinary

-- local IOException = require("java.io.IOException")
-- local InputStream = require("java.io.InputStream")
-- local Form = require("javax.microedition.lcdui.Form")
-- local Image = require("javax.microedition.lcdui.Image")
-- local Item = require("javax.microedition.lcdui.Item")
-- local Manager = require("javax.microedition.media.Manager")
-- local MediaException = require("javax.microedition.media.MediaException")
-- local Player = require("javax.microedition.media.Player")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--like microemu-playn, so the languages without overloading can be generated. The J2ME version uses the MIDP overloads.
local MIDPUtil = {}
MIDPUtil.__index = MIDPUtil
MIDPUtil.className = "MIDPUtil"

function MIDPUtil.new()
    local self = setmetatable({}, MIDPUtil)
    return self
end


function MIDPUtil.getInstance()
        return MIDPUtil.instance
end


function MIDPUtil:createImageWH(width, height)
        return Image.createImageWH(width, height)
end


function MIDPUtil:createImageFromByteArray(imageData, imageOffset, imageLength)
        return Image.createImageFromByteArray(imageData, imageOffset, imageLength)
end


-- throws IOException
function MIDPUtil:createImageFromInputStream(inputStream)
        return Image.createImageFromInputStream(inputStream)
end


-- throws IOException, MediaException
function MIDPUtil:createPlayerFromInputStream(inputStream, type)
        return Manager.createPlayerFromInputStream(inputStream, type)
end


function MIDPUtil:appendItem(form, item)
        return form:appendItem(item)
end

MIDPUtil.instance = MIDPUtil.new()

return MIDPUtil

