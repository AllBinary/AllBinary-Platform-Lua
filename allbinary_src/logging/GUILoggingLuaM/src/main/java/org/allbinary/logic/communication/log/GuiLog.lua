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
-- package org.allbinary.logic.communication.log

-- local awt = require("java.awt")
-- local swing = require("javax.swing")
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

local GuiLog = {}
GuiLog.__index = GuiLog
GuiLog.className = "GuiLog"

function GuiLog:_init_fields()
    self.logFormatUtil = LogFormatUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function GuiLog.getInstance()
        return GuiLog.instance
end


function GuiLog.new()
    local self = setmetatable({}, GuiLog)
    self:_init_fields()
    return self
end


function GuiLog:showDialog(msg)
        local error = JDialog.new()
        local size = #msg * 9
        local x = size
        if x > 550 then
            x = 550
        end
        error:getContentPane():setLayout(GridLayout.new(1, 1))
        if size > 255 then
            local y = 550
            error:setSize(x, y)
            error:getContentPane():add(JScrollPane.new(JTextArea.new(msg)))
        elseif size > 0 then
            local y = 50
            error:setSize(x, y)
            error:getContentPane():add(JScrollPane.new(JLabel.new(msg)))
        end
        error:show()
end


function GuiLog:put(specialMessage, anyType, functionName)
        return self:put(specialMessage, anyType, functionName, nil)
end


-- Java overloaded method: Lua keeps the last definition
function GuiLog:put(specialMessage, anyType, functionName, exception)
        local try_ok, try_error = pcall(function()
            local data = self.logFormatUtil:get(specialMessage, getmetatable(anyType).className, functionName, exception)
            self:showDialog(data)
            print(data)
            return data
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, "put", e)
            return "Logging Error"
        end
end


-- Java overloaded method: Lua keeps the last definition
function GuiLog:put(specialMessage, className, functionName)
        return self:put(specialMessage, className, functionName, nil)
end


-- Java overloaded method: Lua keeps the last definition
function GuiLog:put(specialMessage, className, functionName, exception)
        local try_ok, try_error = pcall(function()
            local data = self.logFormatUtil:get(specialMessage, className, functionName, exception)
            self:showDialog(data)
            print(data)
            return data
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, "put", e)
            return "Logging Error"
        end
end

GuiLog.instance = GuiLog.new()

return GuiLog

