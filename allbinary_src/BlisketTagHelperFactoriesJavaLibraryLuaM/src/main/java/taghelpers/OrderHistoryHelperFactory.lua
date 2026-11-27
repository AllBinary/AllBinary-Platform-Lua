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
-- package taghelpers

local OrderHistoryHelperFactory = {}
package.loaded["taghelpers.OrderHistoryHelperFactory"] = OrderHistoryHelperFactory

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
-- local PageContext = require("javax.servlet.jsp.PageContext")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LicensingException = java_lazy("org.allbinary.logic.system.security.licensing.LicensingException")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local OrderHistoryHelper = java_lazy("taghelpers.OrderHistoryHelper")

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

-- class table OrderHistoryHelperFactory is declared before the requires
OrderHistoryHelperFactory.__index = OrderHistoryHelperFactory
OrderHistoryHelperFactory.className = "OrderHistoryHelperFactory"
OrderHistoryHelperFactory.javaClassName = "taghelpers.OrderHistoryHelperFactory"

function OrderHistoryHelperFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function OrderHistoryHelperFactory._jinit(self)
    OrderHistoryHelperFactory._init_fields(self)
    return self
end

function OrderHistoryHelperFactory.new(...)
    local self = setmetatable({}, OrderHistoryHelperFactory)
    OrderHistoryHelperFactory._jinit(self, ...)
    return self
end


-- throws LicensingException
function OrderHistoryHelperFactory:getInstance(hashMap, pageContext)
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", OrderHistoryHelper.new(hashMap, pageContext) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return OrderHistoryHelperFactory

