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
-- package org.allbinary.input.automation.module.generic.configuration.profile

local InputImageType = require("org.allbinary.input.media.image.InputImageType")
local GenericProfileDataWorkerType = require("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SavedCaptureGenericProfileDataWorkerType = {}
SavedCaptureGenericProfileDataWorkerType.__index = SavedCaptureGenericProfileDataWorkerType
SavedCaptureGenericProfileDataWorkerType.className = "SavedCaptureGenericProfileDataWorkerType"
setmetatable(SavedCaptureGenericProfileDataWorkerType, {__index = GenericProfileDataWorkerType})

function SavedCaptureGenericProfileDataWorkerType:_init_fields()
    self.path = nil
    self.lastFrame = 0
end


function SavedCaptureGenericProfileDataWorkerType.new(name, path, lastFrame)
    local self = setmetatable(GenericProfileDataWorkerType.new(name), SavedCaptureGenericProfileDataWorkerType)
    self:_init_fields()
        -- super(...) made self above
        self:setPath(path)
        self:setLastFrame(lastFrame)
    return self
end


function SavedCaptureGenericProfileDataWorkerType:getPath()
        return self.path
end


function SavedCaptureGenericProfileDataWorkerType:setPath(path)
        self.path = path
end


function SavedCaptureGenericProfileDataWorkerType:getLastFrame()
        return self.lastFrame
end


function SavedCaptureGenericProfileDataWorkerType:setLastFrame(lastFrame)
        self.lastFrame = lastFrame
end

SavedCaptureGenericProfileDataWorkerType.SAVED_CAPTURE = SavedCaptureGenericProfileDataWorkerType.new("Saved " .. InputImageType.CAPTURE:getName(), "c:\\share\\captures\\2\\", 100)

return SavedCaptureGenericProfileDataWorkerType

