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
-- package org.allbinary.game.ag.vector

local MineVectorData = {}
package.loaded["org.allbinary.game.ag.vector.MineVectorData"] = MineVectorData

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

-- class table MineVectorData is declared before the requires
MineVectorData.__index = MineVectorData
MineVectorData.className = "MineVectorData"
MineVectorData.javaClassName = "org.allbinary.game.ag.vector.MineVectorData"


function MineVectorData._jinit(self)
    return self
end

function MineVectorData.new(...)
    local self = setmetatable({}, MineVectorData)
    MineVectorData._jinit(self, ...)
    return self
end

MineVectorData.points = {{{jt = "I", 10, 5}, {jt = "I", 2, 6}, {jt = "I", 1000, 1000}, {jt = "I", 2, 2}, {jt = "I", 10, 9}, {jt = "I", 1000, 1000}, {jt = "I", 10, 2}, {jt = "I", 2, 9}, {jt = "I", 1000, 1000}, {jt = "I", 2, 5}, {jt = "I", 10, 6}, {jt = "I", 1000, 1000}, {jt = "I", 7, 9}, {jt = "I", 5, 2}, {jt = "I", 1000, 1000}, {jt = "I", 7, 2}, {jt = "I", 5, 9}, {jt = "I", 1000, 1000}}}

return MineVectorData

