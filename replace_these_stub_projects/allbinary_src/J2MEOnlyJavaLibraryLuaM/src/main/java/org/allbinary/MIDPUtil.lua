--
-- AllBinary Open License Version 1
-- Copyright (c) 2026 AllBinary
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

local MIDPUtil = {}
package.loaded["org.allbinary.MIDPUtil"] = MIDPUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--like microemu-playn, so the languages without overloading can be generated. J2ME uses the MIDP overloads.
-- class table MIDPUtil is declared before the requires
MIDPUtil.__index = MIDPUtil
MIDPUtil.className = "MIDPUtil"
MIDPUtil.javaClassName = "org.allbinary.MIDPUtil"

function MIDPUtil._jinit(self)
    return self
end

function MIDPUtil.new()
    return MIDPUtil._jinit(setmetatable({}, MIDPUtil))
end


function MIDPUtil.getInstance()
        return MIDPUtil.instance_f
end


function MIDPUtil:createImageWH(width, height)
        return Image.createImage(width, height)
end


function MIDPUtil:createImageFromByteArray(imageData, imageOffset, imageLength)
        return Image.createImage(imageData, imageOffset, imageLength)
end


-- throws IOException
function MIDPUtil:createImageFromInputStream(inputStream)
        return Image.createImage(inputStream)
end


-- throws IOException, MediaException
function MIDPUtil:createPlayerFromInputStream(inputStream, type)
        return Manager.createPlayer(inputStream, type)
end


function MIDPUtil:appendItem(form, item)
        return form:append(item)
end

MIDPUtil.instance_f = MIDPUtil.new()

return MIDPUtil

