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
-- package admin.tags

local ParentInventoryTagHelper = {}
package.loaded["admin.tags.ParentInventoryTagHelper"] = ParentInventoryTagHelper

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

-- local Tag = require("javax.servlet.jsp.tagext.Tag")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local HelperTag = java_lazy("tags.HelperTag")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_instanceof(object, class)
    class = java_real(class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
end

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

-- class table ParentInventoryTagHelper is declared before the requires
ParentInventoryTagHelper.__index = ParentInventoryTagHelper
ParentInventoryTagHelper.className = "ParentInventoryTagHelper"
ParentInventoryTagHelper.javaClassName = "admin.tags.ParentInventoryTagHelper"

function ParentInventoryTagHelper._jinit(self)
    return self
end

function ParentInventoryTagHelper.new()
    return ParentInventoryTagHelper._jinit(setmetatable({}, ParentInventoryTagHelper))
end


function ParentInventoryTagHelper.getInstance()
        return ParentInventoryTagHelper.instance_f
end


-- throws Exception
function ParentInventoryTagHelper:isValid(tagClass, parentTag)
        if rawequal(parentTag, nil) then
            error(require("java.lang.Exception").new("Must have parent tag."), 0)
        elseif not (java_instanceof(parentTag, HelperTag)) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Must have at least a ")
            stringBuffer:append("tags.HelperTag")
            stringBuffer:append(" as parent")
            stringBuffer:append("and not: ")
            stringBuffer:append((getmetatable(parentTag).javaClassName or getmetatable(parentTag).className))
            error(require("java.lang.Exception").new(tostring(stringBuffer)), 0)
        end
end

ParentInventoryTagHelper.instance_f = ParentInventoryTagHelper.new()

return ParentInventoryTagHelper

