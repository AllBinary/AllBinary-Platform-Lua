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
-- package org.allbinary.game.layer.resources

local GameConfigurationCentral = require("org.allbinary.game.configuration.GameConfigurationCentral")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
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

local BasicGameResources = {}
BasicGameResources.__index = BasicGameResources
BasicGameResources.className = "BasicGameResources"

function BasicGameResources:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.RESOURCE = StringUtil.getInstance().EMPTY_STRING
    self.RESOURCE_DESTROY = StringUtil.getInstance().EMPTY_STRING
end


function BasicGameResources.new()
    local self = setmetatable({}, BasicGameResources)
    self:_init_fields()
    return self
end


function BasicGameResources:init(ROOT, SIZE)
        local try_ok, try_error = pcall(function()
            local scale = math.tointeger(GameConfigurationCentral.getInstance().SCALE:getValue() // 1)
            if scale > 1 and scale - 1 < (SIZE.n or #SIZE) then
                self:append(ROOT, SIZE[scale - 1 + 1])
            else
                error(java_exception("Exception", tostring(StringMaker.new():append("Invalid Value: "):appendint(scale))), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.INIT, e)
        end
end


-- throws Exception
function BasicGameResources:append(ROOT, sizeString)
        local DESTROY = "_destroy"
        local string = self:getString()
        BasicGameResources.stringBuffer:delete(0, BasicGameResources.stringBuffer:length())
        BasicGameResources.stringBuffer:append(ROOT)
        BasicGameResources.stringBuffer:append(string)
        BasicGameResources.stringBuffer:append(sizeString)
        self.RESOURCE = tostring(BasicGameResources.stringBuffer)
        BasicGameResources.stringBuffer:delete(0, BasicGameResources.stringBuffer:length())
        BasicGameResources.stringBuffer:append(ROOT)
        BasicGameResources.stringBuffer:append(DESTROY)
        BasicGameResources.stringBuffer:append(string)
        BasicGameResources.stringBuffer:append(sizeString)
        self.RESOURCE_DESTROY = tostring(BasicGameResources.stringBuffer)
end


-- throws Exception
function BasicGameResources:getString()
        return GameGraphicsResourceUtil.getInstance():getName()
end

BasicGameResources.stringBuffer = StringMaker.new()

return BasicGameResources

