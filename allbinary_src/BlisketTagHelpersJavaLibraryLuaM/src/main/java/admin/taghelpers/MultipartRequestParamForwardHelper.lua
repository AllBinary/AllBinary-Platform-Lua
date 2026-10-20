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
-- package admin.taghelpers

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local GLOBALS2 = require("org.allbinary.globals.GLOBALS2")
local RequestMapInterface = require("org.allbinary.logic.communication.http.request.RequestMapInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local HelperTag = require("tags.HelperTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MultipartRequestParamForwardHelper = {}
MultipartRequestParamForwardHelper.__index = MultipartRequestParamForwardHelper
MultipartRequestParamForwardHelper.className = "MultipartRequestParamForwardHelper"

function MultipartRequestParamForwardHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.pageContext = nil
    self.requestMapInterface = nil
    self.page = nil
    self.command = nil
    self.paramVector = nil
end


function MultipartRequestParamForwardHelper.new(parentHelperTag, page, command, paramVector, pageContext)
    local self = setmetatable({}, MultipartRequestParamForwardHelper)
    self:_init_fields()
        self.pageContext = pageContext
        self.page = page
        self.command = command
        self.paramVector = paramVector
        self.requestMapInterface = InventoryItemViewParentTagHelper.getInstance():getRequestMapInterface(parentHelperTag)
    return self
end


-- throws Exception
function MultipartRequestParamForwardHelper:forward()
        local try_ok, try_error = pcall(function()
            if self:shouldForward() then
                local params = self:getParams()
                local stringBuffer = StringMaker.new()
                stringBuffer:append(self.page)
                stringBuffer:append(params)
                self.pageContext:forward(tostring(stringBuffer))
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, "forward()", e)
            end
        end
end


function MultipartRequestParamForwardHelper:getParams()
        local commonSeps = CommonSeps.getInstance()
        local AMP = commonSeps.AMPERSAND
        local QUESTION = commonSeps.QUESTION
        local EQUALS = commonSeps.EQUALS
        local hashMap = self.requestMapInterface:getRequestHashMap()
        local stringBuffer = StringMaker.new()
        local size = self.paramVector:size()
        for index = 0, size - 1 do
            local key = self.paramVector:get(index)
            local value = hashMap:get(key)
            if index ~= 0 then
                stringBuffer:append(AMP)
            else
                stringBuffer:append(QUESTION)
            end
            stringBuffer:append(key)
            stringBuffer:append(EQUALS)
            stringBuffer:append(value)
        end
        return tostring(stringBuffer)
end


function MultipartRequestParamForwardHelper:shouldForward()
        local hashMap = self.requestMapInterface:getRequestHashMap()
        local requestCommand = hashMap:get(self.GLOBALS2.ADMINCOMMAND)
        if StringValidationUtil.getInstance():isEmpty(self.command) or (not StringValidationUtil.getInstance():isEmpty(requestCommand) and ((self.command < requestCommand and -1) or (self.command > requestCommand and 1) or 0) == 0) then
            return true
        end
        return false
end

return MultipartRequestParamForwardHelper

