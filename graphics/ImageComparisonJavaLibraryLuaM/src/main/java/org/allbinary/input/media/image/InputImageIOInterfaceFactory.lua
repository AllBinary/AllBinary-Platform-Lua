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
-- package org.allbinary.input.media.image

local InputImageIOInterfaceFactory = {}
package.loaded["org.allbinary.input.media.image.InputImageIOInterfaceFactory"] = InputImageIOInterfaceFactory

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

local CapturedImageInputOutput = java_lazy("org.allbinary.input.media.image.capture.CapturedImageInputOutput")
local ComparisonImageInputOutput = java_lazy("org.allbinary.media.image.comparison.ComparisonImageInputOutput")
local MotionRectanglesImageInputOutput = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectanglesImageInputOutput")
local ImageIOInterface = java_lazy("org.allbinary.media.image.io.ImageIOInterface")
local InputImageType = java_lazy("org.allbinary.input.media.image.InputImageType")

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

-- class table InputImageIOInterfaceFactory is declared before the requires
InputImageIOInterfaceFactory.__index = InputImageIOInterfaceFactory
InputImageIOInterfaceFactory.className = "InputImageIOInterfaceFactory"
InputImageIOInterfaceFactory.javaClassName = "org.allbinary.input.media.image.InputImageIOInterfaceFactory"


function InputImageIOInterfaceFactory._jinit(self)
    return self
end

function InputImageIOInterfaceFactory.new(...)
    local self = setmetatable({}, InputImageIOInterfaceFactory)
    InputImageIOInterfaceFactory._jinit(self, ...)
    return self
end


-- throws Exception
function InputImageIOInterfaceFactory.getInstance(imageType)
        if rawequal(imageType, InputImageType.CAPTURE) then
            return CapturedImageInputOutput.new()
        elseif rawequal(imageType, InputImageType.COMPARISON) then
            return ComparisonImageInputOutput.new()
        elseif rawequal(imageType, InputImageType.MOTION) then
            return MotionRectanglesImageInputOutput.new()
        else
            error(require("java.lang.Exception").new(require("allbinary_java").to_string("No ImageIOInterface for: ") .. require("allbinary_java").to_string(tostring(imageType))), 0)
        end
end

return InputImageIOInterfaceFactory

