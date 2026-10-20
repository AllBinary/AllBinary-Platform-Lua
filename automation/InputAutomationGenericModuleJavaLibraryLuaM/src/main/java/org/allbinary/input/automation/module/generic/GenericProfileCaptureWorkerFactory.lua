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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local GenericProfile = require("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile")
local GenericProfileDataWorkerType = require("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType")
local SavedCaptureGenericProfileDataWorkerType = require("org.allbinary.input.automation.module.generic.configuration.profile.SavedCaptureGenericProfileDataWorkerType")
local CaptureWorkerInterface = require("org.allbinary.input.media.image.capture.CaptureWorkerInterface")
local ScreenCaptureImagesWorker = require("org.allbinary.input.media.image.capture.ScreenCaptureImagesWorker")

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

local GenericProfileCaptureWorkerFactory = {}
GenericProfileCaptureWorkerFactory.__index = GenericProfileCaptureWorkerFactory
GenericProfileCaptureWorkerFactory.className = "GenericProfileCaptureWorkerFactory"


function GenericProfileCaptureWorkerFactory.new()
    local self = setmetatable({}, GenericProfileCaptureWorkerFactory)
    return self
end


-- throws Exception
function GenericProfileCaptureWorkerFactory.getInstance(genericProfile)
        local vector = genericProfile:getGenericProfileDataWorkerTypeVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local genericProfileDataWorkerType = vector:get(index)
            if genericProfileDataWorkerType == GenericProfileDataWorkerType.SCREEN_CAPTURE then
                return ScreenCaptureImagesWorker.new()
            elseif genericProfileDataWorkerType == GenericProfileDataWorkerType.SAVED_CAPTURE then
                return SavedCaptureImagesWorker.new(genericProfileDataWorkerType)
            end
        end
        error(java_exception("Exception", "No CaptureWorkerInterface specified in GenericProfile"), 0)
end

return GenericProfileCaptureWorkerFactory

