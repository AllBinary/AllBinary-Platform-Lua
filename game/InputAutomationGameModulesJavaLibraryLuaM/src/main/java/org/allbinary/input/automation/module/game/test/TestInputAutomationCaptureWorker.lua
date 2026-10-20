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
-- package org.allbinary.input.automation.module.game.test

-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local AbstractInputAutomationWorker = require("org.allbinary.input.automation.module.AbstractInputAutomationWorker")
local InputAutomationActionInterface = require("org.allbinary.input.automation.module.InputAutomationActionInterface")
local GenericProfileAction = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileAction")
local GenericProfileActions = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.GenericProfileActions")
local GenericProfileActionScript = require("org.allbinary.input.automation.module.generic.configuration.profile.actions.script.GenericProfileActionScript")
local CapturedBufferedImagesCacheSingleton = require("org.allbinary.input.media.image.capture.CapturedBufferedImagesCacheSingleton")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local J2SECacheInterface = require("org.allbinary.logic.util.cache.J2SECacheInterface")
local ImageComparatorConstraintsInterface = require("org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface")
local MotionRectangleConstraintsInterface = require("org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TestInputAutomationCaptureWorker = {}
TestInputAutomationCaptureWorker.__index = TestInputAutomationCaptureWorker
TestInputAutomationCaptureWorker.className = "TestInputAutomationCaptureWorker"
setmetatable(TestInputAutomationCaptureWorker, {__index = AbstractInputAutomationWorker})

function TestInputAutomationCaptureWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.genericProfileActions = nil
    self.MESSAGE = "GenericInputAutomationCaptureWorker"
    self.PROCESS_DATA_WORKER_RESULTS = "processDataWorkerResults"
    self.IMAGE_AVAILABLE_SO_PROCESSING = "Image Available so processing"
    self.IMAGE_NOT_AVAILABLE = "Image Not Available"
end


function TestInputAutomationCaptureWorker.new(inputAutomationActionInterface, genericProfileActions, imageComparatorConstraintsInterface, motionRectangleConstraintsInterface)
    local self = setmetatable(AbstractInputAutomationWorker.new(inputAutomationActionInterface), TestInputAutomationCaptureWorker)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(self.MESSAGE, self, self.commonStrings.CONSTRUCTOR)
        self:setGenericProfileActions(genericProfileActions)
    return self
end


-- throws Exception
function TestInputAutomationCaptureWorker:processDataWorkerResults()
        local cacheInterface = CapturedBufferedImagesCacheSingleton.getInstance()
        if cacheInterface:keySet():size() > 0 then
            self.logUtil:putF(self.IMAGE_AVAILABLE_SO_PROCESSING, self, self.PROCESS_DATA_WORKER_RESULTS)
            local anyType = cacheInterface:keySet():toArray()[1]
            local hashMap = self:getGenericProfileActions():getHashMap()
            local set = hashMap:keySet()
            local actionNameArray = set:toArray()
            local size = (actionNameArray.n or #actionNameArray)
            for index = 0, size - 1 do
                local actionNameString = actionNameArray[index + 1]
                local genericProfileAction = hashMap:get(actionNameString)
                local genericProfileActionScript = genericProfileAction:getGenericProfileActionScript()
                local vector = genericProfileActionScript:getProfileActionConditionInterfaceVector()
            end
            cacheInterface:get(anyType)
        else
            self.logUtil:putF(self.IMAGE_NOT_AVAILABLE, self, self.PROCESS_DATA_WORKER_RESULTS)
        end
end


-- throws Exception
function TestInputAutomationCaptureWorker:process()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.PROCESS)
        self:startDataWorkers()
        self:processDataWorkerResults()
end


function TestInputAutomationCaptureWorker:getGenericProfileActions()
        return self.genericProfileActions
end


function TestInputAutomationCaptureWorker:setGenericProfileActions(genericProfileActions)
        self.genericProfileActions = genericProfileActions
end

return TestInputAutomationCaptureWorker

