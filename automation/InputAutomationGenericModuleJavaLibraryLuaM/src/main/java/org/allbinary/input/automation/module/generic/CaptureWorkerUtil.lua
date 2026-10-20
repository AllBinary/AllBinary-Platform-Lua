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
local ProfileActionScriptConditionInterface = require("org.allbinary.input.automation.actions.script.condition.ProfileActionScriptConditionInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CaptureWorkerUtil = {}
CaptureWorkerUtil.__index = CaptureWorkerUtil
CaptureWorkerUtil.className = "CaptureWorkerUtil"

function CaptureWorkerUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function CaptureWorkerUtil.new()
    local self = setmetatable({}, CaptureWorkerUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function CaptureWorkerUtil.processProfileActionConditions(vector, frame)
        local logUtil = LogUtil.getInstance()
        local commonStrings = CommonStrings.getInstance()
        logUtil:putF(commonStrings.START, "CaptureWorkerUtil", "processProfileActionConditions")
        local size = vector:size()
        for index = 0, size - 1 do
            local profileActionConditionInterface = vector:get(index)
            if profileActionConditionInterface:shouldProcess(frame) then
                profileActionConditionInterface:process(frame)
            else
            end
        end
end

return CaptureWorkerUtil

