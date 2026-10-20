-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.game.ag.layer.hud.basic

local BasicHudFactory = require("org.allbinary.game.graphics.hud.BasicHudFactory")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NumberStringHudFactory = {}
NumberStringHudFactory.__index = NumberStringHudFactory
NumberStringHudFactory.className = "NumberStringHudFactory"

function NumberStringHudFactory:_init_fields()
    self.NULL_NUMBER_STRING_HUD = self:createHud()
end

function NumberStringHudFactory.new()
    local self = setmetatable({}, NumberStringHudFactory)
    self:_init_fields()
    return self
end


function NumberStringHudFactory.getInstance()
        if NumberStringHudFactory.instance == NullUtil.getInstance() then
            NumberStringHudFactory.instance = NumberStringHudFactory.new()
        end
        return NumberStringHudFactory.instance
end


function NumberStringHudFactory:createHud()
        local try_ok, try_error = pcall(function()
            return NumberStringHud.new(StringUtil.getInstance().EMPTY_STRING, 9, BasicHudFactory.getInstance().ABSOLUTE, 1, 0, BasicColorFactory.getInstance().NULL_COLOR)
        end)
        if not try_ok then
            local e = try_error
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
            error(java_exception("RuntimeException"), 0)
        end
end

NumberStringHudFactory.instance = NullUtil.getInstance()

return NumberStringHudFactory

