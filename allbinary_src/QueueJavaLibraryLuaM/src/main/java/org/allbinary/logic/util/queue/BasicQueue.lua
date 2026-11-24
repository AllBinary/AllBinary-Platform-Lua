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
-- package org.allbinary.logic.util.queue

local BasicQueue = {}
package.loaded["org.allbinary.logic.util.queue.BasicQueue"] = BasicQueue

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table BasicQueue is declared before the requires
BasicQueue.__index = BasicQueue
BasicQueue.className = "BasicQueue"
BasicQueue.javaClassName = "org.allbinary.logic.util.queue.BasicQueue"

function BasicQueue:_init_fields()
    self.queueVector = BasicArrayListD.new()
end


function BasicQueue._jinit(self)
    BasicQueue._init_fields(self)
    return self
end

function BasicQueue.new(...)
    local self = setmetatable({}, BasicQueue)
    BasicQueue._jinit(self, ...)
    return self
end


-- throws Exception
function BasicQueue:offer(anyType)
        self.queueVector:add(anyType)
        return true
end


function BasicQueue:remove(anyType)
        self.queueVector:remove(anyType)
end


function BasicQueue:removeLast()
        local anyType = self.queueVector:get(self.queueVector:size() - 1)
        self.queueVector:remove(anyType)
        return anyType
end

return BasicQueue

