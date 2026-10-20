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
-- package org.allbinary.logic.communication.http

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
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

local AcceptableResponseGenerator = {}
AcceptableResponseGenerator.__index = AcceptableResponseGenerator
AcceptableResponseGenerator.className = "AcceptableResponseGenerator"

function AcceptableResponseGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function AcceptableResponseGenerator.getInstance()
        return AcceptableResponseGenerator.instance
end


function AcceptableResponseGenerator.new()
    local self = setmetatable({}, AcceptableResponseGenerator)
    self:_init_fields()
    return self
end


-- throws Exception
function AcceptableResponseGenerator:get(httpServletRequest)
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error = pcall(function()
            local acceptableResponseUtil = AcceptableResponseUtil.getInstance()
            local acceptable = httpServletRequest:getHeader("accept")
            local result = acceptableResponseUtil:getTagName(0)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTP) then
                self.logUtil:putF("Request Type: " .. acceptable, self, commonStrings.GET)
            end
            if acceptable ~= nil then
                local size = acceptableResponseUtil:size()
                for index = 0, size - 1 do
                    if ((acceptable < acceptableResponseUtil:get(index) and -1) or (acceptable > acceptableResponseUtil:get(index) and 1) or 0) == 0 then
                        result = acceptableResponseUtil:getTagName(index)
                    end
                end
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTP) then
                self.logUtil:putF("Response Type: " .. result, self, commonStrings.GET)
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET, e)
            end
            error(e, 0)
        end
end

AcceptableResponseGenerator.instance = AcceptableResponseGenerator.new()

return AcceptableResponseGenerator

