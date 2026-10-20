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

local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HttpData = {}
HttpData.__index = HttpData
HttpData.className = "HttpData"

function HttpData:_init_fields()
    self.EQUALS = nil
    self.PARAM_SEP = nil
    self.URL_PARAM_SEP = nil
    self.URL_LABEL = "Url: "
end


function HttpData.getInstance()
        return HttpData.instance
end


function HttpData.new()
    local self = setmetatable({}, HttpData)
    self:_init_fields()
        local commonSeps = CommonSeps.getInstance()
        self.EQUALS = commonSeps.EQUALS
        self.PARAM_SEP = commonSeps.AMPERSAND
        self.URL_PARAM_SEP = commonSeps.QUESTION
    return self
end

HttpData.instance = HttpData.new()

return HttpData

