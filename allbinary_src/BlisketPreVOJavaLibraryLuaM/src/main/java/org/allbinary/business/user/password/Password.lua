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
-- package org.allbinary.business.user.password

-- local HashMap = require("java.util.HashMap")
-- local Random = require("java.util.Random")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserData = require("org.allbinary.business.user.UserData")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SuperCrypt = require("org.allbinary.logic.control.crypt.SuperCrypt")
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

local Password = {}
Password.__index = Password
Password.className = "Password"

function Password:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.password = nil
end


function Password.new(password)
    local self = setmetatable({}, Password)
    self:_init_fields()
        self.password = password
    return self
end


function Password:set(value)
        self.password = value
end


function Password:get()
        return self.password
end


function Password:isValid()
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error = pcall(function()
            local valid = true
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VALIDATION) then
                self.logUtil:putF("Password: " .. self.password, self, commonStrings.IS_VALID)
            end
            if not StringValidationUtil.getInstance():isValidRequired(self.password, 6, UserData.MAXLEN) then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VALIDATION) then
                    self.logUtil:putF("Password is invalid", self, commonStrings.IS_VALID)
                end
                valid = false
            end
            return valid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VALIDATIONERROR) then
                self.logUtil:put("Failed to validate form", "Password", commonStrings.IS_VALID, e)
            end
            return false
        end
end


function Password:getValidationInfo()
        if not StringValidationUtil.getInstance():isValidRequired(self.password, 6, UserData.MAXLEN) then
            return "Please enter a Password with more than 6 characters.<br />"
        end
        local stringUtil = StringUtil.getInstance()
        return stringUtil.EMPTY_STRING
end


function Password:toVector(secret)
        self.password = StringUtil.getInstance():getNonNull(self.password)
        local random = Random.new():nextInt(SuperCrypt.KEYMAX)
        local vector = BasicArrayListD.new()
        vector:add(tostring(random))
        vector:add(secret)
        vector:add(SuperCrypt.new(random):encrypt(self.password))
        return vector
end


function Password:toHashMap(secret)
        self.password = StringUtil.getInstance():getNonNull(self.password)
        local values = StdUtil.getInstance():createHashMap()
        local random = Random.new():nextInt(SuperCrypt.KEYMAX)
        values:put(EntryData.getInstance().ENCRYPTION, tostring(random))
        values:put(UserData.SECRET, secret)
        values:put(UserData.PASSWORD, SuperCrypt.new(random):encrypt(self.password))
        return values
end

return Password

