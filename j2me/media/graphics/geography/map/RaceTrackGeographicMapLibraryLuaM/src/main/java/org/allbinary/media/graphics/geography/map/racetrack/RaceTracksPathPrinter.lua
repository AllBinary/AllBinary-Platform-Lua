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
-- package org.allbinary.media.graphics.geography.map.racetrack

local RaceTracksPathPrinter = {}
package.loaded["org.allbinary.media.graphics.geography.map.racetrack.RaceTracksPathPrinter"] = RaceTracksPathPrinter

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")

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

-- class table RaceTracksPathPrinter is declared before the requires
RaceTracksPathPrinter.__index = RaceTracksPathPrinter
RaceTracksPathPrinter.className = "RaceTracksPathPrinter"
RaceTracksPathPrinter.javaClassName = "org.allbinary.media.graphics.geography.map.racetrack.RaceTracksPathPrinter"

function RaceTracksPathPrinter._jinit(self)
    return self
end

function RaceTracksPathPrinter.new()
    return RaceTracksPathPrinter._jinit(setmetatable({}, RaceTracksPathPrinter))
end


function RaceTracksPathPrinter:printPath(list)
        local size = list:size()
        for index = 0, size - 1 do
            local anyType = list:get(index)
            PreLogUtil.put(tostring(StringMaker.new():append("pathList.add(cellPositionFactory.getInstance"):append(tostring(anyType)):append(");")), self, "printPath")
        end
end


function RaceTracksPathPrinter:printPaths(list)
        local size = list:size()
        for index = 0, size - 1 do
            print(tostring(StringMaker.new():append(" Path "):appendint(index):append(CommonLabels.getInstance().COLON_SEP)))
            self:printPath(list:get(index))
        end
end

return RaceTracksPathPrinter

