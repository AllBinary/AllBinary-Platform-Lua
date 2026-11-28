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
-- package org.allbinary.input.automation.module.generic

local GenericProfileCaptureWorkerFactory = {}
package.loaded["org.allbinary.input.automation.module.generic.GenericProfileCaptureWorkerFactory"] = GenericProfileCaptureWorkerFactory

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local GenericProfile = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile")
local GenericProfileDataWorkerType = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType")
local SavedCaptureGenericProfileDataWorkerType = java_lazy("org.allbinary.input.automation.module.generic.configuration.profile.SavedCaptureGenericProfileDataWorkerType")
local CaptureWorkerInterface = java_lazy("org.allbinary.input.media.image.capture.CaptureWorkerInterface")
local ScreenCaptureImagesWorker = java_lazy("org.allbinary.input.media.image.capture.ScreenCaptureImagesWorker")
local SavedCaptureImagesWorker = java_lazy("org.allbinary.input.automation.module.generic.SavedCaptureImagesWorker")

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

-- class table GenericProfileCaptureWorkerFactory is declared before the requires
GenericProfileCaptureWorkerFactory.__index = GenericProfileCaptureWorkerFactory
GenericProfileCaptureWorkerFactory.className = "GenericProfileCaptureWorkerFactory"
GenericProfileCaptureWorkerFactory.javaClassName = "org.allbinary.input.automation.module.generic.GenericProfileCaptureWorkerFactory"


function GenericProfileCaptureWorkerFactory._jinit(self)
    return self
end

function GenericProfileCaptureWorkerFactory.new(...)
    local self = setmetatable({}, GenericProfileCaptureWorkerFactory)
    GenericProfileCaptureWorkerFactory._jinit(self, ...)
    return self
end


-- throws Exception
function GenericProfileCaptureWorkerFactory.getInstance(genericProfile)
        local vector = genericProfile:getGenericProfileDataWorkerTypeVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local genericProfileDataWorkerType = vector:get(index)
            if rawequal(genericProfileDataWorkerType, GenericProfileDataWorkerType.SCREEN_CAPTURE) then
                return ScreenCaptureImagesWorker.new()
            elseif rawequal(genericProfileDataWorkerType, GenericProfileDataWorkerType.SAVED_CAPTURE) then
                return SavedCaptureImagesWorker.new(genericProfileDataWorkerType)
            end
        end
        error(require("java.lang.Exception").new("No CaptureWorkerInterface specified in GenericProfile"), 0)
end

return GenericProfileCaptureWorkerFactory

