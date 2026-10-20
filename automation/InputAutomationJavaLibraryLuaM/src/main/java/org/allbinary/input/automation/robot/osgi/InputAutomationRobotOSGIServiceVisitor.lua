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
-- package org.allbinary.input.automation.robot.osgi

local InputAutomationRobotServiceInterface = require("bundle.input.automation.robot.InputAutomationRobotServiceInterface")
local InputRobotFactory = require("org.allbinary.input.automation.robot.InputRobotFactory")
local InputRobotInterface = require("org.allbinary.input.automation.robot.InputRobotInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local OSGIServiceInterface = require("org.allbinary.osgi.OSGIServiceInterface")
local OSGIServiceVisitorInterface = require("org.allbinary.osgi.OSGIServiceVisitorInterface")
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

local InputAutomationRobotOSGIServiceVisitor = {}
InputAutomationRobotOSGIServiceVisitor.__index = InputAutomationRobotOSGIServiceVisitor
InputAutomationRobotOSGIServiceVisitor.className = "InputAutomationRobotOSGIServiceVisitor"

function InputAutomationRobotOSGIServiceVisitor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function InputAutomationRobotOSGIServiceVisitor.new()
    local self = setmetatable({}, InputAutomationRobotOSGIServiceVisitor)
    self:_init_fields()
    return self
end


function InputAutomationRobotOSGIServiceVisitor:visit(anyType)
        return self:visit(anyType)
end


-- Java overloaded method: Lua keeps the last definition
function InputAutomationRobotOSGIServiceVisitor:visit(osgiServiceInterface)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "visit")
            local inputAutomationRobotServiceInterface = osgiServiceInterface
            local inputRobotInterfaceArray = inputAutomationRobotServiceInterface:getInputRobotInterfaceArray()
            for index = 0, (inputRobotInterfaceArray.n or #inputRobotInterfaceArray) - 1 do
                self.logUtil:putF("Adding: " .. inputRobotInterfaceArray[index + 1]:getName(), self, "visit")
                InputRobotFactory.getInstance():add(inputRobotInterfaceArray[index + 1])
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "visit", e)
            return false
        end
end

return InputAutomationRobotOSGIServiceVisitor

