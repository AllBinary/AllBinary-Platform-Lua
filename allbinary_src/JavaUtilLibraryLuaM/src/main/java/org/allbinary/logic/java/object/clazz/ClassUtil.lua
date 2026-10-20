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
-- package org.allbinary.logic.java.anyType.clazz

local ConstructorUtil = require("org.allbinary.logic.java.anyType.ConstructorUtil")
local InterfaceUtil = require("org.allbinary.logic.java.anyType.InterfaceUtil")
local MethodUtil = require("org.allbinary.logic.java.anyType.MethodUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ClassUtil = {}
ClassUtil.__index = ClassUtil
ClassUtil.className = "ClassUtil"


function ClassUtil.new()
    local self = setmetatable({}, ClassUtil)
    return self
end


function ClassUtil.viewAll(anyType, lineBreak)
        if anyType ~= nil then
            return ClassUtil.viewAll(getmetatable(anyType), lineBreak)
        else
            return "Object Null"
        end
end


-- Java overloaded method: Lua keeps the last definition
function ClassUtil.viewAll(myClass, lineBreak)
        if myClass ~= nil then
            local stringBuffer = StringMaker.new()
            local classes = myClass:getClasses()
            stringBuffer:append(lineBreak)
            stringBuffer:append("Class: ")
            stringBuffer:append(myClass:getName())
            stringBuffer:append(" uses ")
            stringBuffer:appendint((classes.n or #classes))
            stringBuffer:append(" other classes")
            stringBuffer:append(lineBreak)
            stringBuffer:append(lineBreak)
            stringBuffer:append("Classes: ")
            stringBuffer:append(lineBreak)
            for index = 0, (classes.n or #classes) - 1 do
                stringBuffer:append("Class: ")
                stringBuffer:append(classes[index + 1]:getName())
                stringBuffer:append(lineBreak)
            end
            stringBuffer:append(InterfaceUtil.viewAll(myClass, lineBreak))
            stringBuffer:append(lineBreak)
            stringBuffer:append(ConstructorUtil.viewAll(myClass, lineBreak))
            stringBuffer:append(lineBreak)
            stringBuffer:append(MethodUtil.viewAll(myClass, lineBreak))
            return tostring(stringBuffer)
        else
            return "Class Null"
        end
end

return ClassUtil

