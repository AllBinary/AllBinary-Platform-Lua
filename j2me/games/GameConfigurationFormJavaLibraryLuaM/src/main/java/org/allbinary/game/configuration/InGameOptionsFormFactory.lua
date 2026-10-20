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
-- package org.allbinary.game.configuration

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local CommandForm = require("org.allbinary.graphics.displayable.screen.CommandForm")
local Init = require("org.allbinary.init.Init")
local NullUtil = require("org.allbinary.logic.NullUtil")
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

local InGameOptionsFormFactory = {}
InGameOptionsFormFactory.__index = InGameOptionsFormFactory
InGameOptionsFormFactory.className = "InGameOptionsFormFactory"

function InGameOptionsFormFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.SINGLETON = CommandForm.getNullCommandForm()
end

function InGameOptionsFormFactory.new()
    local self = setmetatable({}, InGameOptionsFormFactory)
    self:_init_fields()
    return self
end


function InGameOptionsFormFactory.getInstance()
        if InGameOptionsFormFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            InGameOptionsFormFactory.instance = InGameOptionsFormFactory.new()
        end
        return InGameOptionsFormFactory.instance
end


function InGameOptionsFormFactory:init(commandListener, initInterface, title, backgrounBasicColor, foregroundBasicColor)
        local try_ok, try_error = pcall(function()
            if self.SINGLETON == CommandForm.getNullCommandForm() then
                initInterface:init()
                self.SINGLETON = InGameOptionsForm.new(commandListener, title, backgrounBasicColor, foregroundBasicColor)
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.INIT, e)
        end
end


function InGameOptionsFormFactory:get()
        return self.SINGLETON
end

InGameOptionsFormFactory.instance = NullUtil.getInstance().NULL_OBJECT

return InGameOptionsFormFactory

