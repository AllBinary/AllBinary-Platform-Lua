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
-- package org.allbinary.business.user.username

-- local HashMap = require("java.util.HashMap")
local UserData = require("org.allbinary.business.user.UserData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
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

local UserName = {}
UserName.__index = UserName
UserName.className = "UserName"

function UserName:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.userName = nil
end

function UserName.new(...)
    local count = select("#", ...)
    if count == 0 then return UserName._new0(...)
    elseif count == 1 then return UserName._new1(...)
    end
end


function UserName.getInstance()
        return UserName.instance
end


function UserName._new0()
    local self = setmetatable({}, UserName)
    self:_init_fields()
    return self
end


function UserName._new1(hashMap)
    local self = setmetatable({}, UserName)
    self:_init_fields()
        self.userName = hashMap:get(UserData.USERNAME)
    return self
end


function UserName:isValid()
        local try_ok, try_error = pcall(function()
            return self:isValid(self.userName)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate form", self, "isUserNameValid()", e)
            end
            return false
        end
end


function UserName:get()
        return self.userName
end


-- Java overloaded method: Lua keeps the last definition
function UserName:isValid(aUserName)
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error = pcall(function()
            local booleanFactory = BooleanFactory.getInstance()
            local valid = booleanFactory.TRUE
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VALIDATION) then
                self.logUtil:putF("UserName: " .. aUserName, self, commonStrings.IS_VALID)
            end
            if not StringValidationUtil.getInstance():isValidRequired(aUserName, 5, UserData.MAXLEN) then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VALIDATION) then
                    self.logUtil:putF("UserName is invalid", self, commonStrings.IS_VALID)
                end
                valid = booleanFactory.FALSE
            end
            return valid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate form", self, commonStrings.IS_VALID, e)
            end
            return false
        end
end


function UserName.getValidationInfo(aUserName)
        if not StringValidationUtil.getInstance():isValidRequired(aUserName, 5, UserData.MAXLEN) then
            return "Please enter a User Name with more than 5 characters.<br/>"
        end
        return StringUtil.getInstance().EMPTY_STRING
end

UserName.instance = UserName.new()

return UserName

