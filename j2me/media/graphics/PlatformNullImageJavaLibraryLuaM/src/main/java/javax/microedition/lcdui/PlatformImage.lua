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
-- package javax.microedition.lcdui

local PlatformImage = {}
package.loaded["javax.microedition.lcdui.PlatformImage"] = PlatformImage

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

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local Image = java_lazy("javax.microedition.lcdui.Image")
local NullImage = java_lazy("javax.microedition.lcdui.NullImage")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

--PlatformNullImageJavaLibrary
-- class table PlatformImage is declared before the requires
PlatformImage.__index = PlatformImage
PlatformImage.className = "PlatformImage"
PlatformImage.javaClassName = "javax.microedition.lcdui.PlatformImage"

function PlatformImage._jinit(self)
    return self
end

function PlatformImage.new()
    return PlatformImage._jinit(setmetatable({}, PlatformImage))
end


function PlatformImage:getImage(graphicsSurface2)
        return NullImage.NULL_IMAGE
end


function PlatformImage:getSurfaceWidth(graphicsSurface2, width)
        return width
end


function PlatformImage:getSurfaceHeight(graphicsSurface2, height)
        return height
end


function PlatformImage:getWidth(image, width)
        return width
end


function PlatformImage:getHeight(image, height)
        return height
end


function PlatformImage:getGraphics(graphicsSurface, width, height, image)
        error(require("java.lang.RuntimeException").new(), 0)
end


function PlatformImage:drawImage(image, x, y, anchor, g2, g)
end


function PlatformImage:drawRegion(image, x_src, y_src, width, height, transform, x_dst, y_dst, anchor, g)
end


function PlatformImage:getRGB(argb, offset, scanlength, x, y, width, height, image)
end


function PlatformImage:setRGB(argb, offset, scanlength, x, y, width, height, image)
end


function PlatformImage:getData(image)
        return NullUtil.getInstance().NULL_INT_ARRAY
end

return PlatformImage

