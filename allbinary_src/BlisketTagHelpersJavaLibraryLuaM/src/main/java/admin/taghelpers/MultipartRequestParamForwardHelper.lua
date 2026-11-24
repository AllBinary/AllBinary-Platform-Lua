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

local MultipartRequestParamForwardHelper = {}
package.loaded["admin.taghelpers.MultipartRequestParamForwardHelper"] = MultipartRequestParamForwardHelper

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
local RequestMapInterface = java_lazy("org.allbinary.logic.communication.http.request.RequestMapInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local HelperTag = java_lazy("tags.HelperTag")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local InventoryItemViewParentTagHelper = java_lazy("admin.taghelpers.InventoryItemViewParentTagHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table MultipartRequestParamForwardHelper is declared before the requires
MultipartRequestParamForwardHelper.__index = MultipartRequestParamForwardHelper
MultipartRequestParamForwardHelper.className = "MultipartRequestParamForwardHelper"
MultipartRequestParamForwardHelper.javaClassName = "admin.taghelpers.MultipartRequestParamForwardHelper"

function MultipartRequestParamForwardHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.pageContext == nil then self.pageContext = nil end
    if self.requestMapInterface == nil then self.requestMapInterface = nil end
    if self.page == nil then self.page = nil end
    if self.command == nil then self.command = nil end
    if self.paramVector == nil then self.paramVector = nil end
end


function MultipartRequestParamForwardHelper._jinit(self, parentHelperTag, page, command, paramVector, pageContext)
    MultipartRequestParamForwardHelper._init_fields(self)
        self.pageContext = pageContext
        self.page = page
        self.command = command
        self.paramVector = paramVector
        self.requestMapInterface = InventoryItemViewParentTagHelper.getInstance():getRequestMapInterface(parentHelperTag)
    return self
end

function MultipartRequestParamForwardHelper.new(...)
    local self = setmetatable({}, MultipartRequestParamForwardHelper)
    MultipartRequestParamForwardHelper._jinit(self, ...)
    return self
end


-- throws Exception
function MultipartRequestParamForwardHelper:forward()
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
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
        local requestCommand = hashMap:get(GLOBALS2.ADMINCOMMAND)
        if StringValidationUtil.getInstance():isEmpty(self.command) or (not StringValidationUtil.getInstance():isEmpty(requestCommand) and ((self.command < requestCommand and -1) or (self.command > requestCommand and 1) or 0) == 0) then
            return true
        end
        return false
end

return MultipartRequestParamForwardHelper

