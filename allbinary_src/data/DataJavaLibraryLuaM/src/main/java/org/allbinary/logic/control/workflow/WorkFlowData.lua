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
-- package org.allbinary.logic.control.workflow


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WorkFlowData = {}
WorkFlowData.__index = WorkFlowData
WorkFlowData.className = "WorkFlowData"

function WorkFlowData:_init_fields()
    self.WORKFLOWS = "WORKFLOWS"
    self.WORKFLOW = "WORKFLOW"
    self.NAME = "WORKFLOW_NAME"
    self.DATA = "WORKFLOW_DATA"
end


function WorkFlowData.getInstance()
        return WorkFlowData.instance
end


function WorkFlowData.new()
    local self = setmetatable({}, WorkFlowData)
    self:_init_fields()
    return self
end

WorkFlowData.instance = WorkFlowData.new()

return WorkFlowData

