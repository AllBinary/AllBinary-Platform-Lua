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

local NullUtil = require("org.allbinary.logic.NullUtil")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--PlatformNullImageJavaLibrary
local PlatformImage = {}
PlatformImage.__index = PlatformImage
PlatformImage.className = "PlatformImage"

function PlatformImage.new()
    local self = setmetatable({}, PlatformImage)
    return self
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
        error(java_exception("RuntimeException"), 0)
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

