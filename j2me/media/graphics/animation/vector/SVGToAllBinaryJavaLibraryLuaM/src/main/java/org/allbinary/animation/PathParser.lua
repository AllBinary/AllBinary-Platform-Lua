-- Generated Code Do Not Modify
-- package org.allbinary.animation

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local PathParser = {}
PathParser.__index = PathParser
PathParser.className = "PathParser"

function PathParser.new()
    local self = setmetatable({}, PathParser)
    return self
end


function PathParser.tokenize(d)
        local tokens = BasicArrayListD.new()
        local sb = StringBuffer.new()
        for i = 0, #d - 1 do
            local c = string.sub(d, (i) + 1, (i) + 1)
            if c == " " or c == "," or c == "\t" or c == "\n" or c == "\r" then
                if sb:length() > 0 then
                    tokens:add(tostring(sb))
                    sb:setLength(0)
                end
            elseif c == "M" or c == "m" or c == "L" or c == "l" or c == "V" or c == "v" or c == "C" or c == "c" or c == "Z" or c == "z" then
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
        local count = {0}
        local fixedPoint = FixedPoint.getInstance()
        local curX = 0
        local curY = 0
        local startX = 0
        local startY = 0
        local idx = 0
        while idx < (tokens.n or #tokens) do
            local tok = tokens[(function() local value = idx idx = value + 1 return value end)() + 1]
            local cmd = string.sub(tok, (0) + 1, (0) + 1)
            if cmd == "M" or cmd == "m" then
                local x = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                local y = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                if cmd == "m" then
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
            elseif cmd == "L" or cmd == "l" then
                local x = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                local y = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                if cmd == "l" then
                    x = x + (curX)
                    y = y + (curY)
                end
                curX = x
                curY = y
                outX[count[1] + 1] = curX
                outY[count[1] + 1] = curY
                count[1] = count[1] + 1
            elseif cmd == "V" or cmd == "v" then
                local y = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                if cmd == "v" then
                    y = y + (curY)
                end
                curY = y
                outX[count[1] + 1] = curX
                outY[count[1] + 1] = curY
                count[1] = count[1] + 1
            elseif cmd == "C" or cmd == "c" then
                local x1 = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                local y1 = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                local x2 = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                local y2 = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                local x3 = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                local y3 = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                if cmd == "c" then
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
            elseif cmd == "Z" or cmd == "z" then
                curX = startX
                curY = startY
                outX[count[1] + 1] = curX
                outY[count[1] + 1] = curY
                count[1] = count[1] + 1
            end
            while idx < (tokens.n or #tokens) and not PathParser.isCommand(tokens[idx + 1]) do
                if cmd == "M" or cmd == "m" or cmd == "L" or cmd == "l" then
                    local x = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                    local y = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                    if cmd == "m" or cmd == "l" then
                        x = x + (curX)
                        y = y + (curY)
                    end
                    curX = x
                    curY = y
                    outX[count[1] + 1] = curX
                    outY[count[1] + 1] = curY
                    count[1] = count[1] + 1
                elseif cmd == "V" or cmd == "v" then
                    local y = fixedPoint:toFixed(tonumber(tokens[(function() local value = idx idx = value + 1 return value end)() + 1]))
                    if cmd == "v" then
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

