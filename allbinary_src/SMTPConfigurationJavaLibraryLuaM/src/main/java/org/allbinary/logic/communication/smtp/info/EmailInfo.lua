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
-- package org.allbinary.logic.communication.smtp.info

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

local EmailInfo = {}
EmailInfo.__index = EmailInfo
EmailInfo.className = "EmailInfo"

function EmailInfo:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicEmailInfo = nil
    self.htmlAttachment = nil
    self.contentBase = nil
end

function EmailInfo.new(...)
    local count = select("#", ...)
    if count == 1 then return EmailInfo._new1(...)
    elseif count == 3 then return EmailInfo._new3(...)
    end
end


function EmailInfo._new1(basicEmailInfo)
    local self = setmetatable({}, EmailInfo)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.START, self, commonStrings.CONSTRUCTOR)
        end
        self:init(basicEmailInfo, nil, nil)
    return self
end


function EmailInfo._new3(basicEmailInfo, htmlAttachment, contentBase)
    local self = setmetatable({}, EmailInfo)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGING) then
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:putF(commonStrings.START, self, commonStrings.CONSTRUCTOR)
        end
        self:init(basicEmailInfo, nil, nil)
    return self
end


function EmailInfo:init(basicEmailInfo, htmlAttachment, contentBase)
        self.basicEmailInfo = basicEmailInfo
        self.htmlAttachment = htmlAttachment
        self.contentBase = contentBase
end


function EmailInfo:getBasicEmailInfo()
        return self.basicEmailInfo
end


function EmailInfo:getHtmlAttachment()
        return self.htmlAttachment
end


function EmailInfo:getContentBase()
        return self.contentBase
end


function EmailInfo:toString()
        return "Email Info: \n " .. tostring(self:getBasicEmailInfo())
end
EmailInfo.__tostring = function(self) return self:toString() end

return EmailInfo

