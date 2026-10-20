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
-- package org.allbinary.graphics.j2me

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StatusFactory = {}
StatusFactory.__index = StatusFactory
StatusFactory.className = "StatusFactory"

function StatusFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.SETSTATUS = "setStatus"
    self.STATUS_LABEL = "Status: "
end

function StatusFactory.new()
    local self = setmetatable({}, StatusFactory)
    self:_init_fields()
    return self
end


function StatusFactory.getInstance()
        return StatusFactory.instance
end


function StatusFactory:setStatusNoLog(status)
        MyFrame.statusJLabel:setText(status)
end


function StatusFactory:setStatus(status)
        self:setStatusNoLog(status)
        self.logUtil:putF(self.STATUS_LABEL .. status, self, self.SETSTATUS)
end

StatusFactory.instance = StatusFactory.new()

return StatusFactory

