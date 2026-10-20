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

local AcceptableResponse = {}
AcceptableResponse.__index = AcceptableResponse
AcceptableResponse.className = "AcceptableResponse"

function AcceptableResponse:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function AcceptableResponse.new(candidate, tagName, index)
    local self = setmetatable({}, AcceptableResponse)
    self:_init_fields()
        self.logUtil:putF(tagName, self, self.commonStrings.CONSTRUCTOR)
        local acceptableResponseUtil = AcceptableResponseUtil.getInstance()
        acceptableResponseUtil.candidateVector:addAt(index, candidate)
        acceptableResponseUtil.tagNameVector:addAt(index, tagName)
    return self
end

return AcceptableResponse

