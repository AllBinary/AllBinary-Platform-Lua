-- Generated Code Do Not Modify
-- package org.allbinary.media.image

local SwtOpenGLESImageBridge = {}
package.loaded["org.allbinary.media.image.SwtOpenGLESImageBridge"] = SwtOpenGLESImageBridge

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

local Image = java_lazy("javax.microedition.lcdui.Image")
local OpenGLUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLUtil")
local OpenGLESImage = java_lazy("org.allbinary.image.opengles.OpenGLESImage")
local OpenGLESImageExclusionUtil = java_lazy("org.allbinary.image.opengles.OpenGLESImageExclusionUtil")

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

-- Shares image operations between the SWT and OpenGL implementations. 
-- class table SwtOpenGLESImageBridge is declared before the requires
SwtOpenGLESImageBridge.__index = SwtOpenGLESImageBridge
SwtOpenGLESImageBridge.className = "SwtOpenGLESImageBridge"
SwtOpenGLESImageBridge.javaClassName = "org.allbinary.media.image.SwtOpenGLESImageBridge"


function SwtOpenGLESImageBridge._jinit(self)
    return self
end

function SwtOpenGLESImageBridge.new(...)
    local self = setmetatable({}, SwtOpenGLESImageBridge)
    SwtOpenGLESImageBridge._jinit(self, ...)
    return self
end


function SwtOpenGLESImageBridge.addImage(util, image)
        return util:addImage(image)
end


function SwtOpenGLESImageBridge.isCustomScaling(util, image)
        return util:isCustomScaling(image)
end


function SwtOpenGLESImageBridge.getOpenGLESImage(image)
        return image
end


function SwtOpenGLESImageBridge.getBitmapImage(image)
        return image.openGLBitmap:getImage()
end


function SwtOpenGLESImageBridge.asImage(image)
        return image
end

return SwtOpenGLESImageBridge

