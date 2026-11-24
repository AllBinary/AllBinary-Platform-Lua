-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.media.image

local ImageSwtUtil = {}
package.loaded["org.allbinary.media.image.ImageSwtUtil"] = ImageSwtUtil

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

local Color = java_lazy("org.eclipse.swt.graphics.Color")
local RGB = java_lazy("org.eclipse.swt.graphics.RGB")
local BareMain = java_lazy("org.microemu.app.BareMain")

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

-- class table ImageSwtUtil is declared before the requires
ImageSwtUtil.__index = ImageSwtUtil
ImageSwtUtil.className = "ImageSwtUtil"
ImageSwtUtil.javaClassName = "org.allbinary.media.image.ImageSwtUtil"

function ImageSwtUtil._jinit(self)
    return self
end

function ImageSwtUtil.new()
    return ImageSwtUtil._jinit(setmetatable({}, ImageSwtUtil))
end


function ImageSwtUtil.getInstance()
        return ImageSwtUtil.instance_f
end

ImageSwtUtil.instance_f = ImageSwtUtil.new()

return ImageSwtUtil

