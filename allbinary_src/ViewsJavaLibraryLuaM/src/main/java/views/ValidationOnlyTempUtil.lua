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
-- package views

local ValidationOnlyTempUtil = {}
package.loaded["views.ValidationOnlyTempUtil"] = ValidationOnlyTempUtil

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = java_lazy("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

--Replace when validation node is added
-- class table ValidationOnlyTempUtil is declared before the requires
ValidationOnlyTempUtil.__index = ValidationOnlyTempUtil
ValidationOnlyTempUtil.className = "ValidationOnlyTempUtil"
ValidationOnlyTempUtil.javaClassName = "views.ValidationOnlyTempUtil"

function ValidationOnlyTempUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ValidationOnlyTempUtil.getInstance()
        return ValidationOnlyTempUtil.instance_f
end


function ValidationOnlyTempUtil._jinit(self)
    ValidationOnlyTempUtil._init_fields(self)
    return self
end

function ValidationOnlyTempUtil.new(...)
    local self = setmetatable({}, ValidationOnlyTempUtil)
    ValidationOnlyTempUtil._jinit(self, ...)
    return self
end


-- throws Exception
function ValidationOnlyTempUtil:view(validationComponentInterface)
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF("View Name: " .. validationComponentInterface:getTransformInfoInterface():getName(), self, "view()")
            end
            do return "__jreturn", StringUtil.getInstance().EMPTY_STRING end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

ValidationOnlyTempUtil.instance_f = ValidationOnlyTempUtil.new()

return ValidationOnlyTempUtil

