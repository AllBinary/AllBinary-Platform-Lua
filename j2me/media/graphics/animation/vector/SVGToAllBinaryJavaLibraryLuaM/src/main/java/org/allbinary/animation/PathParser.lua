-- Generated Code Do Not Modify
-- package org.allbinary.animation

local PathParser = {}
package.loaded["org.allbinary.animation.PathParser"] = PathParser

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
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local FixedPoint = java_lazy("org.allbinary.animation.FixedPoint")
local PGUtil = java_lazy("org.allbinary.animation.PGUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table PathParser is declared before the requires
PathParser.__index = PathParser
PathParser.className = "PathParser"
PathParser.javaClassName = "org.allbinary.animation.PathParser"

function PathParser._jinit(self)
    return self
end

function PathParser.new()
    return PathParser._jinit(setmetatable({}, PathParser))
end


function PathParser.tokenize(d)
        local tokens = BasicArrayListD.new()
        local sb = require("java.lang.StringBuffer").new()
        for i = 0, #d - 1 do
            local c = string.sub(d, (i) + 1, (i) + 1)
            if rawequal(c, " ") or rawequal(c, ",") or rawequal(c, "\t") or rawequal(c, "\n") or rawequal(c, "\r") then
                if sb:length() > 0 then
                    tokens:add(tostring(sb))
                    sb:setLength(0)
                end
            elseif rawequal(c, "M") or rawequal(c, "m") or rawequal(c, "L") or rawequal(c, "l") or rawequal(c, "V") or rawequal(c, "v") or rawequal(c, "C") or rawequal(c, "c") or rawequal(c, "Z") or rawequal(c, "z") then
                if sb:length() > 0 then
                    tokens:add(tostring(sb))
                    sb:setLength(0)
                end
                tokens:add(tostring(c))
            else
                sb:append(c)
            end
        end
        if sb:length() > 0 then
            tokens:add(tostring(sb))
        end
        local res = java_new_array(nil, tokens:size())
        tokens:toArrayType(res)
        return res
end


function PathParser.parsePath(d, outX, outY, maxPoints)
        local tokens = PathParser.tokenize(d)
        local count = {jt = "I", 0}
        local fixedPoint = FixedPoint.getInstance()
        local curX = 0
        local curY = 0
        local startX = 0
        local startY = 0
        local idx = 0
        while idx < (tokens.n or #tokens) do
            local tok = tokens[(function() local value = idx idx = value + 1 return value end)() + 1]
            local cmd = string.sub(tok, (0) + 1, (0) + 1)
            if rawequal(cmd, "M") or rawequal(cmd, "m") then
                local x = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                local y = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                if rawequal(cmd, "m") then
                    x = x + (curX)
                    y = y + (curY)
                end
                curX = x
                curY = y
                startX = x
                startY = y
                outX[count[1] + 1] = curX
                outY[count[1] + 1] = curY
                count[1] = count[1] + 1
            elseif rawequal(cmd, "L") or rawequal(cmd, "l") then
                local x = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                local y = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                if rawequal(cmd, "l") then
                    x = x + (curX)
                    y = y + (curY)
                end
                curX = x
                curY = y
                outX[count[1] + 1] = curX
                outY[count[1] + 1] = curY
                count[1] = count[1] + 1
            elseif rawequal(cmd, "V") or rawequal(cmd, "v") then
                local y = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                if rawequal(cmd, "v") then
                    y = y + (curY)
                end
                curY = y
                outX[count[1] + 1] = curX
                outY[count[1] + 1] = curY
                count[1] = count[1] + 1
            elseif rawequal(cmd, "C") or rawequal(cmd, "c") then
                local x1 = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                local y1 = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                local x2 = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                local y2 = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                local x3 = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                local y3 = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                if rawequal(cmd, "c") then
                    x1 = x1 + (curX)
                    y1 = y1 + (curY)
                    x2 = x2 + (curX)
                    y2 = y2 + (curY)
                    x3 = x3 + (curX)
                    y3 = y3 + (curY)
                end
                PGUtil.getInstance():flattenCubicBezier(curX, curY, x1, y1, x2, y2, x3, y3, outX, outY, count, maxPoints)
                curX = x3
                curY = y3
            elseif rawequal(cmd, "Z") or rawequal(cmd, "z") then
                curX = startX
                curY = startY
                outX[count[1] + 1] = curX
                outY[count[1] + 1] = curY
                count[1] = count[1] + 1
            end
            while idx < (tokens.n or #tokens) and not (PathParser.isCommand(tokens[idx + 1])) do
                if rawequal(cmd, "M") or rawequal(cmd, "m") or rawequal(cmd, "L") or rawequal(cmd, "l") then
                    local x = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                    local y = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                    if rawequal(cmd, "m") or rawequal(cmd, "l") then
                        x = x + (curX)
                        y = y + (curY)
                    end
                    curX = x
                    curY = y
                    outX[count[1] + 1] = curX
                    outY[count[1] + 1] = curY
                    count[1] = count[1] + 1
                elseif rawequal(cmd, "V") or rawequal(cmd, "v") then
                    local y = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                    if rawequal(cmd, "v") then
                        y = y + (curY)
                    end
                    curY = y
                    outX[count[1] + 1] = curX
                    outY[count[1] + 1] = curY
                    count[1] = count[1] + 1
                end
            end
        end
        return count[1]
end


function PathParser.isCommand(tok)
        local c = string.sub(tok, (0) + 1, (0) + 1)
        return ((string.find("MmLlVvCcZz", c, 1, true) or 0) - 1) >= 0
end

return PathParser

