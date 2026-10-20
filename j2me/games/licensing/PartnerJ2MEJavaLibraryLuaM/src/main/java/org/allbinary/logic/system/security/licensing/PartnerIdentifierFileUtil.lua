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
-- package org.allbinary.logic.system.security.licensing

-- local InputStream = require("java.io.InputStream")
-- local InputStreamReader = require("java.io.InputStreamReader")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local PartnerIdentifierFileUtil = {}
PartnerIdentifierFileUtil.__index = PartnerIdentifierFileUtil
PartnerIdentifierFileUtil.className = "PartnerIdentifierFileUtil"

function PartnerIdentifierFileUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.FILE_NAME = "partner.txt"
end

function PartnerIdentifierFileUtil.new()
    local self = setmetatable({}, PartnerIdentifierFileUtil)
    self:_init_fields()
    return self
end


function PartnerIdentifierFileUtil.getInstance()
        return PartnerIdentifierFileUtil.instance
end


function PartnerIdentifierFileUtil:get()
        local try_ok, try_error = pcall(function()
            local resourceUtil = ResourceUtil.getInstance()
            local inputStream = resourceUtil:getResourceAsStream(self.FILE_NAME)
            local inputStreamReader = InputStreamReader.new(inputStream)
            local chars = java_new_array("\0", 30)
            local size = inputStreamReader:read(chars)
            local partnerString = StringUtil.getInstance().EMPTY_STRING
            if size > 0 then
                partnerString = String.new(chars, 0, size)
            end
            inputStreamReader:close()
            return partnerString
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET, e)
            return StringUtil.getInstance().NULL_STRING
        end
end

PartnerIdentifierFileUtil.instance = PartnerIdentifierFileUtil.new()

return PartnerIdentifierFileUtil

