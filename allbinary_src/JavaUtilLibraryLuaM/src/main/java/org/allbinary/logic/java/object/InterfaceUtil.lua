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
-- package org.allbinary.logic.java.anyType

local StringMaker = require("org.allbinary.logic.string.StringMaker")
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

local InterfaceUtil = {}
InterfaceUtil.__index = InterfaceUtil
InterfaceUtil.className = "InterfaceUtil"


function InterfaceUtil.new()
    local self = setmetatable({}, InterfaceUtil)
    return self
end


function InterfaceUtil.viewAll(myClass, lineBreak)
        local stringBuffer = StringMaker.new()
        local interfaces = myClass:getInterfaces()
        stringBuffer:append(lineBreak)
        stringBuffer:append("Interfaces: ")
        stringBuffer:append(lineBreak)
        for index = 0, (interfaces.n or #interfaces) - 1 do
            stringBuffer:append("Interface: ")
            stringBuffer:append(interfaces[index + 1]:getName())
            stringBuffer:append(lineBreak)
        end
        return tostring(stringBuffer)
end


function InterfaceUtil.getClass(interfaceName, interfaces)
        if interfaceName ~= nil and interfaces ~= nil and (interfaces.n or #interfaces) > 0 then
            for index = 0, (interfaces.n or #interfaces) - 1 do
                if interfaces[index + 1]:getName():indexOf(interfaceName) >= 0 then
                    return interfaces[index + 1]
                end
            end
        end
        return nil
end


function InterfaceUtil.isImplemented(clazz, anyType)
        local classes = getmetatable(anyType):getInterfaces()
        for index = 0, (classes.n or #classes) - 1 do
            if clazz:getName():compareTo(classes[index + 1]:getName()) == 0 then
                return true
            end
        end
        return false
end


-- Java overloaded method: Lua keeps the last definition
function InterfaceUtil.isImplemented(className, anyType)
        local classes = getmetatable(anyType):getInterfaces()
        for index = 0, (classes.n or #classes) - 1 do
            if classes[index + 1]:getName():indexOf(className) == 0 then
                return true
            end
        end
        return false
end


function InterfaceUtil.isImplementedView(clazz, anyType)
        local stringBuffer = StringMaker.new()
        local classes = getmetatable(anyType):getInterfaces()
        stringBuffer:append("isImplementedView: \n")
        for index = 0, (classes.n or #classes) - 1 do
            stringBuffer:append(clazz:getName())
            stringBuffer:append(" should be = ")
            stringBuffer:append(classes[index + 1]:getName())
            stringBuffer:append(classes[index + 1]:getName())
            stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        end
        return tostring(stringBuffer)
end

return InterfaceUtil

