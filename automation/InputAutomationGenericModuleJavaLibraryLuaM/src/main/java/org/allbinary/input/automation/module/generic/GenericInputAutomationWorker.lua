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

-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local AbstractInputAutomationWorker = require("org.allbinary.input.automation.module.AbstractInputAutomationWorker")
local InputAutomationActionInterface = require("org.allbinary.input.automation.module.InputAutomationActionInterface")
local GenericProfile = require("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile")
local GenericProfileDataWorkerType = require("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfileDataWorkerType")
local GenericProfileAction = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction")
local GenericProfileActionScript = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScript")
local CapturedBufferedImagesCacheSingleton = require("org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local J2SECacheInterface = require("org.allbinary.logic.util.cache.J2SECacheInterface")
local ImageComparatorConstraintsInterface = require("org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface")
local ImageComparisonWorker = require("org.allbinary.media.image.comparison.ImageComparisonWorker")
local MotionRectangleConstraintsInterface = require("org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface")
local MotionRectanglesWorker = require("org.allbinary.media.image.comparison.motion.MotionRectanglesWorker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GenericInputAutomationWorker = {}
GenericInputAutomationWorker.__index = GenericInputAutomationWorker
GenericInputAutomationWorker.className = "GenericInputAutomationWorker"
setmetatable(GenericInputAutomationWorker, {__index = AbstractInputAutomationWorker})

function GenericInputAutomationWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.PROCESS_DATA_WORKER_RESULTS = "processDataWorkerResults"
    self.lastFrame = -1
    self.frame = nil
    self.genericProfile = nil
end


function GenericInputAutomationWorker.new(inputAutomationActionInterface, genericProfile, motionRectangleConstraintsInterface, imageComparatorConstraintsInterface)
    local self = setmetatable(AbstractInputAutomationWorker.new(inputAutomationActionInterface), GenericInputAutomationWorker)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:setCaptureWorker(GenericProfileCaptureWorkerFactory.getInstance(genericProfile))
        self:setInputAutomationActionInterface(inputAutomationActionInterface)
        self:setImageComparisonWorker(ImageComparisonWorker.new(imageComparatorConstraintsInterface))
        self:setMotionRectanglesWorker(MotionRectanglesWorker.new(motionRectangleConstraintsInterface))
        self:setGenericProfile(genericProfile)
        local vector = self:getGenericProfile():getGenericProfileDataWorkerTypeVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local genericProfileDataWorkerType = vector:get(index)
            self.logUtil:putF("Adding Listener: " .. tostring(genericProfileDataWorkerType), self, self.commonStrings.CONSTRUCTOR)
            if genericProfileDataWorkerType == GenericProfileDataWorkerType.COMPARISON then
                self:getCaptureWorker():addListenerInterface(self:getImageComparisonWorker())
            elseif genericProfileDataWorkerType == GenericProfileDataWorkerType.MOTION then
                self:getImageComparisonWorker():addListenerInterface(self:getMotionRectanglesWorker())
            end
        end
    return self
end


-- throws Exception
function GenericInputAutomationWorker:processDataWorkerResults()
        self.logUtil:putF(self.commonStrings.START, self, self.PROCESS_DATA_WORKER_RESULTS)
        self:waitForDataWorkers()
        local cacheInterface = CapturedBufferedImagesCacheSingleton.getInstance()
        local keyArray = cacheInterface:keySet():toArray()
        if (keyArray.n or #keyArray) > 0 then
            self.logUtil:putF("Image Available", self, self.PROCESS_DATA_WORKER_RESULTS)
            self:setFrame(keyArray[(keyArray.n or #keyArray) - 1 + 1])
            if self:getFrame() > self.lastFrame then
                self.logUtil:putF("Processing new frame: " .. tostring(self:getFrame()), self, self.PROCESS_DATA_WORKER_RESULTS)
                local hashMap = self:getGenericProfile():getGenericProfileActions():getHashMap()
                local set = hashMap:keySet()
                self.logUtil:putF("Processing " .. tostring(set:size()) .. "Actions", self, self.PROCESS_DATA_WORKER_RESULTS)
                local actionNameArray = set:toArray()
                local size = (actionNameArray.n or #actionNameArray)
                for index = 0, size - 1 do
                    local actionNameString = actionNameArray[index + 1]
                    self.logUtil:putF("Processing Action: " .. actionNameString, self, self.PROCESS_DATA_WORKER_RESULTS)
                    local genericProfileAction = hashMap:get(actionNameString)
                    local genericProfileActionScript = genericProfileAction:getGenericProfileActionScript()
                    local vector = genericProfileActionScript:getProfileActionConditionInterfaceVector()
                    CaptureWorkerUtil.processProfileActionConditions(vector, self:getFrame())
                end
                self.lastFrame = self:getFrame()
            end
        else
            self.logUtil:putF("Image Not Available", self, self.PROCESS_DATA_WORKER_RESULTS)
        end
end


-- throws Exception
function GenericInputAutomationWorker:process()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.PROCESS)
        self:startDataWorkers()
        self:processDataWorkerResults()
end


function GenericInputAutomationWorker:getGenericProfile()
        return self.genericProfile
end


function GenericInputAutomationWorker:setGenericProfile(genericProfile)
        self.genericProfile = genericProfile
end


function GenericInputAutomationWorker:getFrame()
        return self.frame
end


function GenericInputAutomationWorker:setFrame(frame)
        self.frame = frame
end

return GenericInputAutomationWorker

