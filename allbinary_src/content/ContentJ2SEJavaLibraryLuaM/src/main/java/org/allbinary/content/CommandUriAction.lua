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
-- package org.allbinary.content

-- local Command = require("javax.microedition.lcdui.Command")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CommandUriAction = {}
CommandUriAction.__index = CommandUriAction
CommandUriAction.className = "CommandUriAction"

function CommandUriAction:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.hashtable = StdUtil.getInstance():createHashtable()
end

function CommandUriAction.new()
    local self = setmetatable({}, CommandUriAction)
    self:_init_fields()
    return self
end


function CommandUriAction.getInstance()
        return CommandUriAction.instance
end


function CommandUriAction:add(command, url)
        self.hashtable:put(command, url)
end


function CommandUriAction:process(command)
        local try_ok, try_error = pcall(function()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
        end
end


function CommandUriAction:getIntent(command)
        local url = self.hashtable:get(command)
        return self.intent
end

CommandUriAction.instance = CommandUriAction.new()

return CommandUriAction

