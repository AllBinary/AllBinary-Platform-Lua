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

-- local Tag = require("javax.servlet.jsp.tagext.Tag")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ParentInventoryTagHelper = {}
ParentInventoryTagHelper.__index = ParentInventoryTagHelper
ParentInventoryTagHelper.className = "ParentInventoryTagHelper"

function ParentInventoryTagHelper.new()
    local self = setmetatable({}, ParentInventoryTagHelper)
    return self
end


function ParentInventoryTagHelper.getInstance()
        return ParentInventoryTagHelper.instance
end


-- throws Exception
function ParentInventoryTagHelper:isValid(tagClass, parentTag)
        if parentTag == nil then
            error(java_exception("Exception", "Must have parent tag."), 0)
        elseif not (java_instanceof(parentTag, HelperTag)) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Must have at least a ")
            stringBuffer:append("tags.HelperTag")
            stringBuffer:append(" as parent")
            stringBuffer:append("and not: ")
            stringBuffer:append(getmetatable(parentTag).className)
            error(java_exception("Exception", tostring(stringBuffer)), 0)
        end
end

ParentInventoryTagHelper.instance = ParentInventoryTagHelper.new()

return ParentInventoryTagHelper

